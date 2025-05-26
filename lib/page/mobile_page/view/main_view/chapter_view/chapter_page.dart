import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card.dart';

class ChapterPage extends StatefulWidget {
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final bool isBackGroundAniStart;
  const ChapterPage({
    super.key,
    required this.isTitelTextAniStart,
    required this.isChapterContainerAniStart,
    required this.isBackGroundAniStart,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  bool isChapterAniStart = false;
  @override
  void didUpdateWidget(covariant ChapterPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isChapterContainerAniStart) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          isChapterAniStart = true;
        });
      });
    } else {
      setState(() {
        isChapterAniStart = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelTextAniStart: widget.isTitelTextAniStart,
          title: '알면 알수록, 이정원',
        ),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity: isChapterAniStart ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: ChapterCard(isBackGroundAniStart: widget.isBackGroundAniStart),
        ),
      ],
    );
  }
}
