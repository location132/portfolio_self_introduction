import 'package:flutter/material.dart';

class TerminalAnimationController {
  late AnimationController _cursorController;
  late Animation<double> _cursorAnimation;

  AnimationController get cursorController => _cursorController;
  Animation<double> get cursorAnimation => _cursorAnimation;

  void initializeAnimation(TickerProvider vsync) {
    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _cursorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _cursorController, curve: Curves.easeInOut),
    );

    _cursorController.repeat(reverse: true);
  }

  void dispose() {
    _cursorController.dispose();
  }
}
