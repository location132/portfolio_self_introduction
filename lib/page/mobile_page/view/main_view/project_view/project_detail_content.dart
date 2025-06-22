import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class ProjectDetailContent extends StatelessWidget {
  final String category;
  final bool isAnimationStart;

  const ProjectDetailContent({
    super.key,
    required this.category,
    required this.isAnimationStart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [..._getProjectItems(context)],
      ),
    );
  }

  List<Widget> _getProjectItems(BuildContext context) {
    List<Map<String, String>> projects = [];

    switch (category) {
      case 'flutter':
        projects = [
          {
            'title': '잎사이',
            'description':
                '5만 줄 이상의 코드 규모에 MVVM 아키텍처를 적용하고, TestFlight를 통해 협업한  프로젝트입니다.',
            'tech': 'MVVM, Clean Architecture, TestFlight',
          },
          {
            'title': 'NaverMap',
            'description':
                'Service 계층, Isar(Local DB), DIO 등, Clean Architecture를 적용하여 설계한 지도 기반 Flutter 프로젝트입니다.',
            'tech': 'Service_계층, Isar, DIO, NaverMap',
          },
          {
            'title': '클랭(KLANG)',
            'description': 'PM 역할을 수행하며 16명의 다양한 전공 팀원들과 함께한 협업 프로젝트입니다.',
            'tech': 'PM, Flutter, 비개발자 팀원과의 협업',
          },
          {
            'title': '구름 x 카카오 x 인프런',
            'description':
                '웹, 앱, 서버를 함께 공부하는 학생들이 협업하여 만든 게시판 형태의 프로젝트입니다. 서비스 기획부터 전체 구조 설계까지 경험했습니다.',
            'tech': '부트캠프, Collaboration, Service Planning',
          },
          {
            'title': '선배 개발자 따라잡기 - gsSHOP',
            'description': ' 생명주기 개선을 통해 깜빡임 없는 매끄러운 화면 전환을 구현했습니다.',
            'tech': '생명주기 공부',
          },
          {
            'title': '선배 개발자 따라잡기 - idus',
            'description': '쉬머 효과와 자연스러운 콘텐츠 전환을 위한 애니메이션을 적용했습니다.',
            'tech': 'UI/UX, Flutter Animation',
          },
        ];
        break;
      case 'flutter_rive':
        projects = [
          {
            'title': 'About Me - With myDream',
            'description':
                '사용자의 마우스 호버에 반응해 원하는 챕터로 이동할 수 있도록 만든 첫 Rive 프로젝트입니다. 0.2초 단위까지 정밀하게 조정해 섬세한 전환 타이밍을 구현했습니다.',
            'tech': '',
          },
          {
            'title': 'MySkill - in Web',
            'description':
                '총 4일간 제작한 가장 긴 애니메이션으로, 초기 진입부터 부드러운 화면 전환이 이어지며, 클릭과 호버에 맞춰 스킬이 나타나는 구조입니다.',
            'tech': '',
          },
          {
            'title': 'Detail Me',
            'description':
                '빈 화면에서 핸드폰이 나타나고, 사용자가 원하는 구성으로 내용을 꾸밀 수 있도록 설계된 구조입니다.',
            'tech': '',
          },
        ];
        break;
      case 'future':
        projects = [
          {
            'title': '악보 넘기기',
            'description':
                '동생이 음악을 전공하며 2025년 대학생이 되었고, 손을 사용하지 않고도 악보를 넘길 수 있는 악보 뷰어 앱을 만들 계획입니다.',
            'tech': '25년 7월 작업 시작 예정',
          },
          {
            'title': 'CCTV View',
            'description':
                '2025년 원주에서 시작한 작은 텃밭을 실시간으로 확인하고, 원격으로 물을 줄 수 있는 어플리케이션을 백엔드 개발자인 여자친구와 함께 개발할 예정입니다.',
            'tech': '25년 11월 작업 시작 예정',
          },
          {
            'title': '맞춤 건강 알림',
            'description':
                '복용 중인 약과 복용 시간을 기록하고, 필요한 약을 미리 알려주는 건강 도우미 앱을 만들 계획입니다.',
            'tech': '26년 백엔드를 배우며 작업시작 예정',
          },
        ];
        break;
    }

    List<Widget> projectWidgets = [];

    for (int index = 0; index < projects.length; index++) {
      Map<String, String> project = projects[index];

      if (category == 'flutter' && index == 4) {
        projectWidgets.add(
          WidgetAnimation(
            isStart: isAnimationStart,
            beginDy: 0.5,
            duration: 600 + (index * 100),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.h),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    ProjectTextConstants.dividerText,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white.withValues(alpha: 0.7),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      }

      projectWidgets.add(
        WidgetAnimation(
          isStart: isAnimationStart,
          beginDy: 0.5,
          duration: 600 + (index * 100),
          child: GestureDetector(
            onTap: () {
              if (project['title'] == '잎사이') {
                context.go('/project-detail/ifsai');
              } else {
                context.go('/schedule');
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.all(16.w),
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white.withValues(alpha: 0.03),
                border: Border.all(
                  color:
                      project['title'] == '잎사이'
                          ? const Color.fromARGB(255, 100, 200, 255)
                          : const Color.fromARGB(255, 204, 250, 248),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (category == 'future')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: const Color.fromARGB(255, 204, 250, 248),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '곧 시작합니다!',
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: const Color.fromARGB(255, 204, 250, 248),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (project['title'] == '잎사이')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              100,
                              200,
                              255,
                            ).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: const Color.fromARGB(255, 100, 200, 255),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '자세히 보실 수 있습니다',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: const Color.fromARGB(255, 100, 200, 255),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (project['title'] == 'NaverMap' ||
                          project['title'] == '네이버 Map')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            '7월 16일 업로드 예정',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (project['title'] == '클랭(KLANG)' ||
                          project['title'] == 'Klang')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            '8월 20일 업로드 예정',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (project['title'] == '구름 x 카카오 x 인프런')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            '9월 14일 업로드 예정',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (project['title'] == 'About Me - With myDream' ||
                          project['title'] == 'MySkill - in Web' ||
                          project['title'] == 'Detail Me')
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: Text(
                            '11월 10일 업로드 예정',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Text(
                          project['title']!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        project['title'] == '잎사이'
                            ? Icons.open_in_new
                            : Icons.arrow_forward_ios,
                        size: 14.sp,
                        color:
                            project['title'] == '잎사이'
                                ? const Color.fromARGB(255, 100, 200, 255)
                                : Colors.white.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: Text(
                      project['description']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white.withValues(alpha: 0.7),
                        height: 1.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                    child: Text(
                      project['tech']!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return projectWidgets;
  }
}
