import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/animation/banner_menu_animation.dart';

class BannerMenuTablet extends StatefulWidget {
  final Function(bool) isActive;
  final DesktopState state;

  const BannerMenuTablet({
    super.key,
    required this.isActive,
    required this.state,
  });

  @override
  State<BannerMenuTablet> createState() => _BannerMenuTabletState();
}

class _BannerMenuTabletState extends State<BannerMenuTablet>
    with TickerProviderStateMixin {
  int index = 0;
  late BannerMenuAnimation menuAnimation;

  @override
  void initState() {
    super.initState();

    menuAnimation = BannerMenuAnimation(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.state.descriptionModel.bannerDescriptionState ==
          BannerDescriptionState.active) {
        menuAnimation.startAnimation();
      }
    });
  }

  void closeMenu() async {
    print('check ==> closeMenu');
    widget.isActive(false);
    menuAnimation.reverse();
  }

  void changeMenu(int newIndex) async {
    if (index == newIndex) return;

    await menuAnimation.changeMenuAnimation();
    setState(() {
      index = newIndex;
    });
  }

  @override
  void dispose() {
    menuAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 메인 컨텐츠
          AnimatedBuilder(
            animation: menuAnimation.animationController,
            builder: (context, child) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 80,
                  left: 20,
                  right: 20,
                  bottom: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 타이틀 영역
                    FadeTransition(
                      opacity: menuAnimation.titleOpacity,
                      child: SlideTransition(
                        position: menuAnimation.titleOffset,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                DescriptionTextConstants.descriptionTitle,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                DescriptionTextConstants.description,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w300,
                                  height: 1.8,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // 메뉴 항목들
                    FadeTransition(
                      opacity: menuAnimation.descriptionOpacity,
                      child: SlideTransition(
                        position: menuAnimation.descriptionOffset,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              BannerDescriptionConstants.menuItems.length,
                              (i) {
                                final isSelected = index == i;
                                final menuItemOpacity = menuAnimation
                                    .getMenuItemOpacity(i);

                                return FadeTransition(
                                  opacity: menuItemOpacity,
                                  child: InkWell(
                                    onTap: () => changeMenu(i),
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            BannerDescriptionConstants
                                                .menuItems[i],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                                  isSelected
                                                      ? FontWeight.w700
                                                      : FontWeight.w400,
                                              color:
                                                  isSelected
                                                      ? Colors.black
                                                      : Colors.grey[500],
                                              letterSpacing: 0.6,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          AnimatedOpacity(
                                            opacity: isSelected ? 1.0 : 0.0,
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            child: Container(
                                              width: 50,
                                              height: 2,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 구분선
                    FadeTransition(
                      opacity: menuAnimation.horizontalLineOpacity,
                      child: SlideTransition(
                        position: menuAnimation.horizontalLineOffset,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 0.5,
                            color: Colors.black.withAlpha(100),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 설명 영역
                    FadeTransition(
                      opacity: menuAnimation.verticalLineOpacity,
                      child: SlideTransition(
                        position: menuAnimation.verticalLineOffset,
                        child: SlideTransition(
                          position: menuAnimation.menuSlideAnimation,
                          child: FadeTransition(
                            opacity: menuAnimation.menuChangeOpacity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 600,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  BannerDescriptionConstants
                                      .bannerDescriptions[BannerDescriptionConstants
                                      .menuItems[index]]!,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.3,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
          // 닫기 버튼
          Positioned(
            top: 32,
            right: 32,
            child: GestureDetector(
              onTap: closeMenu,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Icon(Icons.close, size: 25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
