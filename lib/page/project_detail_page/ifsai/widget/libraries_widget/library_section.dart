import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/libraries_widget/library_card.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/libraries_widget/library_detail_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/libraries_widget/animation/library_cards_animation.dart';

class LibrarySection extends StatefulWidget {
  final IfsaiState state;
  const LibrarySection({super.key, required this.state});

  @override
  State<LibrarySection> createState() => _LibrarySectionState();
}

class _LibrarySectionState extends State<LibrarySection>
    with TickerProviderStateMixin {
  late LibraryCardsAnimation _cardsAnimation;

  @override
  void initState() {
    super.initState();
    _cardsAnimation = LibraryCardsAnimation();
    _cardsAnimation.initialize(this);
  }

  @override
  void didUpdateWidget(LibrarySection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state.isLibraryCardsAnimationStarted !=
        widget.state.isLibraryCardsAnimationStarted) {
      if (widget.state.isLibraryCardsAnimationStarted) {
        _cardsAnimation.startAnimation();
      } else {
        _cardsAnimation.reverseAnimation();
      }
    }
  }

  @override
  void dispose() {
    _cardsAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 1000) {
      return _buildSimpleLayout();
    }

    double titleFontSize = screenWidth > 1024 ? 32 : 28;
    double descriptionFontSize = screenWidth > 1024 ? 18 : 16;

    double cardSpacing = screenWidth > 1024 ? 40 : 30;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '함께하면 더 완벽한 라이브러리',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '잎사이를 완성시켜준 라이브러리들을 소개합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: descriptionFontSize,
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          height: widget.state.isLibraryDetailVisible ? 140 : 80,
        ),

        SizedBox(
          height: 1000,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _cardsAnimation.scale,
                builder: (context, child) {
                  return SlideTransition(
                    position: _cardsAnimation.slide,
                    child: Transform.scale(
                      scale: _cardsAnimation.scale.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: LibraryCard(
                              title: '외부 API 및 SDK 연동',
                              description:
                                  '로그인, 지도, 위치, 인증 등 외부 서비스와\n직접 연동되는 패키지',
                              imagePath: 'assets/Images/ifsai_img/lb_1.png',
                              isLibraryDetailVisible:
                                  widget.state.isLibraryDetailVisible,
                            ),
                          ),
                          SizedBox(width: cardSpacing),
                          Flexible(
                            child: LibraryCard(
                              title: '앱 내부 구조 및 아키텍처 관련',
                              description:
                                  '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등\n구조 설계 관련',
                              imagePath: 'assets/Images/ifsai_img/lb_2.png',
                              isLibraryDetailVisible:
                                  widget.state.isLibraryDetailVisible,
                            ),
                          ),
                          SizedBox(width: cardSpacing),
                          Flexible(
                            child: LibraryCard(
                              title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
                              description: '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험\n관련 요소',
                              imagePath: 'assets/Images/ifsai_img/lb_3.png',
                              isLibraryDetailVisible:
                                  widget.state.isLibraryDetailVisible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 350,
                left: 0,
                right: 0,
                bottom: 0,
                child: WidgetAnimation(
                  isStart: widget.state.isLibraryDetailVisible,
                  isReverse: !widget.state.isLibraryDetailVisible,
                  beginDy: 0.5,
                  duration: 700,
                  child: LibraryDetailSection(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleLayout() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '함께하면 더 완벽한 라이브러리',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth > 600 ? 24 : 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '잎사이를 완성시켜준 라이브러리들을 소개합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth > 600 ? 14 : 12,
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40),

        // 간단한 한 줄 카드 배치 (애니메이션 없음)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildSimpleCard(
                '외부 API',
                '로그인, 지도, 위치 등',
                'assets/Images/ifsai_img/lb_1.png',
              ),
              const SizedBox(width: 16),
              _buildSimpleCard(
                '앱 구조',
                '상태관리, DB, 캐시 등',
                'assets/Images/ifsai_img/lb_2.png',
              ),
              const SizedBox(width: 16),
              _buildSimpleCard(
                'UI/UX',
                '애니메이션, 뷰 전환 등',
                'assets/Images/ifsai_img/lb_3.png',
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // 모든 라이브러리 리스트
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withValues(alpha: 0.05),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '외부 API 및 SDK 연동',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              _buildLibraryList([
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
              const SizedBox(height: 20),

              Text(
                '앱 내부 구조 및 아키텍처 관련',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              _buildLibraryList([
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
                'injectable',
                'get_it',
              ]),
              const SizedBox(height: 20),

              Text(
                'UI/UX 및 애니메이션, 기타 뷰 요소',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 16 : 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              _buildLibraryList([
                'cupertino_icons',
                'rxs',
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
                'visibility_detector',
              ]),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSimpleCard(String title, String description, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth > 600 ? 180 : 150;

    return Container(
      width: cardWidth,
      height: cardWidth * 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(screenWidth > 600 ? 8 : 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 12 : 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: screenWidth > 600 ? 3 : 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 9 : 8,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryList(List<String> libraries) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          libraries
              .map(
                (library) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.only(top: 6, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          library,
                          style: TextStyle(
                            fontSize: screenWidth > 600 ? 12 : 10,
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
