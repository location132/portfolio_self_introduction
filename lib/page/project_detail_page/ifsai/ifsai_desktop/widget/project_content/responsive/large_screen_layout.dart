import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/project_content/widget/project_row_card.dart';

class LargeScreenLayout {
  static Widget build(
    List<Map<String, dynamic>> techStacks,
    Animation<double> fadeAnimation,
    Animation<Offset> slideAnimation,
  ) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              techStacks.asMap().entries.map((entry) {
                final index = entry.key;
                final techStack = entry.value;

                return Row(
                  children: [
                    if (index > 0) const SizedBox(width: 30),
                    ProjectRowCard(
                      title: techStack['title'],
                      items: List<String>.from(techStack['items']),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
