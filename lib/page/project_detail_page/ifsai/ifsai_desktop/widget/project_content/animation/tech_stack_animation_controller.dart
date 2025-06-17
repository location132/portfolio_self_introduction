import 'package:flutter/material.dart';

class TechStackAnimationController {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  AnimationController get controller => _controller;
  Animation<double> get fadeAnimation => _fadeAnimation;
  Animation<Offset> get slideAnimation => _slideAnimation;

  void initializeAnimation(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void startAnimation() {
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
  }
}
