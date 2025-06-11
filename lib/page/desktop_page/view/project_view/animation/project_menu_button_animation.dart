import 'package:flutter/material.dart';

class ProjectMenuButtonAnimation {
  late final AnimationController scaleController;
  late final Animation<double> scaleAnimation;

  ProjectMenuButtonAnimation({required TickerProvider vsync}) {
    scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: vsync,
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );
  }

  void startPressAnimation() {
    scaleController.forward();
  }

  void endPressAnimation() {
    scaleController.reverse();
  }

  void dispose() {
    scaleController.dispose();
  }
}
