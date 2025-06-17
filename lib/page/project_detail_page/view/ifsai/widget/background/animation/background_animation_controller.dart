import 'package:flutter/material.dart';

class BackgroundAnimationController {
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  void initializeAnimation(TickerProvider provider) {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: provider,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));
  }

  void startFadeIn() {
    fadeController.forward();
  }

  void dispose() {
    fadeController.dispose();
  }
}
