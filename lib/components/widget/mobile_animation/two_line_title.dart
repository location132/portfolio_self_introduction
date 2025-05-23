//2줄 타이틀

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class TwoLineTitle extends StatefulWidget {
  final bool isTitelText;
  final String title;

  final String subTitle;
  const TwoLineTitle({
    super.key,
    required this.isTitelText,
    required this.title,
    required this.subTitle,
  });

  @override
  State<TwoLineTitle> createState() => _TwoLineTitleState();
}

class _TwoLineTitleState extends State<TwoLineTitle>
    with TickerProviderStateMixin {
  late TextMoveAnimation _titleAnimation;
  late TextMoveAnimation _subTitleAnimation;

  @override
  void initState() {
    super.initState();
    _titleAnimation = TextMoveAnimation(vsync: this, beginDy: 1);
    _subTitleAnimation = TextMoveAnimation(vsync: this, beginDy: 1.5);
  }

  @override
  void didUpdateWidget(TwoLineTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTitelText) {
      _titleAnimation.forward();
      _subTitleAnimation.forward();
    } else {
      _titleAnimation.reverse();
      _subTitleAnimation.reverse();
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
      padding: const EdgeInsets.only(top: 40.0, left: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _titleAnimation.moveShow,
            child: FadeTransition(
              opacity: _titleAnimation.opacityShow,
              child: Text(
                widget.title,
                style: const TextStyle(
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
                child: Text(
                  widget.subTitle,
                  style: const TextStyle(
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
