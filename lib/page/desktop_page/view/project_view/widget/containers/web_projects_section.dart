import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/category_header.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/project_card.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/components/web_project_card.dart';

class WebProjectsSection extends StatelessWidget {
  final bool isVisible;

  const WebProjectsSection({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CategoryHeader(
          title: "Flutter Web Projects",
          count: ProjectTextConstants.flutterContainerCount2,
        ),
        Container(
          height: 620,
          margin: const EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: WebProjectCard(isVisible: isVisible),
                );
              } else {
                return ProjectCard(
                  project: const {
                    'title': '모바일 웹 프로젝트',
                    'description': '모바일에서는 더욱 FLutter 개발자 답게',
                    'tech': '#Flutter Web, #Cubit, #MVVM Pattern',
                  },
                  isVisible: isVisible,
                  index: 1,
                  icon: Icons.web,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
