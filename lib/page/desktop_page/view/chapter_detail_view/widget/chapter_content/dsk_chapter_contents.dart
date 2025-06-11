import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_detail_button.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_intro_box.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_detail_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter1.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter2.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter3.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_spotlight.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/chapter_contents_selector.dart';

class DskChapterContents extends StatelessWidget {
  final ChapterModel state;
  final Function() chapterDetailButtonClicked;

  const DskChapterContents({
    super.key,
    required this.state,
    required this.chapterDetailButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width >= 1200.w;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120.h),
            Stack(
              children: [
                Visibility(
                  visible: isWideScreen,
                  child: AnimatedOpacity(
                    opacity: isWideScreen ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: ChapterDetailTitle(state: state),
                            ),
                            const SizedBox(height: 80),
                            DskChapterIntroBox(
                              selectedChapterIndex: state.selectedChapterIndex,
                            ),
                          ],
                        ),
                        SizedBox(width: 40.w),
                        ChapterContentsSelector(state: state),
                      ],
                    ),
                  ),
                ),
                ////-- w작은 화면
                Visibility(
                  visible: !isWideScreen,
                  child: AnimatedOpacity(
                    opacity: isWideScreen ? 0 : 1,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChapterDetailTitle(state: state),
                        SizedBox(height: 32.h),
                        DskChapterIntroBox(
                          selectedChapterIndex: state.selectedChapterIndex,
                        ),
                        SizedBox(height: 32.h),
                        ChapterContentsSelector(state: state),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            DskChapterDetailButtonWidget(
              state: state,
              chapterDetailButtonClicked: chapterDetailButtonClicked,
            ),

            if (state.selectedChapterIndex == 0)
              DskChapter1(state: state)
            else if (state.selectedChapterIndex == 1)
              DskChapter2(state: state)
            else if (state.selectedChapterIndex == 2)
              DskChapter3(state: state)
            else if (state.selectedChapterIndex == 3)
              DskSpotlight(state: state),
          ],
        ),
      ),
    );
  }
}
