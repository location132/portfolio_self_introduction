import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/animation/menu_ani.dart';

class MenuScreen extends StatefulWidget {
  final bool isMenuClicked;
  const MenuScreen({super.key, required this.isMenuClicked});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late List<MenuItemAnimation> menuItemAnimations;
  final List<String> menuTexts = [
    '2025년 포트폴리오 모바일 버전에서는\n아래의 내용을 확인할 수 있습니다.',
    TextConstants.topNavBar1,
    TextConstants.topNavBar2,
    TextConstants.topNavBar3,
    TextConstants.topNavBar4,
    TextConstants.topNavBar5,
  ];

  @override
  void initState() {
    super.initState();
    menuItemAnimations = List.generate(
      menuTexts.length,
      (i) => MenuItemAnimation(vsync: this, text: menuTexts[i], beginDy: 0.2),
    );
  }

  @override
  void didUpdateWidget(MenuScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMenuClicked != oldWidget.isMenuClicked) {
      if (widget.isMenuClicked) {
        for (var i = 0; i < menuItemAnimations.length; i++) {
          Future.delayed(Duration(milliseconds: 100 * i), () {
            if (mounted) {
              menuItemAnimations[i].animation.forward();
            }
          });
        }
      } else {
        for (var ani in menuItemAnimations) {
          ani.reset();
        }
      }
    }
  }

  @override
  void dispose() {
    for (final ani in menuItemAnimations) {
      ani.dispose();
    }
    super.dispose();
  }

  void _handleMenuTap(int index, String text) {
    if (index == 0) return;

    if (text == TextConstants.topNavBar1) {
      context.go('/');
    } else if (text == TextConstants.topNavBar2) {
      context.go('/projects');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$text 페이지가 곧 준비됩니다!'),
          backgroundColor: Colors.black.withValues(alpha: 0.9),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Opacity(
          opacity: 0.0,
          child: IgnorePointer(
            ignoring: true,
            child: TopNavBar(
              isMenuClicked: widget.isMenuClicked,
              deviceType: 'mobile',
              onPressed: () {},
              onHomePressed: () {},
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              AnimatedContainer(
                clipBehavior: Clip.hardEdge,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                height: widget.isMenuClicked ? maxHeight : 0,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      ...menuItemAnimations.asMap().entries.map((entry) {
                        final index = entry.key;
                        final ani = entry.value;
                        return Padding(
                          padding:
                              index == 0
                                  ? EdgeInsets.only(
                                    bottom: 30.h,
                                    left: 20.w,
                                    right: 20.w,
                                  )
                                  : EdgeInsets.symmetric(
                                    vertical: 8.h,
                                    horizontal: 20.w,
                                  ),
                          child: SlideTransition(
                            position: ani.animation.moveShow,
                            child: FadeTransition(
                              opacity: ani.animation.opacityShow,
                              child: GestureDetector(
                                onTap: () => _handleMenuTap(index, ani.text),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Text(
                                    ani.text,
                                    textAlign:
                                        index == 0
                                            ? TextAlign.center
                                            : TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          index == 0
                                              ? Colors.grey[600]
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
