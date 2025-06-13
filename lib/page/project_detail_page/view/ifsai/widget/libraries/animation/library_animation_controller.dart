import 'package:flutter/material.dart';

class LibraryAnimationController {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _positionAnimation;
  late Animation<double> _listOpacityAnimation;

  AnimationController get animationController => _animationController;
  Animation<double> get scaleAnimation => _scaleAnimation;
  Animation<double> get positionAnimation => _positionAnimation;
  Animation<double> get listOpacityAnimation => _listOpacityAnimation;

  void initialize(TickerProvider vsync) {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _positionAnimation = Tween<double>(begin: 0.0, end: -80.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _listOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  void dispose() {
    _animationController.dispose();
  }
}
