import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter_detail_button.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter_intro_box.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter_story.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter1.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter2.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter3.dart';

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
                    state.selectedChapterIndex == 0
                        ? ProfilePage1Constants.chapter1
                        : state.selectedChapterIndex == 1
                        ? ProfilePage1Constants.chapter2
                        : ProfilePage1Constants.chapter3,
                    style: GoogleFonts.dancingScript(
                      fontSize: 18.sp,
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
            ),

            SizedBox(height: 32.h),

            DskChapterIntroBox(
              isChapterDescriptionAni: state.isChapterDescriptionAni,
              isTextOpacity: state.isChapterDetailAniText,
              selectedChapterIndex: state.selectedChapterIndex,
            ),
            SizedBox(height: 32.h),

            if (state.selectedChapterIndex == 0) ...[
              DskChapterStory(
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
              DskChapterStory(
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
              DskChapterStory(
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
            ] else if (state.selectedChapterIndex == 1) ...[
              // 챕터 2 스토리들
              DskChapterStory(
                title: '기본 개념조차 잡히지 않았던 우리.',
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
                      '기본 개념조차 잡히지 않았던 저와 동기들, Unix 수업 시간에 처음 들은 cd와 ls. 하지만 이게 왜 필요한지, 어디에 쓰이는 건지 몰랐던 우리.',
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
              DskChapterStory(
                title: '우리손으로 뭔가를 해보겠다는 노력',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 10.h),
                child: AnimatedContainer(
                  height: state.isChapterDetailAniContent ? 130.h : 0.h,
                  constraints: const BoxConstraints(maxWidth: 500),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: state.isChapterDetailAniText ? 1 : 0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: Text(
                      '이 노력은 어느새, 하나의 프로젝트라는 꿈으로 이어졌습니다. 처음엔 학생 몇 명이 모여 만든 엉망진창의 결과물. 완성도는 부족했지만, 우리 손으로 무언가를 만들어냈다는 그 기쁨은 현재도 제가 개발공부를 하고, 계속 공부할 수 있도록 만들어주었습니다.',
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
              DskChapterStory(
                title: 'Flutter 개발자로서의 가장 커다란 대학 경험',
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
                      '"저는 이 모든 경험들이 저를 여기까지 올라오게 만들어준 Flutter 개발자로서의 가장 커다란 대학 경험이라 생각합니다."',
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
                      '9명의 개발자, 3명의 디자이너, 1명의 보안 전문가, 그리고 3명의 경영학 전공 친구들과 함께 '
                      'Klang 프로젝트와 잎사이 프로젝트를 기획부터 디자인 · 개발까지 진행하며 하나의 작은 서비스를 우리 손으로 만들어내는 PM경험을 해보기도 했습니다.',
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
            ] else if (state.selectedChapterIndex == 2) ...[
              // 챕터 3 스토리들
              DskChapterStory(
                title: '매년 도전하는 개발, 2025년은 Web',
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
                      'iOS, AndroidApp 넘어 Web에 도전하며, 매일 새로운 것을 배우고 있습니다. 완벽하지는 않지만, 꾸준히 성장하고 있습니다.',
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
              DskChapterStory(
                title: '기술적 도전과 지속적인 학습',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 10.h),
                child: AnimatedContainer(
                  height: state.isChapterDetailAniContent ? 130.h : 0.h,
                  constraints: const BoxConstraints(maxWidth: 500),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: state.isChapterDetailAniText ? 1 : 0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: Text(
                      '매년, 작년의 저를 돌아봅니다. 내가 그때 이런 걸 할 수 있었나? 라는 생각이 들 만큼 달라져 있죠.\n매일 개발하며 정체기처럼 느껴질 때도 있지만, 되돌아보면 분명히 성장해왔다는 걸 느낍니다.',
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
              DskChapterStory(
                title: '2026년부터의 목표',
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
                      '"Spring Boot를 공부해 뭐든 할 수 있는 개발자가 되기"',
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
                  height: state.isChapterDetailAniContent ? 200.h : 0.h,
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: AnimatedOpacity(
                    opacity: state.isChapterDetailAniText ? 1 : 0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: Text(
                      'Flutter를 통해 프론트엔드 개발의 즐거움을 느낀 지금, 이제는 백엔드까지 직접 설계하고 운영할 수 있는 개발자가 되고 싶습니다.\n\n'
                      'Spring Boot를 시작으로 서버 아키텍처와 데이터 흐름까지 이해하며, '
                      '2026년, 더 넓은 시야와 실력을 갖춘 개발자로 나아가는 것이 목표입니다.',
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
            ],

            SizedBox(height: 40.h),

            DskChapterDetailButtonWidget(
              state: state,
              chapterDetailButtonClicked: chapterDetailButtonClicked,
            ),

            //챕터 내용 시작
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
}
