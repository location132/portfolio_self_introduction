import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class AboutMeDescription extends StatelessWidget {
  final bool isAniStart;

  const AboutMeDescription({super.key, required this.isAniStart});

  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: isAniStart,
      duration: 420,
      beginDy: 0.2,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            const SizedBox(height: 22),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0.sp,
                  color: Colors.grey,
                  height: 1.5,
                ),
                children: [
                  const TextSpan(
                    text:
                        ' 이제는 곧잘 잘하는 Flutter 프레임워크에서 협업 툴까지,\n업무에 필요한 부분에대해 뭐든지 십분 해낼 수 있도록\n',
                  ),
                  TextSpan(
                    text: '최적화된 앱과 퍼포먼스 웹.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                    ),
                  ),
                  const TextSpan(
                    text:
                        '\n\n여기에 다양한 개인퍼포먼스 프레임워크가 더해지는 순간\n프로젝트들은 그야말로 훨훨 날아오르죠.',
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
