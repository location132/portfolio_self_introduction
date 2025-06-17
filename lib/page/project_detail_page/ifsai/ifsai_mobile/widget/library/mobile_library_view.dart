import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'mobile_library_card.dart';
import 'mobile_library_detail.dart';

class MobileLibraryView extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileLibraryView({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  State<MobileLibraryView> createState() => _MobileLibraryViewState();
}

class _MobileLibraryViewState extends State<MobileLibraryView> {
  bool _isDetail1Visible = false;
  bool _isDetail2Visible = false;
  bool _isDetail3Visible = false;

  void _toggleDetail1() {
    setState(() {
      _isDetail1Visible = !_isDetail1Visible;
    });
  }

  void _toggleDetail2() {
    setState(() {
      _isDetail2Visible = !_isDetail2Visible;
    });
  }

  void _toggleDetail3() {
    setState(() {
      _isDetail3Visible = !_isDetail3Visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            '함께하면 더 완벽한 라이브러리',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '잎사이를 완성시켜준 라이브러리들을 소개합니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40.h),

          // 라이브러리 카드들과 개별 상세 정보
          Column(
            children: [
              // 1번 카드
              GestureDetector(
                onTap: _toggleDetail1,
                child: MobileLibraryCard(
                  title: '외부 API 및 SDK 연동',
                  description: '로그인, 지도, 위치, 인증 등 외부 서비스와\n직접 연동되는 패키지',
                  imagePath: 'assets/Images/ifsai_img/lb_1.png',
                ),
              ),
              // 1번 상세 정보
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: _isDetail1Visible ? null : 0,
                child:
                    _isDetail1Visible
                        ? Container(
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white.withValues(alpha: 0.05),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: _buildLibraryList([
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
                          ]),
                        )
                        : const SizedBox.shrink(),
              ),

              SizedBox(height: 20.h),

              // 2번 카드
              GestureDetector(
                onTap: _toggleDetail2,
                child: MobileLibraryCard(
                  title: '앱 내부 구조 및 아키텍처 관련',
                  description: '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등\n구조 설계 관련',
                  imagePath: 'assets/Images/ifsai_img/lb_2.png',
                ),
              ),
              // 2번 상세 정보
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: _isDetail2Visible ? null : 0,
                child:
                    _isDetail2Visible
                        ? Container(
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white.withValues(alpha: 0.05),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: _buildLibraryList([
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
                          ]),
                        )
                        : const SizedBox.shrink(),
              ),

              SizedBox(height: 20.h),

              // 3번 카드
              GestureDetector(
                onTap: _toggleDetail3,
                child: MobileLibraryCard(
                  title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
                  description: '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험\n관련 요소',
                  imagePath: 'assets/Images/ifsai_img/lb_3.png',
                ),
              ),
              // 3번 상세 정보
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: _isDetail3Visible ? null : 0,
                child:
                    _isDetail3Visible
                        ? Container(
                          margin: EdgeInsets.only(top: 16.h),
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white.withValues(alpha: 0.05),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                          ),
                          child: _buildLibraryList([
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
                          ]),
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryList(List<String> libraries) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          libraries
              .map(
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
              )
              .toList(),
    );
  }
}
