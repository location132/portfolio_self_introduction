import 'package:flutter/material.dart';

class DeviceAnimation {
  late AnimationController showController;
  late Animation<Offset> moveShow;
  late Animation<double> opacityShow;
  bool _isSubTitle = false;

  DeviceAnimation({required TickerProvider vsync})
      : showController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 620),
        ) {
    moveShow = Tween<Offset>(
      begin: const Offset(0.1, 0),
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

  void dispose() {
    showController.dispose();
  }

  bool get isSubTitle => _isSubTitle;
}
