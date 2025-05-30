import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/chapter_view/widget/chapter_detail/chapter_story.dart';

class MobileChapter3 extends StatelessWidget {
  final ChapterModel state;
  const MobileChapter3({super.key, required this.state});

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

        AnimatedOpacity(
          opacity: state.isChapterContentVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Column(
            children: [
              // 1. 현재 이 프로젝트 - 포트폴리오 웹사이트
              ChapterStory(
                title: '지금 보고 계시는 이 포트폴리오',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지 (회색 컨테이너)
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[700],
                          border: Border.all(
                            color: Colors.grey[600]!,
                            width: 1,
                          ),
                        ),
                        height: 200.h,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[500],
                            size: 48.sp,
                          ),
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        'Flutter Web의 첫 도전',
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
                        'iOS와 Android를 넘어서, Flutter Web에 처음 도전한 프로젝트입니다.\n\n'
                        '상태 관리, 생명주기, Rive 애니메이션 등 앱 개발 경험을 웹에 녹여내며,\n'
                        '동일한 품질의 사용자 경험을 구현하는 것을 목표로 삼았습니다.\n\n'
                        '1차 배포는 끝이 아닌 시작입니다. 더 나은 완성도를 위해,\n'
                        '지속적으로 개선하고 유지보수할 것을 저 자신에게 약속합니다.',
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

              // 2. 기술적 성장과 도전
              ChapterStory(
                title: '계속 성장하는 패턴과 아키텍쳐',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지 (회색 컨테이너)
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[700],
                          border: Border.all(
                            color: Colors.grey[600]!,
                            width: 1,
                          ),
                        ),
                        height: 200.h,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[500],
                            size: 48.sp,
                          ),
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '코드 품질에 대한 고민, 그리고 적용',
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
                        'Provider에서 Bloc으로, 단순한 State에서 Freezed + Cubit 패턴으로.\n\n'
                        'DI(Dependency Injection)를 위한 get_it과 injectable 도입,\n'
                        '그리고 더 나은 아키텍처를 위한 구조적 고민들을 이어가고 있습니다.\n\n'
                        '복잡해지는 프로젝트 속에서도 깔끔한 코드를 유지하기 위해 '
                        '아직은 익숙해지는 과정이라 속도는 느릴지라도\n'
                        '점차 손에 익고 있다는 것을 느낍니다.',
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

              // 3. 현재의 나와 앞으로의 목표
              ChapterStory(
                title: '도움이 되는 더 다양한 툴들',
                isStart: state.isChapterDetailAniTitle,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 이미지 (회색 컨테이너)
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 420.w, // 갤럭시 폴드 대응
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[700],
                          border: Border.all(
                            color: Colors.grey[600]!,
                            width: 1,
                          ),
                        ),
                        height: 200.h,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[500],
                            size: 48.sp,
                          ),
                        ),
                      ),
                    ),
                    // 제목
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '개발과 어울리는 더 다양한 툴들',
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
                        '프론트엔드 개발자로서 필요한 더 다양한 툴들을 익히는 것도 많이 연습을 해왔습니다\n'
                        '이제는 Figma를 넘어, Rive 애니메이션과 Canva 같은 디자인 툴도 비록 서툴지만 직접 만들 수 있게 되었습니다.',
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
