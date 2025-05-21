import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/animation/intro_ani.dart';

class MenuItemAnimation {
  late final IntroAnimation animation;
  final String text;

  MenuItemAnimation({
    required TickerProvider vsync,
    required this.text,
    double beginDy = 0.1,
  }) {
    animation = IntroAnimation(vsync: vsync, beginDy: beginDy);
  }

  void reset() {
    animation.reset();
  }

  void dispose() {
    animation.dispose();
  }
}
