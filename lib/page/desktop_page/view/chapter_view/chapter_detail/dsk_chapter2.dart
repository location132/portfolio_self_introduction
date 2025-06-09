import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/chapter_detail/dsk_chapter_story.dart';

class DskChapter2 extends StatelessWidget {
  final ChapterModel state;
  const DskChapter2({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),

        // 구분선
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[800],
          margin: EdgeInsets.symmetric(horizontal: 20.w),
        ),

        SizedBox(height: 40.h),

        // 3개 대학 경험 섹션을 한번에 애니메이션
        AnimatedOpacity(
          opacity: state.isChapterContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              // 1. 처음 개발 수업
              DskChapterStory(
                title: '입학 후, 처음 개발 강의를 수강했던 날',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/story_3.png',
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '기본 개념조차 잡히지 않았던 우리.',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.25,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // 설명
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '기본 개념조차 잡히지 않았던 저와 동기들, Unix 수업 시간에 처음 들은 cd와 ls.\n\n'
                        '하지만 이게 왜 필요한지, 어디에 쓰이는 건지 몰랐던 우리.\n\n'
                        '궁금증만 커져가던 시간 속에서, 우리는 서로를 붙잡고, 매일 스터디에 모였습니다.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.5,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),

              // 2. 첫 프로젝트 경험
              DskChapterStory(
                title: '우리손으로 뭔가를 해보겠다는 노력',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/story_1.png',
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '하나의 프로젝트라는 꿈으로 이어졌습니다.',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.25,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // 설명
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '처음엔 학생 몇 명이 모여 만든 엉망진창의 결과물. 완성도는 부족했지만,\n\n'
                        '우리 손으로 무언가를 만들어냈다는 그 기쁨은, 현재도 제가 개발공부를 하고, 계속 공부할 수 있도록 만들어주었습니다.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.5,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),

              // 3. PM 경험과 팀 프로젝트
              DskChapterStory(
                title: 'Klang 프로젝트와 잎사이 프로젝트',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/story_2.png',
                          width: double.infinity,
                          height: 200.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'Flutter 개발자로서의 가장 커다란 대학 경험.',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.25,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // 설명
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '9명의 개발자, 3명의 디자이너, 1명의 보안 전문가, 그리고 3명의 경영학 전공 친구들과 함께\n\n'
                        '기획부터 디자인 · 개발까지 진행하며 하나의 작은 서비스를 우리 손으로 만들어내는 PM경험을 해보기도 했습니다.\n\n'
                        '저는 이 모든 경험들이 저를 여기까지 올라오게 만들어준 Flutter 개발자로서의 가장 커다란 대학 경험이라 생각합니다.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.5,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ],
    );
  }
}
