import 'package:flutter/material.dart';

class LibraryCardsAnimation {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  Animation<double> get scale => _scaleAnimation;
  Animation<Offset> get slide => _slideAnimation;

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.3),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void startAnimation() {
    _controller.forward();
  }

  void reverseAnimation() {
    _controller.reverse();
  }

  void dispose() {
    _controller.dispose();
  }
}
