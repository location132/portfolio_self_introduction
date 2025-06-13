import 'package:flutter/material.dart';

class BackgroundGridAnimation {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void initialize(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutCubic,
    );
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;

    if (_isExpanded) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void dispose() {
    animationController.dispose();
  }

  Widget buildAnimatedCard({
    required Widget child,
    required int row,
    required bool shouldAnimate,
  }) {
    if (shouldAnimate) {
      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Interval((row - 2) * 0.1, 1.0, curve: Curves.easeOutCubic),
            ),
          ),
          child: child,
        ),
      );
    }

    return child;
  }

  Widget buildExpandButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isExpanded ? '접기' : '더보기',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              turns: _isExpanded ? 0.5 : 0,
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGradientOverlay() {
    if (_isExpanded) return const SizedBox.shrink();

    return Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.6),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}
