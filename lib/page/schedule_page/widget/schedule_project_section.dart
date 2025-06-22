import 'package:flutter/material.dart';
import 'desktop_project_section.dart';
import 'mobile_project_section.dart';

class ScheduleProjectSection extends StatelessWidget {
  final bool isMobile;

  const ScheduleProjectSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? const MobileProjectSection()
        : const DesktopProjectSection();
  }
}
