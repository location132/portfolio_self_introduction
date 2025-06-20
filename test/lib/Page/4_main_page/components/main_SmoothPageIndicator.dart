import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainSmoothPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const MainSmoothPageIndicator(
      {super.key, required this.controller, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: const ExpandingDotsEffect(
          activeDotColor: Color(0xff6fbf8a), // 선택될 때의 색상
          dotColor: Color(0xffd9d9d9), // 선택되지 않았을 때의 색상
          dotHeight: 7, // 점의 높이
          dotWidth: 7, // 점의 너비
          expansionFactor: 4, // 확장 요소 (확장되는 정도)
        ),
      ),
    );
  }
}
