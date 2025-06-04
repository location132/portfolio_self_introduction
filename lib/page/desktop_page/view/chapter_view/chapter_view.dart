import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/description_button.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/widget/desktop_chapter_card.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class DesktopChapterView extends StatelessWidget {
  final Function(int)? onCardTap;

  const DesktopChapterView({super.key, this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleText(
          title: '알면 알수록,',
          subTitle: '이정원',
          description: '',
          titleFontSize: 34,
        ),
        SizedBox(height: 20.sh),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 501.3 * 1.3,
                    width: 258 * 1.3,
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => onCardTap?.call(3),
                      child: const DesktopChapterCard(cardIndex: 3),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 501.3 * 1.3,
                    width: 258 * 1.3,
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => onCardTap?.call(0),
                      child: const DesktopChapterCard(cardIndex: 0),
                    ),
                  ),

                  const SizedBox(width: 20),
                  Container(
                    height: 501.3 * 1.3,
                    width: 258 * 1.3,
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => onCardTap?.call(1),
                      child: const DesktopChapterCard(cardIndex: 1),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 501.3 * 1.3,
                    width: 258 * 1.3,
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => onCardTap?.call(2),
                      child: const DesktopChapterCard(cardIndex: 2),
                    ),
                  ),

                  const SizedBox(width: 80),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
        SizedBox(height: 20.sh),
      ],
    );
  }
}
