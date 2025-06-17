import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FaqTitle extends StatelessWidget {
  final int currentTitleIndex;
  final double screenWidth;

  const FaqTitle({
    super.key,
    required this.currentTitleIndex,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final currentTitle = TitleTextConstants.faqTitles[currentTitleIndex];

    // 화면 크기에 따른 폰트 크기 조절
    double fontSize = screenWidth > 1024 ? 35 : (screenWidth > 600 ? 28 : 24);

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            ),
          );
        },
        child: Container(
          key: ValueKey('faq_title_$currentTitleIndex'),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 600 ? 20 : 16,
          ),
          child:
              screenWidth > 600
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentTitle['title']!,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        currentTitle['subTitle']!,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        currentTitle['description']!,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                  : Column(
                    children: [
                      Text(
                        '${currentTitle['title']!}${currentTitle['subTitle']!}',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentTitle['description']!,
                        style: TextStyle(
                          fontSize: fontSize - 4,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
