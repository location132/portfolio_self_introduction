import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_content/widget/project_image_card.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/widget/project_content/tech_stack_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class ProjectContent2 extends StatefulWidget {
  final bool isProjectCard3Visible;
  final IfsaiCubit cubit;

  const ProjectContent2({
    super.key,
    required this.isProjectCard3Visible,
    required this.cubit,
  });

  @override
  State<ProjectContent2> createState() => _ProjectContent2State();
}

class _ProjectContent2State extends State<ProjectContent2> {
  @override
  Widget build(BuildContext context) {
    const techStackData = TitleTextConstants.projectTechStackData;

    return VisibilityDetector(
      key: Key('project-content2-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.8 && !widget.isProjectCard3Visible) {
          widget.cubit.onProjectCard3VisibilityChanged();
        }
      },
      child: Column(
        children: [
          ProjectImageCard(
            imagePath: techStackData['imagePath'],
            imageDescription: techStackData['imageDescription'],
            title: techStackData['title'],
          ),

          const SizedBox(height: 80),

          TechStackManager(
            techStacks: List<Map<String, dynamic>>.from(
              techStackData['techStacks'],
            ),
            isCardStarted: widget.isProjectCard3Visible,
          ),
        ],
      ),
    );
  }
}
