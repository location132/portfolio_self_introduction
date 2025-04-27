import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/widgets/chapter_list.dart';

class ChapterWithBlur extends StatelessWidget {
  final bool isUserClick;
  const ChapterWithBlur({super.key, required this.isUserClick});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: isUserClick ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 420),
          child: const ChapterList(),
        ),
        AnimatedOpacity(
          opacity: isUserClick ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 420),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: const ChapterList(),
          ),
        ),
        AnimatedOpacity(
          opacity: isUserClick ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 420),
          child: Container(
            height: 150,
            alignment: Alignment.center,
            child: const Text(
              ProfilePage1Constants.scroll,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
