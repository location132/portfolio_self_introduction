import 'package:flutter/material.dart';

class BannerMenuAnimation {
  late AnimationController animationController;
  late AnimationController menuChangeController;

  late Animation<double> menuChangeOpacity;
  late Animation<double> titleOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<Offset> titleOffset;
  late Animation<Offset> descriptionOffset;
  late Animation<double> verticalLineOpacity;
  late Animation<double> horizontalLineOpacity;
  late Animation<Offset> verticalLineOffset;
  late Animation<Offset> horizontalLineOffset;
  late Animation<Offset> menuSlideAnimation;

  BannerMenuAnimation({required TickerProvider vsync}) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1500),
    );

    menuChangeController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );

    _initializeAnimations();
  }

  void _initializeAnimations() {
    menuChangeOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: menuChangeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    menuSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.05, 0),
    ).animate(
      CurvedAnimation(
        parent: menuChangeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    titleOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );

    descriptionOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.45, 1, curve: Curves.easeOut),
      ),
    );

    titleOffset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
      ),
    );

    descriptionOffset = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.45, 0.8, curve: Curves.easeOut),
      ),
    );

    verticalLineOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    horizontalLineOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    verticalLineOffset = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    horizontalLineOffset = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );
  }

  Animation<double> getMenuItemOpacity(int index) {
    return Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.3 + (index * 0.1),
          0.6 + (index * 0.1),
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  Animation<Offset> getMenuItemOffset(int index) {
    return Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.3 + (index * 0.1),
          0.6 + (index * 0.1),
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 700), () {
      animationController.forward();
    });
  }

  void forward() {
    animationController.forward();
  }

  void reverse() {
    animationController.reverse();
  }

  Future<void> changeMenuAnimation() async {
    menuChangeController.duration = const Duration(milliseconds: 300);

    await menuChangeController.forward();
    menuChangeController.reset();
  }

  void dispose() {
    animationController.dispose();
    menuChangeController.dispose();
  }
}
