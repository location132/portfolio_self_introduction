import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class IntroText extends StatefulWidget {
  final bool isFirstIntroText;
  final bool isSubTitle;
  const IntroText({
    super.key,
    required this.isFirstIntroText,
    required this.isSubTitle,
  });

  @override
  State<IntroText> createState() => _IntroTextState();
}

class _IntroTextState extends State<IntroText> with TickerProviderStateMixin {
  late TextMoveAnimation _introAnimation;

  @override
  void initState() {
    super.initState();
    _introAnimation = TextMoveAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(IntroText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSubTitle) {
      _introAnimation.forward();
    }
  }

  @override
  void dispose() {
    _introAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: widget.isFirstIntroText && !widget.isSubTitle ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: const Text(
            '\nMVVM패턴, 클린아키텍쳐, get it을 사용한 DI\n'
            'Cubit 패턴, Rive애니메이션, 생명주기까지',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
        SlideTransition(
          position: _introAnimation.moveShow,
          child: FadeTransition(
            opacity: _introAnimation.opacityShow,
            child: const Text(
              '\n많은 것을 공부하고 경험한 신입 개발자\n\n'
              '지금 바로 시작합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
