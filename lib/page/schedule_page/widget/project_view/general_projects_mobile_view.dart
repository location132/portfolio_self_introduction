import 'package:flutter/material.dart';
import 'general_project_mobile_item.dart';

class GeneralProjectsMobileView extends StatelessWidget {
  const GeneralProjectsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GeneralProjectMobileItem(
          date: '7월 16일',
          title: 'NaverMap',
          description: '서비스 패턴과 클러스터링, 오버레이와 최적화까지. 곧 찾아뵙겠습니다',
          isGreen: true,
        ),
        GeneralProjectMobileItem(
          date: '8월 20일',
          title: 'KLANG',
          description:
              '16명의 다른 전공을 가진 팀원들과 하나의 팀으로.\n커뮤니케이션의 능력과 협업 능력을 올려준 프로젝트 8월 20일에 오픈됩니다.',
        ),
        GeneralProjectMobileItem(
          date: '9월 14일',
          title: '구름 × 카카오 × 인프런',
          description:
              '웹과 앱 그리고 서버개발자가 하나의 팀으로.\n부트캠프에서 우수상까지 올라간 나의 Flutter 첫 프로젝트. 9월 14일에 오픈됩니다.',
        ),
      ],
    );
  }
}
