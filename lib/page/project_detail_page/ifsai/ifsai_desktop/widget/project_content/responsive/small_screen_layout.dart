import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/project_content/widget/project_row_card.dart';

class SmallScreenLayout {
  static Widget build(
    List<Map<String, dynamic>> techStacks,
    Animation<double> fadeAnimation,
    Animation<Offset> slideAnimation,
    bool showAll,
    VoidCallback onToggle,
  ) {
    final visibleStacks = showAll ? techStacks : techStacks.take(2).toList();

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                Column(
                  children:
                      visibleStacks
                          .map(
                            (techStack) => Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: ProjectRowCard(
                                title: techStack['title'],
                                items: List<String>.from(techStack['items']),
                              ),
                            ),
                          )
                          .toList(),
                ),
                if (techStacks.length > 2) ...[
                  const SizedBox(height: 20),
                  _buildToggleButton(showAll, onToggle),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildToggleButton(bool showAll, VoidCallback onToggle) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  showAll ? '접기' : '더보기',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  showAll ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
