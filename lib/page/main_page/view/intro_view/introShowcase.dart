import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';

import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/loading_message.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/text_animation.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/wave_animation.dart';

class Introshowcase extends StatefulWidget {
  final MainPageState state;
  final bool isChromeBrowser;
  final void Function(bool isChrome) isChromeBrowserWithCubit;
  final void Function(TickerProvider vsync, {String message})
      initializeAnimations;

  const Introshowcase({
    super.key,
    required this.state,
    required this.initializeAnimations,
    required this.isChromeBrowser,
    required this.isChromeBrowserWithCubit,
  });

  @override
  State<Introshowcase> createState() => _IntroshowcaseState();
}

class _IntroshowcaseState extends State<Introshowcase> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 720),
          opacity: ProfileConditions.isInitStateLoaded(widget.state) ? 0 : 1,
          child: const Waves(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 100,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: ProfileConditions.isInitStateLoaded(widget.state) ? 0 : 1,
            duration: const Duration(milliseconds: 720),
            child: TextAnimation(
              state: widget.state,
              initializeAnimations: widget.initializeAnimations,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: ProfileConditions.isInitStateLoaded(widget.state) ? 1 : 0,
          duration: const Duration(milliseconds: 720),
          child: Center(
            child: LoadingMessage(
              isChromeBrowser: widget.isChromeBrowser,
              isChromeBrowserWithCubit: widget.isChromeBrowserWithCubit,
            ),
          ),
        ),
        Positioned(
          bottom: 100.sh,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: ProfileConditions.isInitStateLoaded(widget.state) ? 0 : 1,
            duration: const Duration(milliseconds: 720),
            child: widget.isChromeBrowser
                ? Padding(
                    padding: EdgeInsets.only(bottom: 30.sh),
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                      child: ScrollRive(),
                    ),
                  )
                : const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.redAccent),
                          SizedBox(width: 8),
                          Text(
                            '크롬 브라우저를 사용해주세요',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Chrome으로 접속 시, 더욱 부드러운 애니메이션과\n'
                        '다양한 Rive 효과를 경험할 수 있습니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
