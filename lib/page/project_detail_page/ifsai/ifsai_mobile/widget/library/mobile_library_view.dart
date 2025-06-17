import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'mobile_library_card.dart';

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

class _MobileLibraryViewState extends State<MobileLibraryView>
    with TickerProviderStateMixin {
  bool _isDetail1Visible = false;
  bool _isDetail2Visible = false;
  bool _isDetail3Visible = false;
  bool _isLibraryVisible = false;

  late AnimationController _cardAnimationController;
  late Animation<double> _card1Animation;
  late Animation<double> _card2Animation;
  late Animation<double> _card3Animation;

  @override
  void initState() {
    super.initState();

    _cardAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _card1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _card2Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
      ),
    );

    _card3Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardAnimationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    super.dispose();
  }

  void _onLibraryVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.3 && !_isLibraryVisible) {
      setState(() {
        _isLibraryVisible = true;
      });
      widget.cubit.setLibraryPlayerVisible(true);
      _cardAnimationController.forward();
    } else if (info.visibleFraction <= 0.1 && _isLibraryVisible) {
      setState(() {
        _isLibraryVisible = false;
      });
      widget.cubit.setLibraryPlayerVisible(false);
      _cardAnimationController.reset();
    }
  }

  void _toggleDetail1() {
    setState(() {
      _isDetail1Visible = !_isDetail1Visible;
    });

    if (_isDetail1Visible) {
      widget.cubit.setLibraryPlayerText('외부 API 및 SDK 연동 라이브러리들을 확인하세요');
    } else {
      widget.cubit.setLibraryPlayerText('사진을 클릭해주세요');
    }
  }

  void _toggleDetail2() {
    setState(() {
      _isDetail2Visible = !_isDetail2Visible;
    });

    if (_isDetail2Visible) {
      widget.cubit.setLibraryPlayerText('앱 구조 및 아키텍처 관련 라이브러리들을 확인하세요');
    } else {
      widget.cubit.setLibraryPlayerText('사진을 클릭해주세요');
    }
  }

  void _toggleDetail3() {
    setState(() {
      _isDetail3Visible = !_isDetail3Visible;
    });

    if (_isDetail3Visible) {
      widget.cubit.setLibraryPlayerText('UI/UX 및 애니메이션 라이브러리들을 확인하세요');
    } else {
      widget.cubit.setLibraryPlayerText('사진을 클릭해주세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return VisibilityDetector(
          key: const Key('library-section'),
          onVisibilityChanged: _onLibraryVisibilityChanged,
          child: Container(
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
                    AnimatedBuilder(
                      animation: _card1Animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 30 * (1 - _card1Animation.value)),
                          child: Opacity(
                            opacity: _card1Animation.value,
                            child: GestureDetector(
                              onTap: _toggleDetail1,
                              child: MobileLibraryCard(
                                title: '외부 API 및 SDK 연동',
                                description:
                                    '로그인, 지도, 위치, 인증 등 외부 서비스와\n직접 연동되는 패키지',
                                imagePath: 'assets/Images/ifsai_img/lb_1.png',
                              ),
                            ),
                          ),
                        );
                      },
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
                    AnimatedBuilder(
                      animation: _card2Animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 30 * (1 - _card2Animation.value)),
                          child: Opacity(
                            opacity: _card2Animation.value,
                            child: GestureDetector(
                              onTap: _toggleDetail2,
                              child: MobileLibraryCard(
                                title: '앱 내부 구조 및 아키텍처 관련',
                                description:
                                    '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등\n구조 설계 관련',
                                imagePath: 'assets/Images/ifsai_img/lb_2.png',
                              ),
                            ),
                          ),
                        );
                      },
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
                    AnimatedBuilder(
                      animation: _card3Animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 30 * (1 - _card3Animation.value)),
                          child: Opacity(
                            opacity: _card3Animation.value,
                            child: GestureDetector(
                              onTap: _toggleDetail3,
                              child: MobileLibraryCard(
                                title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
                                description:
                                    '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험\n관련 요소',
                                imagePath: 'assets/Images/ifsai_img/lb_3.png',
                              ),
                            ),
                          ),
                        );
                      },
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
          ),
        );
      },
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
