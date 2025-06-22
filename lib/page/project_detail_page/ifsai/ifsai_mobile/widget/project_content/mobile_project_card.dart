import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mobile_project_image_section.dart';
import 'mobile_project_text_section.dart';

class MobileProjectCard extends StatelessWidget {
  final String imagePath;
  final String imageDescription;
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;
  final Function(String)? onTechStackTap;

  const MobileProjectCard({
    super.key,
    required this.imagePath,
    required this.imageDescription,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    required this.isCardStarted,
    this.onTechStackTap,
  });

  @override
  Widget build(BuildContext context) {
    final contentWidth = (ScreenUtil().screenWidth * 0.9).clamp(280.0, 600.0);
    final imageWidth = (ScreenUtil().screenWidth * 0.7).clamp(250.0, 400.0);

    return Center(
      child: SizedBox(
        width: contentWidth,
        child: Column(
          children: [
            SizedBox(
              width: imageWidth,
              child: MobileProjectImageSection(
                imagePath: imagePath,
                imageDescription: imageDescription,
                width: imageWidth,
              ),
            ),
            SizedBox(height: 40.h),
            Center(
              child: MobileProjectTextSection(
                title: title,
                techStack: techStack,
                bottomDescription: bottomDescription,
                isCardStarted: isCardStarted,
                width: contentWidth,
                onTechStackTap: onTechStackTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
