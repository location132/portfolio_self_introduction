import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter1_text.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/intro_phone_screen.dart';

class ChapterIntroView extends StatefulWidget {
  final int scrollCount;

  final bool isChapterSkip;

  const ChapterIntroView({
    super.key,
    required this.scrollCount,
    required this.isChapterSkip,
  });

  @override
  State<ChapterIntroView> createState() => _ChapterIntroViewState();
}

class _ChapterIntroViewState extends State<ChapterIntroView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.scrollCount == 2 || widget.scrollCount == 3 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 720),
      child: Stack(
        children: [
          Positioned.fill(
            top: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOut,
                  width: widget.scrollCount == 3 ? 0 : 640,
                ),
                Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: widget.scrollCount == 2 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 720),
                      curve: Curves.easeInOut,
                      child: const IntroTextWithChapter1(),
                    ),
                    // IntroTextWithChapter2(scrollCount: widget.scrollCount),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntroPhoneScreen(
                  scrollCount: widget.scrollCount,
                  isChapterSkip: widget.isChapterSkip,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOut,
                  width: widget.scrollCount == 3 ? 0 : 640,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
