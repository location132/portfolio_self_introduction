import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/first_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/second_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/third_card.dart';

class ChapterCard extends StatefulWidget {
  final bool isChapterContainerAniStart;
  final bool isBackGroundAniStart;
  const ChapterCard({
    super.key,
    required this.isChapterContainerAniStart,
    required this.isBackGroundAniStart,
  });

  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  bool isFirstCardVisible = false;
  bool isSecondCardVisible = false;
  bool isThirdCardVisible = false;

  @override
  void didUpdateWidget(ChapterCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isChapterContainerAniStart &&
        !oldWidget.isChapterContainerAniStart) {
      _startSequentialAnimation();
    }
  }

  void _startSequentialAnimation() async {
    setState(() {
      isFirstCardVisible = true;
    });

    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
      setState(() {
        isSecondCardVisible = true;
      });
    }

    await Future.delayed(const Duration(milliseconds: 200));
    if (mounted) {
      setState(() {
        isThirdCardVisible = true;
      });
    }
  }

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
            AnimatedOpacity(
              opacity: isFirstCardVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {},
                child: FirstCard(
                  isBackGroundAniStart: widget.isBackGroundAniStart,
                ),
              ),
            ),
            const SizedBox(width: 22),
            AnimatedOpacity(
              opacity: isSecondCardVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {},
                child: SecondCard(
                  isBackGroundAniStart: widget.isBackGroundAniStart,
                ),
              ),
            ),
            const SizedBox(width: 22),
            AnimatedOpacity(
              opacity: isThirdCardVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {},
                child: ThirdCard(
                  isBackGroundAniStart: widget.isBackGroundAniStart,
                ),
              ),
            ),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
