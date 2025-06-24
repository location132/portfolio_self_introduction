import 'package:flutter/material.dart';
import 'dart:html' as html;

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

class BrowserDetector {
  static bool get isSafari {
    final userAgent = html.window.navigator.userAgent;
    return userAgent.contains('Safari') && !userAgent.contains('Chrome');
  }

  static bool get isChrome {
    final userAgent = html.window.navigator.userAgent;
    return userAgent.contains('Chrome');
  }

  static bool get isFirefox {
    final userAgent = html.window.navigator.userAgent;
    return userAgent.contains('Firefox');
  }
}
