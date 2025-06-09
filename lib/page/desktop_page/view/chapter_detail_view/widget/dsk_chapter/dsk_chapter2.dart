import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/components/university_section.dart';

class DskChapter2 extends StatelessWidget {
  final ChapterModel state;
  const DskChapter2({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final currentIndex = state.currentChapter2Index;
    final sections = state.chapter2Sections;
    final cubit = context.read<DesktopCubit>();

    if (sections.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(height: 60.h),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[800],
          margin: EdgeInsets.symmetric(horizontal: 20.w),
        ),

        SizedBox(height: 40.h),

        AnimatedOpacity(
          opacity: state.isChapterContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
                child: child,
              );
            },
            child: UniversitySection(
              key: ValueKey(currentIndex),
              title: sections[currentIndex]['title']!,
              imagePath: sections[currentIndex]['imagePath']!,
              contentTitle: sections[currentIndex]['contentTitle']!,
              description: sections[currentIndex]['description']!,
              isStart: true,
            ),
          ),
        ),

        SizedBox(height: 20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentIndex > 0)
              ElevatedButton(
                onPressed: () => cubit.chapter2NavigatePrevious(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text('이전'),
              ),
            if (currentIndex > 0 && currentIndex < sections.length - 1)
              SizedBox(width: 16.w),
            if (currentIndex == 0 && currentIndex < sections.length - 1)
              SizedBox.shrink(),
            if (currentIndex < sections.length - 1)
              ElevatedButton(
                onPressed: () => cubit.chapter2NavigateNext(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text('다음'),
              ),
          ],
        ),
      ],
    );
  }
}
