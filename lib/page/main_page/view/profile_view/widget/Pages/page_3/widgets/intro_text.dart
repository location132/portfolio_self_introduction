import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '처음 개발을 배우던 그 날,',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        Text(
          ' print문조차 어려웠던 저를 떠올립니다.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),
        const Text(
          '단순한 명령어 하나에도 혼란스러워하던 제가',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        Text(
          ' 어느새 엉망이고 뒤죽박죽이었던 첫 프로젝트에 도전하고 있었습니다.\n'
          ' 그런데 이상하게도, 왜 그 시절이 가장 반짝였던 걸까요?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),
        const Text(
          '한 줄의 코드를 완성하기 위해',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        Text(
          ' 몇 시간을 동기들과 함께 고민하던 날들이 있었습니다.\n'
          ' 지금은 효율과 속도를 더 중요하게 여기지만,\n'
          ' 그때의 어설픈 진심이, 지금도 제 목표를 지탱해주는 저만의 작은 이야기입니다.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
