import 'package:flutter/material.dart';

class IntroTextWithChapter1 extends StatefulWidget {
  const IntroTextWithChapter1({super.key});

  @override
  State<IntroTextWithChapter1> createState() => _IntroTextWithChapter1State();
}

class _IntroTextWithChapter1State extends State<IntroTextWithChapter1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '처음 강연을 들었던 그 날,',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          ' 낯설기만 했던 세미나 주제. 하지만 주변의 개발자들은\n'
          ' 모두 이해했다는 듯한 표정으로 고개를 끄덕이고 있었고,\n'
          ' 이 첫날의 기억은 지금도 생생하게 남아 있습니다.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),
        const Text(
          '저보다 먼저 개발자의 길을 걷는 선배들이',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          ' 전해주는 강연은 어려운 말들이 가득했고\n 이해하지 못한 채 노트에 필기만 하던 저는\n 제가 처음 품었던 목표를 잊고 따라가기 급급하게 만들었던 것 같습니다.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 36),
        const Text(
          '후배 개발자들에게 해준 하나의 말',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          ' • 모르는 건 당연해요. 중요한 건, 계속 배우고 있다는 거예요.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.87),
            height: 1.6,
          ),
        ),
        Text(
          ' 이 한마디의 말은 선배 개발자들이 만들어놓은 길을 편안하게 따라가는 개발자가 아닌,\n'
          ' 나의 목표 그리고 나 고집으로 성장하는 개발자가 되고 싶다는 마음을 가질 수 있게 해주었습니다.',
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
