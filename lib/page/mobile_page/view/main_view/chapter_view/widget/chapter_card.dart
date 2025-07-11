import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/first_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/second_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/third_card.dart';

class ChapterCard extends StatefulWidget {
  final bool isBackGroundAniStart;
  final bool isMobileDevice;
  final Function(int)? onCardTap;
  const ChapterCard({
    super.key,
    required this.isBackGroundAniStart,
    required this.isMobileDevice,
    this.onCardTap,
  });

  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 501.3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 32),
            GestureDetector(
              onTap: () {
                widget.onCardTap?.call(0);
              },
              child: FirstCard(
                isMobileDevice: widget.isMobileDevice,
                isBackGroundAniStart: widget.isBackGroundAniStart,
              ),
            ),
            const SizedBox(width: 22),
            GestureDetector(
              onTap: () {
                widget.onCardTap?.call(1);
              },
              child: const SecondCard(),
            ),
            const SizedBox(width: 22),
            GestureDetector(
              onTap: () {
                widget.onCardTap?.call(2);
              },
              child: const ThirdCard(),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
