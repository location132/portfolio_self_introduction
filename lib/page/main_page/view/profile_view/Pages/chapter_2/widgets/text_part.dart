import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../animation/chapter2_text_ani.dart';

class TextPart extends StatefulWidget {
  final int scrollCount;
  final int previousCount;
  const TextPart({
    super.key,
    required this.scrollCount,
    required this.previousCount,
  });

  @override
  State<TextPart> createState() => _TextPartState();
}

class _TextPartState extends State<TextPart> with TickerProviderStateMixin {
  late final Chapter2TextAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animation = Chapter2TextAnimation(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.scrollCount == 10) {
        _animation.text1AnimationStart();
      }
    });
  }

  @override
  void didUpdateWidget(TextPart oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.previousCount < widget.scrollCount) {
      //다음 페이지로 넘어갔을 때,
      if (widget.scrollCount == 11) {
        _animation.text2AnimationStart();
      } else if (widget.scrollCount == 12) {
        _animation.text3AnimationStart();
      }
    } else if (widget.previousCount > widget.scrollCount) {
      //이전 페이지로 돌아갔을 때,
      if (widget.previousCount == 11 && widget.scrollCount == 10) {
        _animation.reverseHide();
      } else if (widget.previousCount == 10 && widget.scrollCount == 9) {
        _animation.reverseShow();
      } else if (widget.previousCount == 12 && widget.scrollCount == 11) {
        _animation.finishHide();
      }
    }
  }

  @override
  void dispose() {
    print('check ==> dispose');
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: widget.scrollCount == 9 ? 0 : 1,
          child: SlideTransition(
            position: (widget.scrollCount == 10 &&
                    !(widget.previousCount > widget.scrollCount))
                ? _animation.textMoveShow
                : _animation.textMoveHide,
            child: FadeTransition(
              opacity: (widget.scrollCount == 10 &&
                      !(widget.previousCount > widget.scrollCount))
                  ? _animation.textOpacityShow
                  : _animation.textOpacityHide,
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
          ),
        ),

        // 2번 텍스트 애니메이션
        Opacity(
          opacity: widget.scrollCount == 12 ? 0 : 1,
          child: SlideTransition(
            position: widget.scrollCount == 11 &&
                    !(widget.previousCount < widget.scrollCount)
                ? _animation.textMoveHide2
                : _animation.textMoveShow2,
            child: FadeTransition(
              opacity: widget.scrollCount == 11 &&
                      !(widget.previousCount < widget.scrollCount)
                  ? _animation.textOpacityHide2
                  : _animation.textOpacityShow2,
              child: Text(
                "이 모든 경험들이 쌓여,\n"
                " 9명의 개발자, 3명의 디자이너, 1명의 보안 전문가,\n"
                " 그리고 3명의 경영학 전공 친구들과 함께\n"
                " Klang 프로젝트와 잎사이 프로젝트를 기획부터 디자인 · 개발까지 진행하며\n\n"
                "하나의 작은 서비스를 우리 손으로 만들어내는 PM경험을 해보기도 했습니다.\n"
                " 저는 이 모든 경험들이 저를 여기까지 올라오게 만들어준\n"
                " Flutter 개밸자로서의 가장 커다란 대학 경험이라 생각합니다.",
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
