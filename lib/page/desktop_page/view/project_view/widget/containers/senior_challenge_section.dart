import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';

class SeniorChallengeSection extends StatelessWidget {
  final bool isVisible;

  const SeniorChallengeSection({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryHeader(
          title: "Senior Developer Challenge",
          count: ProjectTextConstants.flutterContainerCount3,
        ),
        Container(
          height: 620,
          margin: const EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              final seniorChallengeProjects = [
                {
                  'title': '선배 개발자 따라잡기 1',
                  'description': '실제 출시된 앱을 분석하고 개선 아이디어를 반영한 프로젝트입니다.',
                  'tech': 'App Analysis, UI/UX Improvement',
                },
                {
                  'title': '선배 개발자 따라잡기 2',
                  'description': '현업 개발자의 코드를 분석하고 더 나은 아키텍처를 적용한 프로젝트입니다.',
                  'tech': 'Code Analysis, Architecture Improvement',
                },
              ];
              return ProjectCard(
                project: seniorChallengeProjects[index],
                isVisible: isVisible,
                index: index,
                icon: Icons.trending_up,
              );
            },
          ),
        ),
      ],
    );
  }
}
