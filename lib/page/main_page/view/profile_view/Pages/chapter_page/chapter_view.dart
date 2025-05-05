import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/widgets/chapter_card.dart';

class ChapterView extends StatelessWidget {
  final int scrollCount;
  final int previousCount;
  final bool isUserClick;
  const ChapterView({
    super.key,
    required this.scrollCount,
    required this.previousCount,
    required this.isUserClick,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: scrollCount == 1 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 720),
        child: ChapterCard(
          scrollCount: scrollCount,
          previousCount: previousCount,
          isUserClick: isUserClick,
        ),
      ),
    );
  }
}
