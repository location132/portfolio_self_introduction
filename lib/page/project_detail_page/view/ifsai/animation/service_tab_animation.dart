import 'package:flutter/material.dart';

class ServiceTabAnimation {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  Animation<double> get fadeAnimation => _fadeAnimation;

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: vsync,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void reset() {
    _controller.reset();
  }

  void dispose() {
    _controller.dispose();
  }

  AnimationController get controller => _controller;
}
