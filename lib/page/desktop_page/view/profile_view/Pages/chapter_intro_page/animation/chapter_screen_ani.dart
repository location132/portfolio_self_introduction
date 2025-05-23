import 'package:flutter/material.dart';

class ChapterScreenAnimation {
  final AnimationController backdropController;
  late final Animation<double> backdropOpacity;
  late final Animation<double> backdropBlur;
  final AnimationController contentController;
  late final Animation<double> textOpacity;
  late final Animation<Offset> textSlide;
  late final Animation<double> buttonOpacity;
  late final Animation<Offset> buttonSlide;

  late String chapterNumber;
  late String chapterTitle;
  late String chapterContent;

  bool _isAnimationActiveWithContent = false;
  bool _isAnimationActiveWithBackdrop = false;

  ChapterScreenAnimation({required TickerProvider vsync})
      : backdropController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 1000),
        ),
        contentController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 1000),
        ) {
    backdropOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: backdropController, curve: Curves.easeInOut),
    );
    backdropBlur = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: backdropController, curve: Curves.easeInOut),
    );

    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: contentController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );
    textSlide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(
          parent: contentController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );

    buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: contentController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeOut)),
    );
    buttonSlide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(
          parent: contentController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeOut)),
    );
  }

  void startAnimationWithContent() async {
    if (_isAnimationActiveWithContent) {
      return;
    }
    await Future.delayed(const Duration(milliseconds: 420));
    contentController.forward();
    _isAnimationActiveWithContent = true;
  }

  void startAnimationWithBackdrop() async {
    if (_isAnimationActiveWithBackdrop) {
      return;
    }
    backdropController.forward();
    _isAnimationActiveWithBackdrop = true;
  }

  void reverseAnimationWithContent() async {
    if (!_isAnimationActiveWithContent) {
      return;
    }
    contentController.reverse();
    _isAnimationActiveWithContent = false;
  }

  void reverseAnimationWithBackdrop() async {
    if (!_isAnimationActiveWithBackdrop) {
      return;
    }
    backdropController.reverse();
    _isAnimationActiveWithBackdrop = false;
  }

  void dispose() async {
    backdropController.dispose();
    contentController.dispose();
  }
}
