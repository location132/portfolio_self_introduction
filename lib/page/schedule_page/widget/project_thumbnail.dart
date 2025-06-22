import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectThumbnail extends StatefulWidget {
  final String title;

  const ProjectThumbnail({super.key, required this.title});

  @override
  State<ProjectThumbnail> createState() => _ProjectThumbnailState();
}

class _ProjectThumbnailState extends State<ProjectThumbnail> {
  bool _isHovered = false;
  int _gifInstanceKey = 0;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (isHovered && widget.title == 'NaverMap') {
        _gifInstanceKey++;
      }
    });
  }

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
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(false),
                  key: ValueKey('${widget.title}_default'),
                  fit: BoxFit.contain,
                ),
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(true),
                  key: ValueKey('${widget.title}_hover_$_gifInstanceKey'),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectThumbnailMobile extends StatefulWidget {
  final String title;

  const ProjectThumbnailMobile({super.key, required this.title});

  @override
  State<ProjectThumbnailMobile> createState() => _ProjectThumbnailMobileState();
}

class _ProjectThumbnailMobileState extends State<ProjectThumbnailMobile> {
  bool _isHovered = false;
  int _gifInstanceKey = 0;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (isHovered && widget.title == 'NaverMap') {
        _gifInstanceKey++;
      }
    });
  }

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
    return GestureDetector(
      onTapDown: (_) => _onHover(true),
      onTapUp: (_) => _onHover(false),
      onTapCancel: () => _onHover(false),
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: _isHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(false),
                  key: ValueKey('${widget.title}_default'),
                  fit: BoxFit.contain,
                ),
              ),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(true),
                  key: ValueKey('${widget.title}_hover_$_gifInstanceKey'),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
