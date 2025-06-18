import 'package:flutter/material.dart';

class DesktopCategoryText extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const DesktopCategoryText({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<DesktopCategoryText> createState() => _DesktopCategoryTextState();
}

class _DesktopCategoryTextState extends State<DesktopCategoryText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: widget.isSelected ? 14 : 12,
              fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
              color:
                  widget.isSelected
                      ? Colors.white
                      : _isHovered
                      ? Colors.white.withValues(alpha: 0.9)
                      : Colors.grey.shade400,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
