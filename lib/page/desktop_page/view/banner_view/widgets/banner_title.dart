import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class BannerTitle extends StatelessWidget {
  final bool isBannerActive;
  final int currentTitleIndex;
  final bool isButtonVisible;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const BannerTitle({
    super.key,
    required this.isBannerActive,
    required this.currentTitleIndex,
    required this.isButtonVisible,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    const maxIndex = 1;
    final currentTitle = TitleTextConstants.bannerTitles[currentTitleIndex];

    return Column(
      children: [
        SizedBox(height: 120),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
                child: child,
              ),
            );
          },
          child: TitleText(
            key: ValueKey('banner_title_${currentTitleIndex}_$isBannerActive'),
            title: currentTitle['title']!,
            subTitle: currentTitle['subTitle']!,
            description: currentTitle['description']!,
            titleFontSize: 35,
            color: Colors.black,
            isOneLine: false,
            isVisible: true,
          ),
        ),

        AnimatedOpacity(
          opacity: (isBannerActive && isButtonVisible) ? 1.0 : 0.0,
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
                        border: Border.all(color: Colors.black54, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: Colors.black87,
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
                    '${currentTitleIndex + 1} / ${TitleTextConstants.bannerTitles.length}',
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
                        border: Border.all(color: Colors.black54, width: 1),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.black87,
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
