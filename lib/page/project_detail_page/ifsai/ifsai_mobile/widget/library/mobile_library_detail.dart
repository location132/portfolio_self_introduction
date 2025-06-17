import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileLibraryDetail extends StatelessWidget {
  const MobileLibraryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLibrarySection(
          title: '외부 API 및 SDK 연동',
          description: '로그인, 지도, 위치, 인증 등 외부 서비스와 직접 연동되는 패키지',
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
        SizedBox(height: 30.h),
        _buildLibrarySection(
          title: '앱 내부 구조 및 아키텍처 관련',
          description: '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등 구조 설계 관련',
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
        SizedBox(height: 30.h),
        _buildLibrarySection(
          title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
          description: '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험 관련 요소',
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

  Widget _buildLibrarySection({
    required String title,
    required String description,
    required List<String> libraries,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.5,
            ),
          ),
          SizedBox(height: 16.h),
          ...libraries.map(
            (library) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 3.w,
                    height: 3.h,
                    margin: EdgeInsets.only(top: 6.h, right: 8.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      library,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.4,
                      ),
                    ),
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
