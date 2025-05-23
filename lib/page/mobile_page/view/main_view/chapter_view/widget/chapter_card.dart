import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/first_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/second_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_card/third_card.dart';

class ChapterCard extends StatelessWidget {
  final bool isBackGroundAniStart;
  const ChapterCard({super.key, required this.isBackGroundAniStart});

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
              onTap: () {},
              child: FirstCard(isBackGroundAniStart: isBackGroundAniStart),
            ),
            const SizedBox(width: 22),
            GestureDetector(onTap: () {}, child: const SecondCard()),
            const SizedBox(width: 22),
            GestureDetector(onTap: () {}, child: const ThirdCard()),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }
}
