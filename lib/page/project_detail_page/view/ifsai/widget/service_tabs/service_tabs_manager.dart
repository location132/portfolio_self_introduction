import 'package:flutter/material.dart';
import 'service_data.dart';
import 'animation/service_tabs_animation_controller.dart';
import 'responsive/desktop_service_layout.dart';
import 'responsive/tablet_service_layout.dart';
import 'responsive/mobile_service_layout.dart';

class ServiceTabsManager {
  static Widget build(
    BuildContext context,
    bool isServiceTabVisible,
    List<ServiceData> services,
    TabController tabController,
    ServiceTabsAnimationController animationController,
    Widget Function(ServiceData) buildServiceCard,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1024) {
      return DesktopServiceLayout.build(
        isServiceTabVisible,
        services,
        tabController,
        animationController,
        buildServiceCard,
      );
    } else if (screenWidth > 600) {
      return TabletServiceLayout.build(
        isServiceTabVisible,
        services,
        tabController,
        animationController,
        buildServiceCard,
      );
    } else {
      return MobileServiceLayout.build(
        isServiceTabVisible,
        services,
        tabController,
        animationController,
        buildServiceCard,
      );
    }
  }
}
