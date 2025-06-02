//2줄 타이틀

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class TwoLineTitle extends StatefulWidget {
  final bool isTitelText;
  final String title;
  final Color? color;
  final Color? subTitleColor;
  final double? subTitleFontSize;

  final String subTitle;
  const TwoLineTitle({
    super.key,
    required this.isTitelText,
    required this.title,
    required this.subTitle,
    this.color,
    this.subTitleColor,
    this.subTitleFontSize,
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
                style: TextStyle(
                  fontSize: 25.0.sp,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
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
                  style: TextStyle(
                    fontSize: widget.subTitleFontSize ?? 20.0.sp,
                    fontWeight: FontWeight.bold,
                    color: widget.subTitleColor,
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
