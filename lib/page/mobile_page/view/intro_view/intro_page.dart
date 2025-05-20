import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/wave_animation.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/widget/intro_text.dart';

class IntroPage extends StatelessWidget {
  final String deviceType;
  const IntroPage({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Waves(deviceType: deviceType),
        const Positioned.fill(
          child: IntroText(),
        ),
        const Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Portfolio',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '2025년 과감한 성장을 위한 단 하나의 선택',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
