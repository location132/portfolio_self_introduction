import 'package:flutter/material.dart';

class ProjectDetailAnimation {
  final AnimationController animationController;
  late final Animation<Offset> slideAnimation;
  late final Animation<double> opacityAnimation;

  ProjectDetailAnimation({required TickerProvider vsync})
    : animationController = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: vsync,
      ) {
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  void show() {
    animationController.forward();
  }

  void hide() {
    animationController.reverse();
  }

  void dispose() {
    animationController.dispose();
  }
}
