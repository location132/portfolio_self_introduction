import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/animation/chapter_2_ani.dart';

class TextPart extends StatefulWidget {
  final int scrollCount;
  const TextPart({super.key, required this.scrollCount});

  @override
  State<TextPart> createState() => _TextPartState();
}

class _TextPartState extends State<TextPart> with TickerProviderStateMixin {
  late Chapter2Animation _chapter2Animation;

  @override
  void initState() {
    super.initState();
    _chapter2Animation = Chapter2Animation(vsync: this);
    print('check ==> ');
    _chapter2Animation.animationWithTextForward();
  }

  @override
  void didUpdateWidget(TextPart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 11 &&
        !_chapter2Animation.isAnimationReverseActive) {
      _chapter2Animation.animationWithTextReverse();
    }
  }

  @override
  void dispose() {
    // _chapter2Animation.disposeWith2();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _chapter2Animation.textMoveAnimation1,
      child: FadeTransition(
        opacity: _chapter2Animation.textOpacityAnimation1,
        child: Text(
          "우리손으로 뭔가를 해보겠다는 노력\n"
          " 이 노력은 어느새, 하나의 프로젝트라는 꿈으로 이어졌습니다.\n\n"
          "처음엔 학생 몇 명이 모여 만든 엉망진창의 결과물.\n"
          " 완성도는 부족했지만,\n"
          " 우리 손으로 무언가를 만들어냈다는 그 기쁨은,\n"
          " 현재도 제가 개발공부를 하고, 계속 공부할 수 있도록 만들어주었습니다.",
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
