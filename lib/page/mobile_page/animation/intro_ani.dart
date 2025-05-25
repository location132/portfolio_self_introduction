import 'package:flutter/material.dart';

class TextMoveAnimation {
  late AnimationController showController;
  late Animation<Offset> moveShow;
  late Animation<double> opacityShow;

  TextMoveAnimation({
    required TickerProvider vsync,
    double beginDy = 0.5,
    int duration = 620,
  }) : showController = AnimationController(
         vsync: vsync,
         duration: Duration(milliseconds: duration),
       ) {
    moveShow = Tween<Offset>(
      begin: Offset(0, beginDy),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: showController, curve: Curves.easeInOut));

    opacityShow = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: showController, curve: Curves.easeInOut));
  }

  void forward() {
    showController.forward();
  }

  void reset() {
    showController.reset();
  }

  void reverse() {
    showController.reverse();
  }

  void dispose() {
    showController.dispose();
  }
}
