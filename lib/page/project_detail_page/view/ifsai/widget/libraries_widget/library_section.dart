import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/libraries_widget/library_card.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/libraries_widget/library_detail_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/libraries_widget/animation/library_cards_animation.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '함께하면 더 완벽한 라이브러리',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
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
            fontSize: 18,
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
                          LibraryCard(
                            title: '외부 API 및 SDK 연동',
                            description:
                                '로그인, 지도, 위치, 인증 등 외부 서비스와\n직접 연동되는 패키지',
                            imagePath: 'assets/Images/ifsai_img/lb_1.png',
                            isLibraryDetailVisible:
                                widget.state.isLibraryDetailVisible,
                          ),
                          SizedBox(width: 40),
                          LibraryCard(
                            title: '앱 내부 구조 및 아키텍처 관련',
                            description:
                                '앱 구성, 의존성 주입, 상태 관리, DB, 캐시 등\n구조 설계 관련',
                            imagePath: 'assets/Images/ifsai_img/lb_2.png',
                            isLibraryDetailVisible:
                                widget.state.isLibraryDetailVisible,
                          ),
                          SizedBox(width: 40),
                          LibraryCard(
                            title: 'UI/UX 및 애니메이션, 기타 뷰 요소',
                            description: '화면 구성, 애니메이션, 뷰 전환 등 사용자 경험\n관련 요소',
                            imagePath: 'assets/Images/ifsai_img/lb_3.png',
                            isLibraryDetailVisible:
                                widget.state.isLibraryDetailVisible,
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
}
