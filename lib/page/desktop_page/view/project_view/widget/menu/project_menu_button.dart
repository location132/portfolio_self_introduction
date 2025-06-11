import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/animation/project_menu_button_animation.dart';

class ProjectMenuButton extends StatefulWidget {
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
  State<ProjectMenuButton> createState() => _ProjectMenuButtonState();
}

class _ProjectMenuButtonState extends State<ProjectMenuButton>
    with SingleTickerProviderStateMixin {
  late ProjectMenuButtonAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animation = ProjectMenuButtonAnimation(vsync: this);
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animation.onTapDown(),
      onTapUp: (_) => _animation.onTapUp(widget.onPressed),
      onTapCancel: _animation.onTapCancel,
      child: ScaleTransition(
        scale: _animation.scaleAnimation,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color:
                widget.isSelected
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color:
                  widget.isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.3),
              width: widget.isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Text(
            widget.category == 'All'
                ? ProjectTextConstants.allCategoryTitle
                : widget.category == 'flutter'
                ? ProjectTextConstants.flutterTitle
                : widget.category == 'flutter_rive'
                ? ProjectTextConstants.flutterRiveTitle
                : widget.category == 'future'
                ? ProjectTextConstants.futureProjectTitle
                : widget.title,
            style: TextStyle(
              fontSize: 16.0,
              color:
                  widget.isSelected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.6),
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
