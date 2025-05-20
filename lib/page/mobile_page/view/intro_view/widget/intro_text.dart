import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Text(
            '\nMVVM패턴, 클린아키텍쳐, get it을 사용한 DI\n'
            'Cubit 패턴, Rive애니메이션, 생명주기까지',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          Text(
            '\n많은 것을 공부하고 경험한 신입 개발자\n\n'
            'Flutter 이정원입니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
