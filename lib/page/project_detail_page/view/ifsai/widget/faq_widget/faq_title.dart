import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FaqTitle extends StatelessWidget {
  final int currentTitleIndex;

  const FaqTitle({super.key, required this.currentTitleIndex});

  @override
  Widget build(BuildContext context) {
    final currentTitle = TitleTextConstants.faqTitles[currentTitleIndex];

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentTitle['title']!,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                currentTitle['subTitle']!,
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
              Text(
                currentTitle['description']!,
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
