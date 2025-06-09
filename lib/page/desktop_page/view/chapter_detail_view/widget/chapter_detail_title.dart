import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';

class ChapterDetailTitle extends StatelessWidget {
  final ChapterModel state;
  const ChapterDetailTitle({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[800]!, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.selectedChapterIndex == 0
                ? ProfilePage1Constants.chapter1
                : state.selectedChapterIndex == 1
                ? ProfilePage1Constants.chapter2
                : ProfilePage1Constants.chapter3,
            style: GoogleFonts.dancingScript(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            state.selectedChapterIndex == 0
                ? ProfilePage1Constants.chapter1Title
                : state.selectedChapterIndex == 1
                ? ProfilePage1Constants.chapter2Title
                : ProfilePage1Constants.chapter3Title,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
