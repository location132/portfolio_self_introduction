import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/flutter_apps_section.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/web_projects_section.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/senior_challenge_section.dart';

class FlutterProjectsContainer extends StatelessWidget {
  final bool isVisible;

  const FlutterProjectsContainer({super.key, required this.isVisible});

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 1,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterAppsSection(isVisible: isVisible),
        _buildDivider(),
        WebProjectsSection(isVisible: isVisible),
        _buildDivider(),
        SeniorChallengeSection(isVisible: isVisible),
        _buildDivider(),
      ],
    );
  }
}
