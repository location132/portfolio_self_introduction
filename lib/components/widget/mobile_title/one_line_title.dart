//2줄 타이틀

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class OneLineTitle extends StatefulWidget {
  final bool isTitelText;
  final String title;
  const OneLineTitle({
    super.key,
    required this.isTitelText,
    required this.title,
  });

  @override
  State<OneLineTitle> createState() => _OneLineTitleState();
}

class _OneLineTitleState extends State<OneLineTitle>
    with TickerProviderStateMixin {
  late TextMoveAnimation _titleAnimation;

  @override
  void initState() {
    super.initState();
    _titleAnimation = TextMoveAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(OneLineTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTitelText) {
      _titleAnimation.forward();
    }
  }

  @override
  void dispose() {
    _titleAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20.0),
      child: SlideTransition(
        position: _titleAnimation.moveShow,
        child: FadeTransition(
          opacity: _titleAnimation.opacityShow,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
