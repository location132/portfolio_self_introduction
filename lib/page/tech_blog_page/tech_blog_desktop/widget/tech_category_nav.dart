import 'package:flutter/material.dart';

class TechCategoryNav extends StatelessWidget {
  const TechCategoryNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TechCategoryText(label: 'All Posts', isSelected: true),
          SizedBox(width: 40),
          TechCategoryText(label: 'Flutter', isSelected: false),
          SizedBox(width: 40),
          TechCategoryText(label: 'Dart', isSelected: false),
        ],
      ),
    );
  }
}

class TechCategoryText extends StatefulWidget {
  final String label;
  final bool isSelected;

  const TechCategoryText({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  State<TechCategoryText> createState() => _TechCategoryTextState();
}

class _TechCategoryTextState extends State<TechCategoryText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: widget.isSelected ? 18 : 16,
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
