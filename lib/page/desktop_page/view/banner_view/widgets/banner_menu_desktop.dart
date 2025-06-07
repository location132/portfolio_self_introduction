import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/animation/banner_menu_animation.dart';

class BannerMenuDesktop extends StatefulWidget {
  final Function(bool) isActive;
  final DesktopState state;

  const BannerMenuDesktop({
    super.key,
    required this.isActive,
    required this.state,
  });

  @override
  State<BannerMenuDesktop> createState() => _BannerMenuDesktopState();
}

class _BannerMenuDesktopState extends State<BannerMenuDesktop>
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
      body: AnimatedBuilder(
        animation: menuAnimation.animationController,
        builder: (context, child) {
          return Stack(
            children: [
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

              // 왼쪽 타이틀 영역
              Positioned(
                top: 60,
                left: 172.sw,
                child: FadeTransition(
                  opacity: menuAnimation.titleOpacity,
                  child: SlideTransition(
                    position: menuAnimation.titleOffset,
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

              // 중앙 메뉴와 오른쪽 설명
              Positioned(
                top: 270,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMenuItems(),
                    const SizedBox(width: 100),
                    FadeTransition(
                      opacity: menuAnimation.verticalLineOpacity,
                      child: SlideTransition(
                        position: menuAnimation.verticalLineOffset,
                        child: Container(
                          width: 0.1,
                          height: 600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _buildDescriptionSection(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(BannerDescriptionConstants.menuItems.length, (i) {
        final isSelected = index == i;
        final menuItemOpacity = menuAnimation.getMenuItemOpacity(i);
        final menuItemOffset = menuAnimation.getMenuItemOffset(i);

        return FadeTransition(
          opacity: menuItemOpacity,
          child: SlideTransition(
            position: menuItemOffset,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InkWell(
                onTap: () => changeMenu(i),
                borderRadius: BorderRadius.circular(4),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      BannerDescriptionConstants.menuItems[i],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w400,
                        color: isSelected ? Colors.black : Colors.grey[500],
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    AnimatedOpacity(
                      opacity: isSelected ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: SizedBox(
                        width: 150,
                        child: Divider(
                          color: Colors.black.withAlpha(200),
                          height: 1,
                          thickness: 2.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDescriptionSection() {
    return FadeTransition(
      opacity: menuAnimation.descriptionOpacity,
      child: SlideTransition(
        position: menuAnimation.descriptionOffset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: SlideTransition(
                position: menuAnimation.menuSlideAnimation,
                child: FadeTransition(
                  opacity: menuAnimation.menuChangeOpacity,
                  child: Text(
                    BannerDescriptionConstants
                        .bannerDescriptions[BannerDescriptionConstants
                        .menuItems[index]]!,
                    style: TextStyle(
                      fontSize: 17.5,
                      height: 2.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: menuAnimation.horizontalLineOpacity,
              child: SlideTransition(
                position: menuAnimation.horizontalLineOffset,
                child: Container(height: 0.1, width: 820, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
