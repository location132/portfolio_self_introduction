import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class ProjectTextSection extends StatelessWidget {
  final String title;
  final List<String> techStack;
  final String bottomDescription;
  final bool isCardStarted;
  final double width;
  final bool isCenter;
  final Function(String)? onTechStackTap;

  const ProjectTextSection({
    super.key,
    required this.title,
    required this.techStack,
    required this.bottomDescription,
    required this.isCardStarted,
    required this.width,
    this.isCenter = false,
    this.onTechStackTap,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      isStart: isCardStarted,
      beginDy: 0.1,
      duration: 1000,
      child: SizedBox(
        width: isCenter ? width * 0.6 : width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
            ),
            SizedBox(height: 40),
            ...techStack.map(
              (tech) => Padding(
                padding: EdgeInsets.only(bottom: 12),
                child:
                    onTechStackTap != null
                        ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => onTechStackTap!(tech),
                            child: Text(
                              '• $tech',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.3,
                              ),
                            ),
                          ),
                        )
                        : Text(
                          '• $tech',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.3,
                          ),
                        ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              bottomDescription,
              style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
