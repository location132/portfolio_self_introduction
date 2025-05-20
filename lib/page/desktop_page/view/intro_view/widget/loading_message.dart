import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/service/intro_service.dart';

class LoadingMessage extends StatefulWidget {
  final bool isChromeBrowser;
  // final bool isPad;
  final void Function(bool isChrome) isChromeBrowserWithCubit;
  const LoadingMessage({
    super.key,
    required this.isChromeBrowser,
    required this.isChromeBrowserWithCubit,
    // required this.isPad,
  });

  @override
  State<LoadingMessage> createState() => _LoadingMessageState();
}

class _LoadingMessageState extends State<LoadingMessage> {
  int remainingTime = 3;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _logs = [];
  late final IntroService introService;

  @override
  void initState() {
    super.initState();
    introService = IntroService();
    remainingTime = 3;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      introService.scheduleLogStep(
        context: context,
        list: _listKey.currentState!,
        onNewLog: (log) {
          setState(() {
            _logs.insert(0, log);
          });
        },
        onRemainingTimeChanged: (newTime) {
          setState(() {
            remainingTime = newTime;
          });
        },
        isChrome: widget.isChromeBrowser,
        // isPad: widget.isPad,
      );
    });
    widget.isChromeBrowserWithCubit(widget.isChromeBrowser);
  }

  @override
  void dispose() {
    introService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///  상단 메시지
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              remainingTime == 3
                  ? '사용자에 환경에 맞도록 화면 초기화 중...'
                  : '기다려주셔서 감사합니다. 곧 시작합니다.',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '예상 소요시간 $remainingTime초',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 1, thickness: 0.5),
          const SizedBox(height: 10),

          // 로그들
          AnimatedList(
            key: _listKey,
            initialItemCount: _logs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index, animation) {
              final log = _logs[index];
              Color logColor = Colors.white70;
              if (log.contains('[SUCCESS]')) {
                logColor = Colors.greenAccent;
              } else if (log.contains('[ERROR]')) {
                logColor = Colors.redAccent;
              } else if (log.contains('[INFO]')) {
                logColor = Colors.white70;
              } else if (log.contains('[PROCESS]')) {
                logColor = Colors.grey.shade400;
              } else if (log.contains('[SYSTEM]')) {
                logColor = Colors.white;
              }

              return SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    log,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'monospace',
                      color: logColor,
                      height: 1.2,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
