import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';

class AboutMeDescription extends StatelessWidget {
  final bool isBannerAniStart;
  final bool isBackGroundAniStart;

  const AboutMeDescription({
    super.key,

    required this.isBannerAniStart,
    required this.isBackGroundAniStart,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: isBannerAniStart,
      isReverse: isBackGroundAniStart,
      beginDy: 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
                children: [
                  TextSpan(
                    text:
                        ' 이제는 곧잘 잘하는 Flutter 프레임워크에서 협업 툴까지,\n업무에 필요한 부분에대해 뭐든지 십분 해낼 수 있도록\n',
                  ),
                  TextSpan(
                    text: '최적화된 앱과 퍼포먼스 웹',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        '.\n\n 여기에 다양한 개인퍼포먼스 프레임워크가 더해지는 순간\n프로젝트들은 그야말로 훨훨 날아오르죠.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
