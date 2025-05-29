import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card.dart';

class ChapterPage extends StatefulWidget {
  final bool isMobileDevice;
  final bool isTitelTextAniStart;
  final bool isChapterContainerAniStart;
  final bool isBackGroundAniStart;
  final Function(int)? onCardTap;
  const ChapterPage({
    super.key,
    required this.isMobileDevice,
    required this.isTitelTextAniStart,
    required this.isChapterContainerAniStart,
    required this.isBackGroundAniStart,
    this.onCardTap,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelTextAniStart: widget.isTitelTextAniStart,
          title: '알면 알수록, 이정원',
          color: widget.isMobileDevice ? Colors.black : Colors.white,
        ),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity: widget.isChapterContainerAniStart ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: ChapterCard(
            isMobileDevice: widget.isMobileDevice,
            isBackGroundAniStart: widget.isBackGroundAniStart,
            onCardTap: widget.onCardTap,
          ),
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
