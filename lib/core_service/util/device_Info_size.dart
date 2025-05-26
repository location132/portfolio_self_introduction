import 'package:flutter/material.dart';

class ResponsiveSize {
  static late MediaQueryData _mediaQueryData;
  static late double sw;
  static late double sh;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    // 디자인 기준 크기 393x852
    sw = _mediaQueryData.size.width / 1920;
    sh = _mediaQueryData.size.height / 1080;
  }
}

extension SizeExtension on num {
  double get sw => this * ResponsiveSize.sw;
  double get sh => this * ResponsiveSize.sh;
}
