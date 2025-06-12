import 'package:flutter/material.dart';

class IfsaiDetailAnimation {
  late AnimationController _controller;
  late Animation<double> _projectNameEnAnimation;
  late Animation<double> _logoAnimation;
  late Animation<double> _dividerAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _dividerSlideAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _textToLogoFadeAnimation;

  Animation<double> get projectNameEnOpacity => _projectNameEnAnimation;
  Animation<double> get logoOpacity => _logoAnimation;
  Animation<double> get dividerOpacity => _dividerAnimation;
  Animation<Offset> get logoSlide => _logoSlideAnimation;
  Animation<Offset> get dividerSlide => _dividerSlideAnimation;
  Animation<double> get logoScale => _logoScaleAnimation;
  Animation<double> get textToLogoFade => _textToLogoFadeAnimation;

  void initialize(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3800),
      vsync: vsync,
    );

    _projectNameEnAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _textToLogoFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.65, curve: Curves.easeInCubic),
      ),
    );

    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _logoSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _dividerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _dividerSlideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOutCubic),
      ),
    );
  }

  void startAnimation() {
    _controller.forward();
  }

  void dispose() {
    _controller.dispose();
  }

  AnimationController get controller => _controller;
}
