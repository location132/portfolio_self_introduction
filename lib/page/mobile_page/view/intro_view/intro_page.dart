import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/intro_view/widget/intro_text.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/two_line_title.dart';

class IntroPage extends StatelessWidget {
  final IntroModel introModel;
  const IntroPage({super.key, required this.introModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/intro_Image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        IntroText(isFirstIntroText: introModel.isFirstIntroText),
        AnimatedOpacity(
          opacity: introModel.isIntroImage ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Images/intro_Image2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: TwoLineTitle(
            isTitelText: introModel.isTitelText,
            title: 'Flutter Portfolio',
            subTitle: '2025년 나를 보여주기 위한 하나의 선택',
          ),
        ),
      ],
    );
  }
}
