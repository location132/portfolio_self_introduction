import 'package:flutter/material.dart';

class Chapter2Animation {
  late AnimationController animationController0;
  late Animation<Offset> textMoveAnimation0;
  late Animation<double> textOpacityAnimation0;

  late AnimationController animationController1;
  late Animation<Offset> textMoveAnimation1;
  late Animation<double> textOpacityAnimation1;
  bool _isAnimationActive = false;
  bool _isAnimationReverseActive = false;

  // 9 => 10 ==> 11번 이미지 변경
  bool _isImageChangeActiveWith10 = false;
  bool _isImageChangeActiveWith11 = false;

  // 10번 위젯 생성
  bool _is10WidgetActive = false;

  Chapter2Animation({required TickerProvider vsync})
      : animationController0 = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 720),
        ),
        animationController1 = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ) {
    textMoveAnimation0 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: animationController0, curve: Curves.easeInOut));

    textOpacityAnimation0 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: animationController0, curve: Curves.easeInOut));

    // 10번 페이지 애니메이션
    textMoveAnimation1 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
        CurvedAnimation(parent: animationController1, curve: Curves.easeInOut));

    textOpacityAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: animationController1, curve: Curves.easeInOut));
  }

  void animationWithImageForward() async {
    if (_isAnimationActive) return;
    _isAnimationActive = true;
    _isImageChangeActiveWith10 = false;
    _isImageChangeActiveWith11 = false;

    await Future.delayed(const Duration(milliseconds: 300));
    await animationController0.forward();
    _isAnimationActive = false;
  }

// 10번 위젯 관리
  void manage10Widget(bool isActive) async {
    if (!isActive) {
      _is10WidgetActive = false;
      return;
    }
    if (_is10WidgetActive) {
      await Future.delayed(const Duration(milliseconds: 520));
    }
    _is10WidgetActive = isActive;
  }

  void animationWithTextForward() async {
    if (_isAnimationActive) return;
    _isAnimationActive = true;
    _isAnimationReverseActive = false;
    await Future.delayed(const Duration(milliseconds: 520));
    animationController1.forward();
    _isAnimationActive = false;
  }

  void animationWithTextReverse() async {
    print('check ==> 흐름 2번');
    _isAnimationReverseActive = true;
    await animationController1.reverse();
    _is10WidgetActive = false;
    print('check ==> _is10WidgetActive : $_is10WidgetActive');
  }

  // 9 => 10 번 이미지 변경
  void imageChangeForwardWith10() {
    _isImageChangeActiveWith10 = true;
    _isImageChangeActiveWith11 = false;
  }

  // 10 => 11 번 이미지 변경
  void imageChangeForwardWith11() async {
    _isImageChangeActiveWith11 = true;
    _isImageChangeActiveWith10 = false;
  }

  void disposeWith1() {
    animationController0.dispose();
  }

  void disposeWith2() {
    animationController1.dispose();
  }

  bool get isImageChangeActiveWith10 => _isImageChangeActiveWith10;
  bool get isImageChangeActiveWith11 => _isImageChangeActiveWith11;
  bool get isAnimationActive => _isAnimationActive;
  bool get is10WidgetActive => _is10WidgetActive;
  bool get isAnimationReverseActive => _isAnimationReverseActive;
}
