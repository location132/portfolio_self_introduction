import 'package:flutter/material.dart';
import '../project_thumbnail.dart';

class GeneralProjectDesktopItem extends StatefulWidget {
  final String date;
  final String title;
  final String description;
  final bool isLast;
  final bool isGreen;

  const GeneralProjectDesktopItem({
    super.key,
    required this.date,
    required this.title,
    required this.description,
    this.isLast = false,
    this.isGreen = false,
  });

  @override
  State<GeneralProjectDesktopItem> createState() =>
      _GeneralProjectDesktopItemState();
}

class _GeneralProjectDesktopItemState extends State<GeneralProjectDesktopItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.isGreen ? Colors.green.shade600 : Colors.grey.shade600;

    return Column(
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.date.isNotEmpty) ...[
                Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.date,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
              ProjectThumbnail(title: widget.title, isHovered: _isHovered),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!widget.isLast) const SizedBox(height: 24),
      ],
    );
  }
}
