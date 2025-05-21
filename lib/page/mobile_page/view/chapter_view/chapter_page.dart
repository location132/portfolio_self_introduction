import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_title/one_line_title.dart';

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
    final double boxHeight = MediaQuery.of(context).size.height * 0.6;
    final double boxWidth = MediaQuery.of(context).size.height * 0.3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelText: isTitelTextAniStart,
          title: '알면 알수록, 이 정원',
        ),
        const SizedBox(height: 50),
        AnimatedOpacity(
          opacity: isChapterContainerAniStart ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: index == 2 ? 0 : 30),
                  child: Container(
                    height: boxHeight,
                    width: boxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
