import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

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
  bool _isHovered = false;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _onHoverStart() {
    setState(() {
      _isHovered = true;
    });
  }

  void _onHoverEnd() {
    setState(() {
      _isHovered = false;
    });
  }

  void _onTapDown() {
    setState(() {});
    _scaleController.forward();
  }

  void _onTapUp() {
    setState(() {});
    _scaleController.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() {});
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHoverStart(),
      onExit: (_) => _onHoverEnd(),
      child: GestureDetector(
        onTapDown: (_) => _onTapDown(),
        onTapUp: (_) => _onTapUp(),
        onTapCancel: _onTapCancel,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: _getBorderColor(),
                width: _getBorderWidth(),
              ),
              boxShadow: _getBoxShadow(),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: _getFontSize(),
                color: _getTextColor(),
                fontWeight: FontWeight.w600,
              ),
              child: Text(_getShortTitle()),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.isSelected) {
      return _isHovered
          ? Colors.white.withValues(alpha: 0.15)
          : Colors.white.withValues(alpha: 0.1);
    }
    if (_isHovered) {
      return Colors.white.withValues(alpha: 0.08);
    }
    return Colors.transparent;
  }

  Color _getBorderColor() {
    if (widget.isSelected) {
      return _isHovered ? Colors.white.withValues(alpha: 0.9) : Colors.white;
    }
    if (_isHovered) {
      return Colors.white.withValues(alpha: 0.6);
    }
    return Colors.white.withValues(alpha: 0.3);
  }

  double _getBorderWidth() {
    if (widget.isSelected || _isHovered) {
      return 1.5;
    }
    return 1.0;
  }

  Color _getTextColor() {
    if (widget.isSelected) {
      return Colors.white;
    }
    if (_isHovered) {
      return Colors.white.withValues(alpha: 0.9);
    }
    return Colors.white.withValues(alpha: 0.6);
  }

  double _getFontSize() {
    if (_isHovered && !widget.isSelected) {
      return 16.5;
    }
    return 16.0;
  }

  List<BoxShadow> _getBoxShadow() {
    if (_isHovered) {
      return [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
    }
    return [];
  }

  String _getShortTitle() {
    if (widget.category == 'All') {
      return ProjectTextConstants.allCategoryTitle;
    }
    if (widget.category == 'flutter') {
      return ProjectTextConstants.flutterTitle;
    }
    if (widget.category == 'flutter_rive') {
      return ProjectTextConstants.flutterRiveTitle;
    }
    if (widget.category == 'future') {
      return ProjectTextConstants.futureProjectTitle;
    }
    return widget.title;
  }
}
