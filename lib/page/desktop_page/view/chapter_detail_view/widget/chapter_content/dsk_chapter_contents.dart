import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_detail_button.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/dsk_chapter_intro_box.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_detail_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter1.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter2.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/dsk_chapter/dsk_chapter3.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/first_contents.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/second_contents.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_detail_view/widget/chapter_content/third_contents.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120.h),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWideScreen = constraints.maxWidth >= 1420;
                if (isWideScreen) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ChapterDetailTitle(state: state),
                          SizedBox(height: 80),
                          DskChapterIntroBox(
                            isChapterDescriptionAni:
                                state.isChapterDescriptionAni,
                            isTextOpacity: state.isChapterDetailAniText,
                            selectedChapterIndex: state.selectedChapterIndex,
                          ),
                        ],
                      ),
                      SizedBox(width: 40.w),
                      _buildChapterContents(),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DskChapterIntroBox(
                          isChapterDescriptionAni:
                              state.isChapterDescriptionAni,
                          isTextOpacity: state.isChapterDetailAniText,
                          selectedChapterIndex: state.selectedChapterIndex,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildChapterContents(),
                      ),
                    ],
                  );
                }
              },
            ),

            SizedBox(height: 40.h),

            DskChapterDetailButtonWidget(
              state: state,
              chapterDetailButtonClicked: chapterDetailButtonClicked,
            ),

            //챕터 내용
            if (state.selectedChapterIndex == 0)
              DskChapter1(state: state)
            else if (state.selectedChapterIndex == 1)
              DskChapter2(state: state)
            else if (state.selectedChapterIndex == 2)
              DskChapter3(state: state),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterContents() {
    if (state.selectedChapterIndex == 0) {
      return FirstContents(state: state);
    } else if (state.selectedChapterIndex == 1) {
      return SecondContents(state: state);
    } else if (state.selectedChapterIndex == 2) {
      return ThirdContents(state: state);
    }
    return const SizedBox.shrink();
  }
}
