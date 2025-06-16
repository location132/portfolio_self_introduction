import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_content/widget/project_row_card.dart';

class MediumScreenLayout {
  static Widget build(
    List<Map<String, dynamic>> techStacks,
    Animation<double> fadeAnimation,
    Animation<Offset> slideAnimation,
    bool showAll,
    VoidCallback onToggle,
  ) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    techStacks.take(3).map((techStack) {
                      final index = techStacks.indexOf(techStack);
                      return Row(
                        children: [
                          if (index > 0) const SizedBox(width: 40),
                          SizedBox(
                            width: 220,
                            child: ProjectRowCard(
                              title: techStack['title'],
                              items: List<String>.from(techStack['items']),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    techStacks.skip(3).map((techStack) {
                      final index = techStacks
                          .skip(3)
                          .toList()
                          .indexOf(techStack);
                      return Row(
                        children: [
                          if (index > 0) const SizedBox(width: 60),
                          SizedBox(
                            width: 280,
                            child: ProjectRowCard(
                              title: techStack['title'],
                              items: List<String>.from(techStack['items']),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
