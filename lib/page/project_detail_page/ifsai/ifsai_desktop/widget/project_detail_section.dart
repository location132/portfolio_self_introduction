import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/title/sub_title.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/widget/title/project_detail_title_animated.dart';

class ProjectDetailSection extends StatelessWidget {
  final IfsaiModel model;
  final double mainTitleOpacity;
  final double descriptionOpacity;
  final double titleOpacity;
  final double titleScale;
  final double titleOffset;
  final double scrollDescriptionOpacity;
  final double mainTitleTranslateY;
  final double descriptionTranslateY;
  final Color textColor;
  final Function(bool) setScrollEnabled;

  const ProjectDetailSection({
    super.key,
    required this.model,
    required this.mainTitleOpacity,
    required this.descriptionOpacity,
    required this.titleOpacity,
    required this.titleScale,
    required this.titleOffset,
    required this.scrollDescriptionOpacity,
    required this.mainTitleTranslateY,
    required this.descriptionTranslateY,
    required this.textColor,
    required this.setScrollEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: titleOffset,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 16),
            opacity: titleOpacity,
            child: Transform.scale(
              scale: titleScale,
              child: ProjectDetailTitle(
                model: model,
                scrollDescriptionOpacity: scrollDescriptionOpacity,
                onScrollChange: (isEnabled) => setScrollEnabled(isEnabled),
              ),
            ),
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.4 + titleOffset,
          left: 0,
          right: 0,
          child: SubTitle(
            mainTitleTranslateY: mainTitleTranslateY,
            mainTitleOpacity: mainTitleOpacity,
            textColor: textColor,
            descriptionTranslateY: descriptionTranslateY,
            descriptionOpacity: descriptionOpacity,
          ),
        ),
      ],
    );
  }
}
