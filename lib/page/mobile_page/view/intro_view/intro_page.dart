import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/wave_animation.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/widget/intro_text.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/widget/intro_title.dart';

class IntroPage extends StatelessWidget {
  final String deviceType;
  final IntroModel introModel;
  const IntroPage(
      {super.key, required this.deviceType, required this.introModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: introModel.isWaveAnimation ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 2000),
          child: !introModel.isWaveAnimationVisible
              ? Waves(deviceType: deviceType)
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
        ),
        Positioned.fill(
          child: IntroTitle(isTitelText: introModel.isTitelText),
        ),
        Positioned.fill(
          child: IntroText(
            isFirstIntroText: introModel.isFirstIntroText,
            isSubTitle: introModel.isSubTitle,
          ),
        ),
      ],
    );
  }
}
