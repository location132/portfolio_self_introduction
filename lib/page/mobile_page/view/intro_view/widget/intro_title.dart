import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/animation/intro_ani.dart';

class IntroTitle extends StatefulWidget {
  final bool isTitelText;
  const IntroTitle({super.key, required this.isTitelText});

  @override
  State<IntroTitle> createState() => _IntroTitleState();
}

class _IntroTitleState extends State<IntroTitle> with TickerProviderStateMixin {
  late IntroAnimation _titleAnimation;
  late IntroAnimation _subTitleAnimation;

  @override
  void initState() {
    super.initState();
    _titleAnimation = IntroAnimation(vsync: this, beginDy: 1);
    _subTitleAnimation = IntroAnimation(vsync: this, beginDy: 1.5);
  }

  @override
  void didUpdateWidget(IntroTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTitelText) {
      _titleAnimation.forward();
      _subTitleAnimation.forward();
    }
  }

  @override
  void dispose() {
    _titleAnimation.dispose();
    _subTitleAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _titleAnimation.moveShow,
            child: FadeTransition(
              opacity: _titleAnimation.opacityShow,
              child: const Text(
                'Flutter Portfolio',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SlideTransition(
              position: _subTitleAnimation.moveShow,
              child: FadeTransition(
                opacity: _subTitleAnimation.opacityShow,
                child: const Text(
                  '2025년 나를 보여주기 위한 하나의 선택',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
