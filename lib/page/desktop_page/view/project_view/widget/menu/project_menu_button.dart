import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class ProjectMenuButton extends StatelessWidget {
  final String title;
  final String description;
  final String projectCount;
  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  const ProjectMenuButton({
    super.key,
    required this.title,
    required this.description,
    required this.projectCount,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color:
                  isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            _getShortTitle(),
            style: TextStyle(
              fontSize: 16,
              color:
                  isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  String _getShortTitle() {
    if (category == 'All') {
      return ProjectTextConstants.allCategoryTitle;
    }
    if (category == 'flutter') {
      return ProjectTextConstants.flutterTitle;
    }
    if (category == 'flutter_rive') {
      return ProjectTextConstants.flutterRiveTitle;
    }
    if (category == 'future') {
      return ProjectTextConstants.futureProjectTitle;
    }
    return title;
  }
}
