// lib/page/main_page/view/profile_view/Pages/chapter_2/animation/chapter2_text_ani.dart
import 'package:flutter/material.dart';

class Chapter2TextAnimation {
/*------------------------------------------------ */
  // 등장용 컨트롤러 및 애니메이션
  final AnimationController _showController;
  late final Animation<Offset> textMoveShow;
  late final Animation<double> textOpacityShow;

  // 퇴장용 컨트롤러 및 애니메이션
  final AnimationController _hideController;
  late final Animation<Offset> textMoveHide;
  late final Animation<double> textOpacityHide;
/*------------------------------------------------ */

/*------------------------------------------------ */
  // 등장용 컨트롤러 및 애니메이션
  final AnimationController _showController2;
  late final Animation<Offset> textMoveShow2;
  late final Animation<double> textOpacityShow2;

  // 퇴장용 컨트롤러 및 애니메이션
  final AnimationController _hideController2;
  late final Animation<Offset> textMoveHide2;
  late final Animation<double> textOpacityHide2;
/*------------------------------------------------ */

  Chapter2TextAnimation({required TickerProvider vsync})
      : _showController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ),
        _hideController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ),
        _showController2 = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ),
        _hideController2 = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ) {
/*--------------------------  1번 텍스트 애니메이션 -------------------------- */
    textMoveShow = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _showController, curve: Curves.easeInOut),
    );
    textOpacityShow = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _showController, curve: Curves.easeInOut),
    );

    textMoveHide = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(parent: _hideController, curve: Curves.easeInOut),
    );
    textOpacityHide = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _hideController, curve: Curves.easeInOut),
    );
/*------------------------------------------------------------------------ */

/*--------------------------  2번 텍스트 애니메이션 -------------------------- */

    textMoveShow2 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _showController2, curve: Curves.easeInOut),
    );
    textOpacityShow2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _showController2, curve: Curves.easeInOut),
    );

    textMoveHide2 = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(parent: _hideController2, curve: Curves.easeInOut),
    );
    textOpacityHide2 = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: _hideController2, curve: Curves.easeInOut),
    );
/*------------------------------------------------------------------------ */
  }

  Future<void> text1AnimationStart() async {
    await Future.delayed(const Duration(milliseconds: 520));
    await _showController.forward();
  }

  Future<void> text2AnimationStart() async {
    await _hideController.forward();
    await _showController2.forward();
  }

  Future<void> text3AnimationStart() async {
    await _hideController2.forward();
  }

  Future<void> reverseHide() async {
    await _showController2.reverse();
    await _hideController.reverse();
  }

  Future<void> reverseShow() async {
    await _showController.reverse();
  }

  Future<void> finishHide() async {
    await Future.delayed(const Duration(milliseconds: 520));
    await _hideController2.reverse();
  }

  void dispose() {
    _showController.dispose();
    _hideController.dispose();
    _showController2.dispose();
    _hideController2.dispose();
  }
}
