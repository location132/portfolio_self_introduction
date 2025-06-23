import 'package:flutter/material.dart';

class GsShopHeaderSection extends StatelessWidget {
  const GsShopHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '이 프로젝트를 시작한 이유',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'GS SHOP 애플리케이션은 제가 공부하고 있는 Flutter로 제작된 서비스입니다.\n\n'
            '저는 이 애플리케이션 똑같이 따라 만들기는 너무 어렵지만\n'
            '불편한점을 벤치마킹해, 개선해보는 작업을 통해\n'
            '저보다 사회에 먼저 나가 있는 개발자 선배들을 따라가고싶다는 마음으로 시작했습니다.\n\n'
            '몇 가지를 살펴보던 중 검색창에서 사용자 경험을 저해하는 문제를 발견했습니다.\n'
            '해당 문제를 정확히 이해하기 위해 Flutter로 똑같이 검색창을 구현하고,\n왜 이런 문제가 발생하는지 직접 확인하고'
            '직접 문제를 개선해본 경험을\n프로젝트로 정리해 작성해보려고 합니다.\n\n'
            '목표: 현업 개발 선배님들의 실력을 따라잡기',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
