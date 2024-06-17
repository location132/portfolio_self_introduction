import 'package:flutter/material.dart';

class ScreenChange with ChangeNotifier {
  bool _isMainScreen = false; // 화면이동
  bool _isStartSimulator = false; // 시뮬레이터 실행
  bool _isSuccessSimulator = false; // 시뮬레이터 실행

  bool get isMainScreen => _isMainScreen;
  bool get isStartSimulator => _isStartSimulator;
  bool get isSuccessSimulator => _isSuccessSimulator;

  void setChangeScreen(bool isFirstScreen) {
    _isMainScreen = isFirstScreen;
    print('1 $_isMainScreen');

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
