import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';

import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class SkillTitle extends StatelessWidget {
  final MySkillViewStatus status;
  final int currentTitleIndex;
  final bool isButtonVisible;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const SkillTitle({
    super.key,
    required this.status,
    required this.currentTitleIndex,
    required this.isButtonVisible,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final currentTitle = TitleTextConstants.skillTitles[currentTitleIndex];
    final maxIndex = TitleTextConstants.skillTitles.length - 1;

    return Column(
      children: [
        Stack(
          children: [
            AnimatedOpacity(
              opacity: status == MySkillViewStatus.inactive ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: TitleText(
                title: TitleTextConstants.title3,
                subTitle: TitleTextConstants.subTitle3,
                description: TitleTextConstants.description3,
                isVisible: status == MySkillViewStatus.inactive,

                color: Colors.white,
              ),
            ),

            AnimatedOpacity(
              opacity: status == MySkillViewStatus.active ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                child: TitleText(
                  key: ValueKey(currentTitleIndex),
                  title: currentTitle['title']!,
                  subTitle: currentTitle['subTitle']!,
                  description: currentTitle['description']!,
                  isVisible: status == MySkillViewStatus.active,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        AnimatedOpacity(
          opacity:
              (status == MySkillViewStatus.active && isButtonVisible)
                  ? 1.0
                  : 0.0,
          duration: const Duration(milliseconds: 600),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 180),

                AnimatedOpacity(
                  opacity: currentTitleIndex > 0 ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 200),
                  child: GestureDetector(
                    onTap: currentTitleIndex > 0 ? onPrevious : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${currentTitleIndex + 1} / ${TitleTextConstants.skillTitles.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                AnimatedOpacity(
                  opacity: currentTitleIndex < maxIndex ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 200),
                  child: GestureDetector(
                    onTap: currentTitleIndex < maxIndex ? onNext : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
