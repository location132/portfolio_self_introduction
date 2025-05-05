import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/page_3/widgets/chapter_screen.dart';

class IntroPhoneScreen extends StatelessWidget {
  final int scrollCount;

  const IntroPhoneScreen({
    super.key,
    required this.scrollCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 18,
            left: 15,
            right: 15,
            bottom: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ChapterScreen(
                    scrollCount: scrollCount,
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: scrollCount == 2 || scrollCount == 3 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 720),
            child: Image.asset('assets/images/profile_card.png'),
          ),
        ],
      ),
    );
  }
}
