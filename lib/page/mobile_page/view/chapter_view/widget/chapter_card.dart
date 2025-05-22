import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/chapter_view/widget/chapter_card/first_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/chapter_view/widget/chapter_card/second_card.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/chapter_view/widget/chapter_card/third_card.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({super.key});

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
                print('check ==> check 1');
              },
              child: const FirstCard(),
            ),
            const SizedBox(width: 22),
            GestureDetector(
              onTap: () {
                print('check ==> check 2');
              },
              child: const SecondCard(),
            ),
            const SizedBox(width: 22),
            GestureDetector(
              onTap: () {
                print('check ==> check 3');
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
