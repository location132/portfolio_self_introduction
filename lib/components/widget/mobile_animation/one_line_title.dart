//2줄 타이틀

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class OneLineTitle extends StatefulWidget {
  final bool isTitelTextAniStart;
  final bool? isReverse;
  final String title;
  final Color? color;
  const OneLineTitle({
    super.key,
    required this.isTitelTextAniStart,
    this.isReverse,
    required this.title,
    this.color,
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
    if (widget.isTitelTextAniStart &&
        !_titleAnimation.showController.isCompleted) {
      _titleAnimation.forward();
    } else if (widget.isReverse == true &&
        _titleAnimation.showController.isCompleted) {
      _titleAnimation.reverse();
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
      padding: const EdgeInsets.only(top: 40.0, left: 32),
      child: SlideTransition(
        position: _titleAnimation.moveShow,
        child: FadeTransition(
          opacity: _titleAnimation.opacityShow,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 25.sp,
              color: widget.color ?? Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
