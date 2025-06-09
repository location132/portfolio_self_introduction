import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';

class DskChapterDetailButtonWidget extends StatelessWidget {
  final Function() chapterDetailButtonClicked;
  final ChapterModel state;
  const DskChapterDetailButtonWidget({
    super.key,
    required this.state,
    required this.chapterDetailButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity:
              state.chapterDetailButton != ChapterDetailButton.none ? 1 : 0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Center(
            child: TextButton.icon(
              onPressed: () {
                chapterDetailButtonClicked();
              },
              icon:
                  state.chapterDetailButton == ChapterDetailButton.detail
                      ? Icon(
                        Icons.expand_less,
                        color: Colors.white,
                        size: 18.sp,
                      )
                      : Icon(
                        Icons.expand_more,
                        color: Colors.white,
                        size: 18.sp,
                      ),
              label:
                  state.chapterDetailButton == ChapterDetailButton.detail
                      ? Text(
                        '간략히 보기',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                      : Text(
                        '자세히 보기',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
