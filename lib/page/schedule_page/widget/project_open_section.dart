import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/project_schedule_item.dart';

class ProjectOpenSection extends StatelessWidget {
  const ProjectOpenSection({super.key});

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '프로젝트 오픈 일정',
          style: TextStyle(
            color: Colors.white,
            fontSize: _isMobile(context) ? 24 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        const ProjectScheduleItem(
          date: '7월 16일',
          title: 'NaverMap 프로젝트',
          description: '네이버 지도 API를 활용한 위치 기반 서비스',
        ),
        const ProjectScheduleItem(
          date: '8월 20일',
          title: '클랭(KLANG) 프로젝트',
          description: '언어 학습 플랫폼 앱',
        ),
        const ProjectScheduleItem(
          date: '9월 14일',
          title: '구름 x 카카오 x 인프런',
          description: '협업 프로젝트 결과물',
        ),
        const ProjectScheduleItem(
          date: '10월 1일',
          title: 'Flutter Web',
          description: '웹 기반 Flutter 애플리케이션',
        ),
        const ProjectScheduleItem(
          date: '10월 7일',
          title: 'Rive Animation 프로젝트',
          description: '인터랙티브 애니메이션 프로젝트',
          isLast: true,
        ),
      ],
    );
  }
}
