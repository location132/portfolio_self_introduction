import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_detail_button.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_intro_box.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_story.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/mobile_chapter1.dart';

class ChapterContents extends StatelessWidget {
  final ChapterModel state;
  final Function() chapterDetailButtonClicked;

  const ChapterContents({
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
            SizedBox(height: 20.h),
            // 챕터 헤더 섹션
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[800]!, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ProfilePage1Constants.chapter1,
                    style: GoogleFonts.dancingScript(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400],
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    ProfilePage1Constants.chapter1Title,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            ChapterIntroBox(
              isChapterDescriptionAni: state.isChapterDescriptionAni,
              isTextOpacity: state.isChapterDetailAniText,
            ),
            SizedBox(height: 32.h),

            // 스토리 섹션들
            ChapterStory(
              title: '처음 강연을 들었던 그 날,',
              isStart: state.isChapterDetailAniTitle,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 20.h),
              child: AnimatedContainer(
                height: state.isChapterDetailAniContent ? 100.h : 0.h,
                constraints: const BoxConstraints(maxWidth: 500),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: state.isChapterDetailAniText ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: Text(
                    '낯설기만 했던 세미나 주제, 하지만 주변의 개발자들은 모두 이해했다는 듯한 표정으로 고개를 끄덕이고 있었고, 이 첫날의 기억은 지금도 생생하게 남아 있습니다',
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            ChapterStory(
              title: '저보다 먼저 개발자의 길을 걷는 선배들이',
              isStart: state.isChapterDetailAniTitle,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 10.h),
              child: AnimatedContainer(
                height: state.isChapterDetailAniContent ? 100.h : 0.h,
                constraints: const BoxConstraints(maxWidth: 500),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: state.isChapterDetailAniText ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: Text(
                    '전해주는 강연은 어려운 말들이 가득했고 이해하지 못한 채 노트에 필기만 하던 저는 제가 처음 품었던 목표를 잊고 따라가기 급급하게 만들었던 것 같습니다.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            ChapterStory(
              title: '후배 개발자들에게 해준 하나의 말',
              isStart: state.isChapterDetailAniTitle,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Center(
                child: AnimatedOpacity(
                  opacity: state.isChapterDetailAniText ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: Text(
                    '"모르는 건 당연해요. 중요한 건 계속 배우고 있다는 거예요."',
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, top: 20.h),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                height: state.isChapterDetailAniContent ? 100.h : 0.h,
                constraints: const BoxConstraints(maxWidth: 500),
                child: AnimatedOpacity(
                  opacity: state.isChapterDetailAniText ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: Text(
                    '이 한마디의 말은 선배 개발자들이 만들어놓은 길을 편안하게 따라가는 개발자가 아닌, '
                    '나의 목표 그리고 나의 고집으로 성장하는 개발자가 되고 싶다는 마음을 가질 수 있게 해주었습니다.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.6,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),

            ChapterDetailButtonWidget(
              state: state,
              chapterDetailButtonClicked: chapterDetailButtonClicked,
            ),

            //챕터 내용 시작
            MobileChapter1(state: state),
          ],
        ),
      ),
    );
  }
}
