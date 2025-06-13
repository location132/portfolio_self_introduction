import 'package:flutter/material.dart';

class LibraryDetailSection extends StatelessWidget {
  const LibraryDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLibraryCategory(
          title: '외부 API 및 SDK 연동',
          description: '로그인, 지도, 위치, 인증 등 외부 서비스와\n직접 연동되는 패키지',
          libraries: [
            'flutter_naver_login',
            'kakao_flutter_sdk',
            'google_sign_in',
            'flutter_secure_storage',
            'flutter_jailbreak_detection',
            'url_launcher',
            'kakao_map_plugin',
            'geolocator',
            'flutter_naver_map',
            'permission_handler',
            'flutter_compass',
          ],
        ),
        const SizedBox(width: 100),
        _buildLibraryCategory(
          title: '앱 내부 구조 및 아키텍처 관련',
          description: '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등\n구조 설계 관련',
          libraries: [
            'provider',
            'get',
            'flutter_bloc',
            'isar',
            'isar_flutter_libs',
            'shared_preferences',
            'dio',
            'dio_cache_interceptor',
            'cookie_jar',
            'dio_cookie_manager',
            'flutter_dotenv',
            'freezed_annotation',
            'build_runner',
            'freezed',
            'injectable',
            'injectable_generator',
            'json_annotation',
            'get_it',
            'path_provider',
          ],
        ),
        const SizedBox(width: 100),
        _buildLibraryCategory(
          title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
          description: '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험\n관련 요소',
          libraries: [
            'cupertino_icons',
            'rive',
            'smooth_page_indicator',
            'intl',
            'shimmer',
            'cached_network_image',
            'custom_rating_bar',
            'expandable_text',
            'flutter_animate',
            'image_picker',
            'custom_refresh_indicator',
            'flutter_svg',
            'sliding_up_panel',
          ],
        ),
      ],
    );
  }

  Widget _buildLibraryCategory({
    required String title,
    required String description,
    required List<String> libraries,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 카테고리 제목
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // 설명
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),

        // 라이브러리 목록
        ...libraries
            .map(
              (library) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  library,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
