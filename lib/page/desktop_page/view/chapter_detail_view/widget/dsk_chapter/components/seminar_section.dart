import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/seminar_horizontal_layout.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/seminar_vertical_layout.dart';

class SeminarSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final String contentTitle;
  final String description;
  final bool isStart;

  const SeminarSection({
    super.key,
    required this.title,
    required this.imagePath,
    required this.contentTitle,
    required this.description,
    required this.isStart,
  });

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width >= 1200.w;

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              AnimatedOpacity(
                opacity: isWideScreen ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: SeminarHorizontalLayout(
                  title: title,
                  imagePath: imagePath,
                  contentTitle: contentTitle,
                  description: description,
                  isStart: isStart,
                ),
              ),
              AnimatedOpacity(
                opacity: isWideScreen ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: SeminarVerticalLayout(
                  title: title,
                  imagePath: imagePath,
                  contentTitle: contentTitle,
                  description: description,
                  isStart: isStart,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 60.h),
      ],
    );
  }
}
