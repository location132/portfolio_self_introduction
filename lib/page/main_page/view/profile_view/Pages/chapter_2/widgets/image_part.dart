import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_2/animation/chapter2_img_ani.dart';

class ImagePart extends StatefulWidget {
  final int scrollCount;

  const ImagePart({super.key, required this.scrollCount});

  @override
  State<ImagePart> createState() => _ImagePartState();
}

class _ImagePartState extends State<ImagePart> with TickerProviderStateMixin {
  late Chapter2ImageAnimation _chapter2ImageAnimation;
  @override
  void initState() {
    super.initState();
    _chapter2ImageAnimation = Chapter2ImageAnimation(vsync: this);
    _chapter2ImageAnimation.animationWithImageForward();
  }

  @override
  void didUpdateWidget(ImagePart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 9) {
      _chapter2ImageAnimation.animationWithImageForward();
    } else if (widget.scrollCount == 10) {
      _chapter2ImageAnimation.showImagePage10();
    } else if (widget.scrollCount == 11) {
      _chapter2ImageAnimation.showImagePage11();
    } else if (widget.scrollCount == 12) {
      _chapter2ImageAnimation.showImagePage12();
    }
  }

  @override
  void dispose() {
    _chapter2ImageAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/story_3.png',
            fit: BoxFit.contain,
          ),
        ),
        AnimatedOpacity(
          opacity: widget.scrollCount == 9 ? 1 : 0,
          duration: const Duration(milliseconds: 720),
          child: SlideTransition(
            position: _chapter2ImageAnimation.imageMoveShow,
            child: FadeTransition(
              opacity: _chapter2ImageAnimation.imageOpacityShow,
              child: Text(
                '입학 후,\n'
                ' 개발 강의를 처음 수강했던 날의 기억이 아직도 생생합니다.\n\n'
                '기본 개념조차 잡히지 않았던 저와 동기들,\n'
                ' Unix 수업 시간에 처음 들은 cd와 ls.\n'
                ' 하지만 이게 왜 필요한지, 어디에 쓰이는 건지 몰랐던 우리.\n\n'
                '궁금증만 커져가던 시간 속에서,\n'
                ' 우리는 서로를 붙잡고, 매일 스터디에 모였습니다.',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _chapter2ImageAnimation.isPage10Active ? 1 : 0,
          duration: const Duration(milliseconds: 720),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/story_1.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: _chapter2ImageAnimation.isPage11Active ? 1 : 0,
          duration: const Duration(milliseconds: 720),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/story_2.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
