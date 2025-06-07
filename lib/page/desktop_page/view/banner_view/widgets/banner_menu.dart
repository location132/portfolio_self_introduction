import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/widgets/banner_menu_desktop.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/widgets/banner_menu_tablet.dart';

class MenuLayout extends StatelessWidget {
  final Function(bool) isActive;
  final DesktopState state;

  const MenuLayout({super.key, required this.isActive, required this.state});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 1100;

    if (isWideScreen) {
      return BannerMenuDesktop(isActive: isActive, state: state);
    } else {
      return BannerMenuTablet(isActive: isActive, state: state);
    }
  }
}
