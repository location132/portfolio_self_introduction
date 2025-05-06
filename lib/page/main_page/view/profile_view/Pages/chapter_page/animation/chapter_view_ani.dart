import 'package:flutter/material.dart';

class ProfileAnimations {
  final AnimationController controller;
  late final Animation<double> fade;
  late final Animation<Offset> slideLeft;
  late final Animation<Offset> slideRight;
  bool isAnimation = false;
  bool isVisible = true;

  ProfileAnimations({required TickerProvider vsync, required this.isVisible})
      : controller = AnimationController(
          duration: const Duration(milliseconds: 900),
          vsync: vsync,
        ) {
    fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    slideLeft = Tween<Offset>(begin: const Offset(-0.2, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    slideRight = Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  Future<void> startAnimation() async {
    if (isAnimation) {
      return;
    }

    isAnimation = true;
    await controller.forward();
    isAnimation = false;
  }

  Future<void> stopAnimation() async {
    if (isAnimation) {
      return;
    }

    isAnimation = true;
    await controller.reverse();
    isAnimation = false;
    isVisible = true;
  }

  void dispose() => controller.dispose();
}
