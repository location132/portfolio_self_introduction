import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';

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
        children: [
          WidgetAnimation(
            isStart: isAnimationStart,
            beginDy: 0.3,
            duration: 600,
            child: Text(
              _getCategoryTitle(),
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ..._getProjectItems(),
        ],
      ),
    );
  }

  String _getCategoryTitle() {
    switch (category) {
      case 'flutter':
        return ProjectTextConstants.flutterDetailTitle;
      case 'flutter_rive':
        return ProjectTextConstants.flutterRiveDetailTitle;
      case 'future':
        return ProjectTextConstants.futureProjectDetailTitle;
      default:
        return '프로젝트';
    }
  }

  List<Widget> _getProjectItems() {
    List<Map<String, String>> projects = [];

    switch (category) {
      case 'flutter':
        projects = [
          {
            'title': '잎사이',
            'description':
                '2만 줄 이상의 코드 규모에 MVVM 아키텍처를 적용하고, TestFlight를 통해 협업한  프로젝트입니다.',
            'tech': 'MVVM, Clean Architecture, TestFlight',
          },
          {
            'title': 'NaverMap',
            'description':
                'Service 계층, Isar(Local DB), DIO 등, Clean Architecture를 적용하여 설계한 지도 기반 Flutter 프로젝트입니다.',
            'tech': 'Service_계층, Isar, DIO, NaverMap',
          },
          {
            'title': '클랭',
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
            'title': '인터랙티브 캐릭터 앱',
            'description': 'Rive 애니메이션을 활용한 인터랙티브 캐릭터 앱',
            'tech': 'Flutter, Rive, Animation',
          },
          {
            'title': '로딩 애니메이션 컬렉션',
            'description': '다양한 Rive 기반 로딩 애니메이션 모음',
            'tech': 'Flutter, Rive, Custom Animations',
          },
        ];
        break;
      case 'future':
        projects = [
          {
            'title': 'Flutter & AI 챗봇',
            'description': 'OpenAI API를 활용한 AI 챗봇 애플리케이션',
            'tech': 'Flutter, OpenAI API, WebSocket',
          },
          {
            'title': 'Flutter & Firebase 소셜 앱',
            'description': 'Firebase를 백엔드로 하는 소셜 네트워킹 앱',
            'tech': 'Flutter, Firebase, Authentication',
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
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white.withValues(alpha: 0.03),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title']!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  project['description']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white.withValues(alpha: 0.8),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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
      );
    }

    return projectWidgets;
  }
}
