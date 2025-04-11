//TODO: 추후 리펙터링 큐빅과 다른 걸로 분리

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class CircleMenuLayout extends StatefulWidget {
  final Function(bool) isActive;
  final MainPageState state;
  const CircleMenuLayout({
    super.key,
    required this.isActive,
    required this.state,
  });

  @override
  State<CircleMenuLayout> createState() => _CircleMenuLayoutState();
}

class _CircleMenuLayoutState extends State<CircleMenuLayout>
    with TickerProviderStateMixin {
  int index = 0;

  late AnimationController _animationController;
  late AnimationController _menuChangeController;
  late Animation<double> _menuChangeOpacity;
  late Animation<double> _titleOpacity;
  late Animation<double> _descriptionOpacity;
  late Animation<Offset> _titleOffset;
  late Animation<Offset> _descriptionOffset;
  late Animation<double> _verticalLineOpacity;
  late Animation<double> _horizontalLineOpacity;
  late Animation<Offset> _verticalLineOffset;
  late Animation<Offset> _horizontalLineOffset;
  late Animation<Offset> _menuSlideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _menuChangeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _menuChangeOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _menuChangeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _menuSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.05, 0),
    ).animate(
      CurvedAnimation(
        parent: _menuChangeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // 왼쪽 타이틀 투명도
    _titleOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );

    // 중앙(오른쪽) 설명 투명도
    _descriptionOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.45, 1, curve: Curves.easeOut),
      ),
    );

    // 왼쪽 타이틀 애니메이션
    _titleOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );

    // 중앙(오른쪽) 메뉴 애니메이션
    _descriptionOffset = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.45, 0.8, curve: Curves.easeOut),
      ),
    );

    // 세로 구분선 투명도
    _verticalLineOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    // 가로 구분선 투명도
    _horizontalLineOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    // 세로 구분선 애니메이션
    _verticalLineOffset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    // 가로 구분선 애니메이션
    _horizontalLineOffset = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.state.descriptionModel.bannerDescriptionState ==
          BannerDescriptionState.active) {
        Future.delayed(const Duration(milliseconds: 700), () {
          _animationController.forward();
        });
      }
    });
  }

  void closeMenu() async {
    _animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 1500));
    widget.isActive(false);
  }

  void changeMenu(int newIndex) async {
    if (index == newIndex) return;

    await _menuChangeController.forward();
    setState(() {
      index = newIndex;
    });
    await _menuChangeController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _menuChangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: 32,
                right: 32,
                child: GestureDetector(
                  onTap: () {
                    closeMenu();
                  },
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(40),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.close, size: 25),
                    ),
                  ),
                ),
              ),
              // 왼쪽 타이틀 영역
              Positioned(
                top: 60,
                left: 172.sw,
                child: FadeTransition(
                  opacity: _titleOpacity,
                  child: SlideTransition(
                    position: _titleOffset,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                          BannerDescriptionConstants.menuItems.length, (i) {
                        final isSelected = index == i;

                        final menuItemOpacity =
                            Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.3 + (i * 0.1), 0.6 + (i * 0.1),
                                curve: Curves.easeOut),
                          ),
                        );

                        final menuItemOffset = Tween<Offset>(
                          begin: const Offset(0, 0.3),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(0.3 + (i * 0.1), 0.6 + (i * 0.1),
                                curve: Curves.easeOut),
                          ),
                        );

                        return FadeTransition(
                          opacity: menuItemOpacity,
                          child: SlideTransition(
                            position: menuItemOffset,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: InkWell(
                                onTap: () {
                                  changeMenu(i);
                                },
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
                                        fontWeight: isSelected
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.grey[500],
                                        letterSpacing: 0.6,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    AnimatedOpacity(
                                      opacity: isSelected ? 1.0 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
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
                    ),
                    const SizedBox(width: 100),
                    FadeTransition(
                      opacity: _verticalLineOpacity,
                      child: SlideTransition(
                        position: _verticalLineOffset,
                        child: Container(
                          width: 0.1,
                          height: 600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _descriptionOpacity,
                      child: SlideTransition(
                        position: _descriptionOffset,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: SlideTransition(
                                position: _menuSlideAnimation,
                                child: FadeTransition(
                                  opacity: _menuChangeOpacity,
                                  child: Text(
                                    BannerDescriptionConstants
                                            .bannerDescriptions[
                                        BannerDescriptionConstants
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
                              opacity: _horizontalLineOpacity,
                              child: SlideTransition(
                                position: _horizontalLineOffset,
                                child: Container(
                                  height: 0.1,
                                  width: 820,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
