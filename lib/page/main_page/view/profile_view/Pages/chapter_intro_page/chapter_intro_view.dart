import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter1_text.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/intro_phone_screen.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter2_text.dart';

class ChapterIntroView extends StatelessWidget {
  final int scrollCount;

  const ChapterIntroView({super.key, required this.scrollCount});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: scrollCount == 2 || scrollCount == 3 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 720),
      child: Stack(
        children: [
          Positioned.fill(
            top: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntroPhoneScreen(scrollCount: scrollCount),
                const SizedBox(
                  width: 80,
                ),
                Stack(
                  children: [
                    IntroTextWithChapter1(scrollCount: scrollCount),
                    IntroTextWithChapter2(scrollCount: scrollCount),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
