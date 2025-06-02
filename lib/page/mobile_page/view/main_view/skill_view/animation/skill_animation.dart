import 'package:flutter/material.dart';

class SkillAnimation {
  late AnimationController showController;
  late Animation<double> scaleShow;
  late Animation<double> opacityShow;

  SkillAnimation({required TickerProvider vsync})
    : showController = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 600),
      ) {
    scaleShow = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: showController, curve: Curves.easeOutBack),
    );

    opacityShow = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: showController, curve: Curves.easeInOut));
  }

  void forward() {
    showController.forward();
  }

  void reset() {
    showController.reset();
  }

  void dispose() {
    showController.dispose();
  }
}
