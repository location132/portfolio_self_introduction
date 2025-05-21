import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/chapter_view/chapter_page.dart';

class MainPage extends StatelessWidget {
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  const MainPage({
    super.key,
    required this.isTitelTextAniStart,
    required this.isChapterContainerAniStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChapterPage(
          isTitelTextAniStart: isTitelTextAniStart,
          isChapterContainerAniStart: isChapterContainerAniStart,
        ),
      ],
    );
  }
}
