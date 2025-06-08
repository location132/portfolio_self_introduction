import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/all_projects_container.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/flutter_projects_container.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/flutter_rive_projects_container.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/future_projects_container.dart';

class ProjectListContainer extends StatelessWidget {
  final String category;
  final bool isVisible;

  const ProjectListContainer({
    super.key,
    required this.category,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 132),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getCategoryTitle(),
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _getCategoryDescription(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              if (category == 'All')
                AllProjectsContainer(isVisible: isVisible)
              else if (category == 'flutter')
                FlutterProjectsContainer(isVisible: isVisible)
              else if (category == 'flutter_rive')
                FlutterRiveProjectsContainer(isVisible: isVisible)
              else if (category == 'future')
                FutureProjectsContainer(isVisible: isVisible)
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryTitle() {
    if (category == 'All') return ProjectTextConstants.allCategoryTitle;
    if (category == 'flutter') return ProjectTextConstants.flutterDetailTitle;
    if (category == 'flutter_rive') {
      return ProjectTextConstants.flutterRiveDetailTitle;
    }
    if (category == 'future') {
      return ProjectTextConstants.futureProjectDetailTitle;
    }
    return '프로젝트';
  }

  String _getCategoryDescription() {
    if (category == 'All') return ProjectTextConstants.allCategoryDescription;
    if (category == 'flutter') {
      return ProjectTextConstants.flutterCategoryDescription;
    }
    if (category == 'flutter_rive') {
      return ProjectTextConstants.flutterRiveCategoryDescription;
    }
    if (category == 'future') {
      return ProjectTextConstants.futureCategoryDescription;
    }
    return '프로젝트들을 소개합니다.';
  }
}
