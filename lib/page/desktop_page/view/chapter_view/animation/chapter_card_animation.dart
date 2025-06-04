import 'package:flutter/material.dart';

class ChapterCardAnimation {
  late final AnimationController cardController1;
  late final AnimationController cardController2;
  late final AnimationController cardController3;
  late final AnimationController cardController4;

  late final Animation<Offset> cardAnimation1;
  late final Animation<Offset> cardAnimation2;
  late final Animation<Offset> cardAnimation3;
  late final Animation<Offset> cardAnimation4;

  late final Animation<double> cardOpacity1;
  late final Animation<double> cardOpacity2;
  late final Animation<double> cardOpacity3;
  late final Animation<double> cardOpacity4;

  ChapterCardAnimation({required TickerProvider vsync}) {
    cardController1 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    cardController2 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    cardController3 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    cardController4 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    cardAnimation1 = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: cardController1, curve: Curves.easeOutBack),
    );

    cardAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: cardController2, curve: Curves.easeOutBack),
    );

    cardAnimation3 = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: cardController3, curve: Curves.easeOutBack),
    );

    cardAnimation4 = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: cardController4, curve: Curves.easeOutBack),
    );

    cardOpacity1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: cardController1, curve: Curves.easeInOut),
    );

    cardOpacity2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: cardController2, curve: Curves.easeInOut),
    );

    cardOpacity3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: cardController3, curve: Curves.easeInOut),
    );

    cardOpacity4 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: cardController4, curve: Curves.easeInOut),
    );
  }

  void startAnimations() async {
    cardController1.forward();

    await Future.delayed(const Duration(milliseconds: 150));
    cardController2.forward();

    await Future.delayed(const Duration(milliseconds: 150));
    cardController3.forward();

    await Future.delayed(const Duration(milliseconds: 150));
    cardController4.forward();
  }

  void resetAnimations() {
    cardController1.reset();
    cardController2.reset();
    cardController3.reset();
    cardController4.reset();
  }

  void dispose() {
    cardController1.dispose();
    cardController2.dispose();
    cardController3.dispose();
    cardController4.dispose();
  }
}
