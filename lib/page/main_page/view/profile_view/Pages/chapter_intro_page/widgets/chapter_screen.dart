// TODO: sh 리펙터링

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/animation/chapter_screen_ani.dart';

class ChapterScreen extends StatefulWidget {
  final int scrollCount;
  const ChapterScreen({
    super.key,
    required this.scrollCount,
  });

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with TickerProviderStateMixin {
  late ChapterScreenAnimation animation;

  //-- 챕터마다 변경되는 변수
  String chapterNumber = '';
  String chapterTitle = '';
  String chapterContent = '';

  @override
  void initState() {
    super.initState();
    animation = ChapterScreenAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(covariant ChapterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 3 || widget.scrollCount == 8) {
      animation.startAnimationWithContent();
      updateChapterData(widget.scrollCount);
    } else {
      animation.reverseAnimationWithContent();
    }
  }

  void updateChapterData(int scrollCount) {
    if (scrollCount == 3) {
      chapterNumber = ProfilePage1Constants.chapter1;
      chapterTitle = ' ${ProfilePage1Constants.chapter1Title}';
      chapterContent =
          '\n\n이번 챕터에서는\n각종 세미나와 컨퍼런스에 참여한 이유를\n확인하실 수 있습니다.\n\n세 가지로 구성된 작은 세미나 이야기는\n제가 꿈꾸던 목표와 배운점을 공유할 수\n있도록 구셩한 챕터입니다.';
    } else if (scrollCount == 8) {
      chapterNumber = ProfilePage1Constants.chapter2;
      chapterTitle = ' ${ProfilePage1Constants.chapter2Title}';
      chapterContent = '\n\n가장 큰 성장이 이루어졌던 대학생활\n'
          '대학 시절 제가 겪은 경험과 정체기 그리고 극복에 관한 이야기를 확인하실 수 있습니다.\n\n 하나의 이야기로 구성된 이번 챕터는 앞으로의 성장 가능성을 확인하실 수 있도록 구성한 챕터입니다.';
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.scrollCount != 2 ||
          widget.scrollCount != 3 ||
          widget.scrollCount != 7 ||
          widget.scrollCount != 8,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //뒤로 가기 버튼
              const SizedBox(height: 25),
              FadeTransition(
                opacity: animation.textOpacity,
                child: SlideTransition(
                  position: animation.textSlide,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 20),
                      ),
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          chapterNumber,
                          style: GoogleFonts.dancingScript(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          chapterTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        chapterContent,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FadeTransition(
                opacity: animation.buttonOpacity,
                child: SlideTransition(
                  position: animation.buttonSlide,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDF6EC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text(
                                '이어서 보기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5D4037),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '다음에 보기',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
