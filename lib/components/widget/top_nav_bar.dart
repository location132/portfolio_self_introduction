// TODO: 클래스가 3개나 있다니 아주 안좋다. 추 후 교체하자

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class TopNavBar extends StatelessWidget {
  final String? deviceType;
  final Function()? onPressed;
  final Function()? onHomePressed;
  final bool isMenuClicked;
  const TopNavBar({
    super.key,
    this.deviceType = 'desktop',
    this.onPressed,
    this.onHomePressed,
    required this.isMenuClicked,
  });

  @override
  Widget build(BuildContext context) {
    // 데스크탑
    if (deviceType == 'desktop') {
      return Container(
        color: const Color(0xFFF8F8F8),
        child: Padding(
          padding: EdgeInsets.only(top: 15.sh, bottom: 15.sh),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(width: 11.sw),
              Image.asset('assets/Images/flutter_bird.png', scale: 25),
              const NavItem(title: TextConstants.topNavBar1),
              const NavItem(title: TextConstants.topNavBar2),
              const NavItem(title: TextConstants.topNavBar3),
              const NavItem(title: TextConstants.topNavBar4),
              const NavItem(title: TextConstants.topNavBar5),
              const NavItem(title: TextConstants.topNavBar6),
              const NavItem(title: TextConstants.topNavBar7),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      // 모바일
      return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sh, horizontal: 40.sw),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onHomePressed?.call();
                    },
                    child: Image.asset(
                      'assets/Images/flutter_bird.png',
                      scale: 25,
                    ),
                  ),
                  const Spacer(),
                  MenuToggleButton(
                    onPressed: onPressed!,
                    isMenuClicked: isMenuClicked,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.sh),
          ],
        ),
      );
    }
  }
}

class NavItem extends StatelessWidget {
  final String title;
  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.sw),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            debugPrint("$title 클릭됨");
          },
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class MenuToggleButton extends StatefulWidget {
  final bool isMenuClicked;
  final VoidCallback onPressed;
  const MenuToggleButton({
    super.key,
    required this.onPressed,
    required this.isMenuClicked,
  });

  @override
  State<MenuToggleButton> createState() => _MenuToggleButtonState();
}

class _MenuToggleButtonState extends State<MenuToggleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void didUpdateWidget(MenuToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isMenuClicked != oldWidget.isMenuClicked) {
      if (widget.isMenuClicked) {
        _ctrl.forward();
      } else {
        _ctrl.reverse();
      }
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    if (widget.isMenuClicked) {
      _ctrl.reverse();
    } else {
      _ctrl.forward();
    }
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _ctrl),
      onPressed: _toggle,
    );
  }
}
