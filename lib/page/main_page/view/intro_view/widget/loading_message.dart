import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class LoadingMessage extends StatefulWidget {
  const LoadingMessage({super.key});

  @override
  State<LoadingMessage> createState() => _LoadingMessageState();
}

class _LoadingMessageState extends State<LoadingMessage> {
  int remainingTime = 3;
  Timer? _timer;
  final Random random = Random();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _logs = [];
  int _logStep = 0;

  @override
  void initState() {
    super.initState();

    remainingTime = 2 + random.nextInt(3);

    _timer = Timer.periodic(const Duration(milliseconds: 450), (t) {
      setState(() {
        String newLog;
        if (_logStep == 0) {
          newLog = '[INFO] 사용자의 화면 높이 감지 중...';
        } else if (_logStep == 1) {
          final screenHeight = MediaQuery.of(context).size.height.toInt();
          newLog = '[SUCCESS] 사용자의 화면 높이 감지 완료: $screenHeight.sh';
          remainingTime -= 1;
        } else if (_logStep == 2) {
          newLog = '[PROCESS] 높이를 모델로 변환 중...';
        } else if (_logStep == 3) {
          newLog = '[SUCCESS] 모델 변환 완료';
          remainingTime -= 1;
        } else if (_logStep == 4) {
          newLog = '[PROCESS] service.dart 초기화 중...';
        } else if (_logStep == 5) {
          newLog = '[SUCCESS] service.dart 로드 완료';
          remainingTime -= 1;
        } else if (_logStep == 6) {
          newLog = '[SYSTEM] 모든 준비 완료!\n\n\n'
              'emit(state.copyWith('
              'scrollModel: state.scrollModel'
              '.copyWith(profileViewState: ProfileViewState.active)));';
          _timer?.cancel();
        } else {
          newLog = '';
        }

        _logs.insert(0, newLog);
        _listKey.currentState?.insertItem(0);
        _logStep++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///  상단 메시지
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              '로딩 중... 예상 소요시간 $remainingTime초',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
                logColor = Colors.white;
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

          const SizedBox(height: 10),

          // 로딩 인디케이터
          LinearProgressIndicator(
            backgroundColor: Colors.grey.shade800,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 3,
          ),
        ],
      ),
    );
  }
}
