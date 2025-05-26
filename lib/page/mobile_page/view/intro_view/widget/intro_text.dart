import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class IntroText extends StatefulWidget {
  final bool isFirstIntroText;
  const IntroText({super.key, required this.isFirstIntroText});

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: widget.isFirstIntroText,
      duration: 800,
      beginDy: 0.1,
      child: AnimatedOpacity(
        opacity: widget.isFirstIntroText ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 400),
        child: Center(
          child: Text(
            '\nMVVM패턴, 클린아키텍쳐, get it을 사용한 DI\n'
            'Cubit 패턴, Rive애니메이션, 생명주기까지\n'
            '\n많은 것을 공부하고 경험한 신입 개발자\n'
            '이정원입니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0.responsiveFont(context),
            ),
          ),
        ),
      ),
    );
  }
}
