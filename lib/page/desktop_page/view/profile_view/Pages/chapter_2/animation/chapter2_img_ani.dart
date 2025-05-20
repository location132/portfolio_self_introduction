import 'package:flutter/material.dart';

class Chapter2ImageAnimation {
  // 10번 페이지 애니메이션
  late AnimationController showController;
  late Animation<Offset> imageMoveShow;
  late Animation<double> imageOpacityShow;
  bool _isAnimationActive = false;

  // 9 => 10 ==> 11번 이미지 변경
  bool _isPage10Active = false;
  bool _isPage11Active = false;

  Chapter2ImageAnimation({required TickerProvider vsync})
      : showController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ) {
    // 9번 페이지 애니메이션
    imageMoveShow = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: showController, curve: Curves.easeInOut));

    imageOpacityShow = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: showController, curve: Curves.easeInOut));
  }

  void animationWithImageForward() async {
    if (_isAnimationActive) return;
    _isAnimationActive = true;
    _isPage10Active = false;
    _isPage11Active = false;
    await Future.delayed(const Duration(milliseconds: 600));
    await showController.forward();
    _isAnimationActive = false;
  }

  // 9 => 10 번 이미지 변경
  void showImagePage10() {
    _isPage10Active = true;
    _isPage11Active = false;
  }

  // 10 => 11 번 이미지 변경
  void showImagePage11() {
    _isPage11Active = true;
    _isPage10Active = false;
  }

  // 11 => 12 번 이미지 변경
  void showImagePage12() {
    _isPage11Active = false;
    _isPage10Active = false;
  }

  void dispose() {
    showController.dispose();
  }

  bool get isPage10Active => _isPage10Active;
  bool get isPage11Active => _isPage11Active;
  bool get isAnimationActive => _isAnimationActive;
}
