import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class ChapterTitle extends StatelessWidget {
  final bool isChapterActive;
  final bool isBlackBackground;
  final int currentTitleIndex;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const ChapterTitle({
    super.key,
    required this.isChapterActive,
    required this.isBlackBackground,
    required this.currentTitleIndex,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final currentTitle = TitleTextConstants.chapterTitles[currentTitleIndex];

    return Column(
      children: [
        SizedBox(height: 120),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
                child: child,
              ),
            );
          },
          child: TitleText(
            key: ValueKey(
              'chapter_title_${currentTitleIndex}_$isChapterActive',
            ),
            title: currentTitle['title']!,
            subTitle: currentTitle['subTitle']!,
            description: currentTitle['description']!,
            titleFontSize: currentTitleIndex == 0 ? 35 : 33,
            color: isBlackBackground ? Colors.white : Colors.black,
            isOneLine: true,
            isVisible: true,
          ),
        ),
      ],
    );
  }
}
