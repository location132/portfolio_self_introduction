import 'package:flutter/material.dart';

class PlayerAni {
  late AnimationController controller;
  late Animation<double> width;
  late Animation<double> containerOpacity;
  late Animation<double> textOpacity;
  late Animation<double> blur;

  PlayerAni({required TickerProvider vsync})
    : controller = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 500),
      ) {
    const appleCurve = Cubic(0.2, 0.0, 0.2, 1.0);

    width = Tween<double>(begin: 0, end: 320).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.8, curve: appleCurve),
      ),
    );

    containerOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.6, curve: appleCurve),
      ),
    );

    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: appleCurve),
      ),
    );

    blur = Tween<double>(begin: 5.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.7, curve: appleCurve),
      ),
    );
  }

  void forward() {
    controller.forward();
  }

  void dispose() {
    controller.dispose();
  }
}
