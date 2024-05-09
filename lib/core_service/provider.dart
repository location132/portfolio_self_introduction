import 'package:flutter/material.dart';

class ScreenChange with ChangeNotifier {
  bool _isFirstScreen = false; // 화면이동
  bool _isStartSimulator = false; // 시뮬레이터 실행
  bool _isSuccessSimulator = false; // 시뮬레이터 실행

  bool get isFirstScreen => _isFirstScreen;
  bool get isStartSimulator => _isStartSimulator;
  bool get isSuccessSimulator => _isSuccessSimulator;

  void setChangeScreen(bool isFirstScreen) {
    _isFirstScreen = isFirstScreen;
    print('1 $_isFirstScreen');

    notifyListeners();
  }

  void setStartScreen(bool isStartSimulator) {
    _isStartSimulator = isStartSimulator;
    print('2 $_isStartSimulator');

    notifyListeners();
  }

  void setSuccessSimulator(bool isSuccessSimulator) {
    _isSuccessSimulator = isSuccessSimulator;
    print('3 $_isStartSimulator');

    notifyListeners();
  }
}
