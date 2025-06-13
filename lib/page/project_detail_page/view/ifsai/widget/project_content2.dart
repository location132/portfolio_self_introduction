import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_row_card.dart';

class ProjectContent2 extends StatelessWidget {
  const ProjectContent2({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectRowCard(
      imagePath: 'assets/Images/ifsai_img/web_project_3.png',
      imageDescription: '프로젝트 화면의 일부분입니다.',
      title: '다양한 기술로\n완성도 높은 앱을 만들어요',
      techCategories: const [
        TechCategory(
          title: '인증 & 보안',
          items: [
            'OAuth 2.0 기반 로그인',
            'Google / Kakao / Naver\n소셜 로그인',
            'JWT Token 처리',
            'Flutter Jailbreak Detection',
            'Flutter Secure Storage',
          ],
        ),
        TechCategory(
          title: '네트워크 & API',
          items: [
            'Dio - 커스텀 HTTP 클라이언트',
            'Dio Interceptor',
            'Cache Interceptor',
            'Build Runner - 모델 자동 생성',
          ],
        ),
        TechCategory(
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
        TechCategory(
          title: '기타 기능',
          items: [
            'URL Launcher - 외부 링크',
            'Flutter Compass - 나침반 기능',
            'Flutter Dotenv - 환경변수 관리',
            'Cookie Manager',
          ],
        ),
        TechCategory(
          title: '위치 & 지도',
          items: ['Naver Map', 'Kakao Map', 'Geolocator', 'Permission Handler'],
        ),
      ],
    );
  }
}
