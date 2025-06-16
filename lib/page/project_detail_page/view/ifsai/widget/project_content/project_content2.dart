import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_content/widget/project_image_card.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_content/widget/project_row_card.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';

class ProjectContent2 extends StatefulWidget {
  final bool isProjectCard3Visible;

  final IfsaiCubit cubit;

  const ProjectContent2({
    super.key,
    required this.isProjectCard3Visible,

    required this.cubit,
  });

  @override
  State<ProjectContent2> createState() => _ProjectContent2State();
}

class _ProjectContent2State extends State<ProjectContent2> {
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('project-content2-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.8 && !widget.isProjectCard3Visible) {
          widget.cubit.onProjectCard3VisibilityChanged();
        }
      },
      child: Column(
        children: [
          // 이미지
          ProjectImageCard(
            imagePath: 'assets/Images/ifsai_img/web_project_3.png',
            imageDescription: '아래의 기술은 잎사이 프로젝트에 적용된 기술입니다!',
            title: '다양한 기술로\n완성도 높은 앱을 만들어요',
          ),
          //  텍스트
          WidgetAnimation(
            isStart: widget.isProjectCard3Visible,
            beginDy: 0.4,
            duration: 1000,
            child: SizedBox(
              width: 1500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProjectRowCard(
                    title: '인증 & 보안',
                    items: [
                      'OAuth 2.0 기반 로그인',
                      'Google / Kakao / Naver\n소셜 로그인',
                      'JWT Token 처리',
                      'Flutter Jailbreak Detection',
                      'Flutter Secure Storage',
                    ],
                  ),
                  SizedBox(width: 30),
                  ProjectRowCard(
                    title: '네트워크 & API',
                    items: [
                      'Dio - 커스텀 HTTP 클라이언트',
                      'Dio Interceptor',
                      'Cache Interceptor',
                      'Build Runner - 모델 자동 생성',
                    ],
                  ),
                  SizedBox(width: 30),
                  ProjectRowCard(
                    title: 'UI/UX & 애니메이션',
                    items: [
                      'Rive Animation - 커스텀 인터랙션',
                      'TweenAnimationBuilder',
                      '기본 애니메이션',
                      'Shimmer - 로딩 스켈레톤',
                      'Custom Refresh Indicator',
                      'CachedNetworkImage',
                      'ImagePicker',
                    ],
                  ),
                  SizedBox(width: 30),
                  ProjectRowCard(
                    title: '기타 기능',
                    items: [
                      'URL Launcher - 외부 링크',
                      'Flutter Compass - 나침반 기능',
                      'Flutter Dotenv - 환경변수 관리',
                      'Cookie Manager',
                    ],
                  ),
                  SizedBox(width: 30),
                  ProjectRowCard(
                    title: '위치 & 지도',
                    items: [
                      'Naver Map',
                      'Kakao Map',
                      'Geolocator',
                      'Permission Handler',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
