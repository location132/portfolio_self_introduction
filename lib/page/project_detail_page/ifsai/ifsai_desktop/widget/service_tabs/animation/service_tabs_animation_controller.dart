import 'package:flutter/material.dart';

class ServiceTabsAnimationController {
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  void initializeAnimation(TickerProvider provider) {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: provider,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeIn));
  }

  void startAnimation() {
    fadeController.reset();
    fadeController.forward();
  }

  void dispose() {
    fadeController.dispose();
  }
}
