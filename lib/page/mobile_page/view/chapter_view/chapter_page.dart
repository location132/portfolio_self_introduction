import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_title/one_line_title.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/chapter_view/widget/chapter_card.dart';

class ChapterPage extends StatelessWidget {
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  const ChapterPage({
    super.key,
    required this.isTitelTextAniStart,
    required this.isChapterContainerAniStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelText: isTitelTextAniStart,
          title: '알면 알수록, 이정원',
        ),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity: isChapterContainerAniStart ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: const ChapterCard(),
        ),
        const SizedBox(height: 150),
      ],
    );
  }
}
