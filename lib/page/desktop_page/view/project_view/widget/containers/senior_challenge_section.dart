import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/square_project_card.dart';

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
          height: 320,
          margin: const EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              final seniorChallengeProjects = [
                {
                  'title': '선배 개발자 따라잡기 With GS_SHOP',
                  'description': '검색창의 과도한 번쩍 거림 현상을 개선해본 프로젝트입니다.',
                  'tech': '#데이터 캐싱, #생명주기 개선, #상태관리 개선',
                },
                {
                  'title': '선배 개발자 따라잡기 With IDUS',
                  'description': '쉬머효과와 페이지의 자연스러운 전환',
                  'tech': '#Shimmer, #Skeleton, #Animation Opacity',
                },
              ];
              return SquareProjectCard(
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
