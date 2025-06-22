import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectThumbnailMobile extends StatefulWidget {
  final String title;

  const ProjectThumbnailMobile({super.key, required this.title});

  @override
  State<ProjectThumbnailMobile> createState() => _ProjectThumbnailMobileState();
}

class _ProjectThumbnailMobileState extends State<ProjectThumbnailMobile> {
  String _getImagePath(bool isHovered) {
    switch (widget.title) {
      case 'NaverMap':
        return isHovered
            ? 'assets/Images/project_img/naver_map_2.gif'
            : 'assets/Images/project_img/naver_map_1.png';
      case 'KLANG':
        return isHovered
            ? 'assets/Images/project_img/Klang_2.png'
            : 'assets/Images/project_img/Klang_1.png';
      case '구름 × 카카오 × 인프런':
        return isHovered
            ? 'assets/Images/project_img/groom_2.png'
            : 'assets/Images/project_img/groom_1.png';
      case 'Flutter Web':
        return isHovered
            ? 'assets/Images/project_img/web_project_2.png'
            : 'assets/Images/project_img/web_project_1.png';
      case 'Rive Animation':
        return 'assets/Images/project_img/rive_flutter.png';
      default:
        return 'assets/Images/project_img/rive_flutter.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width;
    double height;

    if (widget.title == 'Flutter Web') {
      width = 200.w;
      height = 120.h;
    } else {
      width = 140.w;
      height = 100.h;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(_getImagePath(false), fit: BoxFit.cover),
      ),
    );
  }
}
