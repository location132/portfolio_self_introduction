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

  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    const baseScreenWidth = 393.0;

    const wideScreenThreshold = 500.0;

    const minFontSize = 10.0;
    const maxFontSize = 28.0;

    double responsiveFontSize;

    if (screenWidth <= wideScreenThreshold) {
      responsiveFontSize = baseFontSize * (screenWidth / baseScreenWidth);
    } else {
      const normalRatio = wideScreenThreshold / baseScreenWidth;
      final excessWidth = screenWidth - wideScreenThreshold;
      final dampedRatio = normalRatio + (excessWidth / baseScreenWidth) * 0.3;
      responsiveFontSize = baseFontSize * dampedRatio;
    }

    return responsiveFontSize.clamp(minFontSize, maxFontSize);
  }
}

extension SizeExtension on num {
  double get sw => this * ResponsiveSize.sw;
  double get sh => this * ResponsiveSize.sh;

  double responsiveFont(BuildContext context) =>
      ResponsiveSize.getResponsiveFontSize(context, toDouble());
}
