import 'package:flutter/material.dart';

class ProjectThumbnail extends StatefulWidget {
  final String title;
  final bool? isHovered;

  const ProjectThumbnail({super.key, required this.title, this.isHovered});

  @override
  State<ProjectThumbnail> createState() => _ProjectThumbnailState();
}

class _ProjectThumbnailState extends State<ProjectThumbnail> {
  bool _internalHovered = false;
  int _gifInstanceKey = 0;

  void _onHover(bool isHovered) {
    setState(() {
      _internalHovered = isHovered;
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
      case '잎사이':
        return isHovered
            ? 'assets/Images/project_img/ifsai_2.png'
            : 'assets/Images/project_img/ifsai_1.png';
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
    double? height;

    if (widget.title == 'Flutter Web') {
      width = 200.0;
      height = 120.0;
    } else if (widget.title == 'Rive Animation') {
      width = 140.0;
      height = null;
    } else {
      width = 120.0;
      height = null;
    }

    final effectiveHovered = widget.isHovered ?? _internalHovered;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        width: width,
        height: height,
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
                opacity: effectiveHovered ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(false),
                  key: ValueKey('${widget.title}_default'),
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedOpacity(
                opacity: effectiveHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  _getImagePath(true),
                  key: ValueKey('${widget.title}_hover_$_gifInstanceKey'),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
