import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/widgets/chapter_box.dart';

class ChapterList extends StatefulWidget {
  const ChapterList({super.key});

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChapterBox(
          chapter: ProfilePage1Constants.chapter1,
          title: ProfilePage1Constants.chapter1Title,
        ),
        SizedBox(height: 16),
        ChapterBox(
          chapter: ProfilePage1Constants.chapter2,
          title: ProfilePage1Constants.chapter2Title,
        ),
        SizedBox(height: 16),
        ChapterBox(
          chapter: ProfilePage1Constants.chapter3,
          title: ProfilePage1Constants.chapter3Title,
        ),
      ],
    );
  }
}
