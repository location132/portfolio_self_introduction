import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    TextConstants.topNavBar1,
    TextConstants.topNavBar2,
    TextConstants.topNavBar3,
    TextConstants.topNavBar4,
    TextConstants.topNavBar5,
    TextConstants.topNavBar6,
    TextConstants.topNavBar7,
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
          child: AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: widget.isMenuClicked ? maxHeight : 0,
            width: double.infinity,
            color: Colors.white,
            child: ListView.builder(
              itemCount: menuItemAnimations.length,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              itemBuilder: (context, index) {
                final ani = menuItemAnimations[index];
                return SlideTransition(
                  position: ani.animation.moveShow,
                  child: FadeTransition(
                    opacity: ani.animation.opacityShow,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        ani.text,
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
