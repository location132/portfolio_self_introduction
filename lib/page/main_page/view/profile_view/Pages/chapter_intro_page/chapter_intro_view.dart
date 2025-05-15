import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter1_text.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter2_text.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/intro_phone_screen.dart';

class ChapterIntroView extends StatefulWidget {
  final ProfileModel profileModel;

  const ChapterIntroView({
    super.key,
    required this.profileModel,
  });

  @override
  State<ChapterIntroView> createState() => _ChapterIntroViewState();
}

class _ChapterIntroViewState extends State<ChapterIntroView> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.profileModel.scrollCount == 2 ||
              widget.profileModel.scrollCount == 3 ||
              widget.profileModel.scrollCount == 7 ||
              widget.profileModel.scrollCount == 8
          ? 1.0
          : 0.0,
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
                  width: widget.profileModel.scrollCount == 3 ||
                          widget.profileModel.scrollCount == 8
                      ? 0
                      : 640,
                ),
                Stack(
                  children: [
                    AnimatedOpacity(
                      opacity: widget.profileModel.scrollCount == 2 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 720),
                      curve: Curves.easeInOut,
                      child: const IntroTextWithChapter1(),
                    ),
                    AnimatedOpacity(
                      opacity: widget.profileModel.scrollCount == 7 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 720),
                      curve: Curves.easeInOut,
                      child: const IntroTextWithChapter2(),
                    ),
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
                  profileModel: widget.profileModel,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOut,
                  width: widget.profileModel.scrollCount == 3 ||
                          widget.profileModel.scrollCount == 8
                      ? 0
                      : 640,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
