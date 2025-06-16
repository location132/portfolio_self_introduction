import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/menu/project_menu_button.dart';

class ProjectMenuBar extends StatelessWidget {
  final ProjectModel state;
  final Function(String category) onCategorySelected;

  const ProjectMenuBar({
    super.key,
    required this.state,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 140.sw),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProjectMenuButton(
                title: '모든 프로젝트',
                description: '모든 프로젝트',
                projectCount: '0',
                category: 'All',
                isSelected: state.selectedProjectCategory == 'All',
                onPressed: () => onCategorySelected('All'),
              ),
              const SizedBox(width: 22),

              ProjectMenuButton(
                title: ProjectTextConstants.flutterTitle,
                description: ProjectTextConstants.flutterDescription,
                projectCount: ProjectTextConstants.flutterProjectCount,
                category: 'flutter',
                isSelected: state.selectedProjectCategory == 'flutter',
                onPressed: () => onCategorySelected('flutter'),
              ),
              const SizedBox(width: 22),

              ProjectMenuButton(
                title: ProjectTextConstants.flutterRiveTitle,
                description: ProjectTextConstants.flutterRiveDescription,
                projectCount: ProjectTextConstants.flutterRiveProjectCount,
                category: 'flutter_rive',
                isSelected: state.selectedProjectCategory == 'flutter_rive',
                onPressed: () => onCategorySelected('flutter_rive'),
              ),
              const SizedBox(width: 22),

              ProjectMenuButton(
                title: ProjectTextConstants.futureProjectTitle,
                description: ProjectTextConstants.futureProjectDescription,
                projectCount: ProjectTextConstants.futureProjectCount,
                category: 'future',
                isSelected: state.selectedProjectCategory == 'future',
                onPressed: () => onCategorySelected('future'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
