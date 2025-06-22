import 'package:flutter/material.dart';
import 'desktop_header_section.dart';
import 'mobile_header_section.dart';

class ScheduleHeaderSection extends StatelessWidget {
  final bool isMobile;

  const ScheduleHeaderSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? const MobileHeaderSection()
        : const DesktopHeaderSection();
  }
}
