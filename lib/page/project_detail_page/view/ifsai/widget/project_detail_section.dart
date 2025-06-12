import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_detail_title.dart';

class ProjectDetailSection extends StatelessWidget {
  final IfsaiModel model;
  final double mainTitleOpacity;
  final double descriptionOpacity;
  final double titleOpacity;
  final double titleScale;
  final Function(bool) setScrollEnabled;

  const ProjectDetailSection({
    super.key,
    required this.model,
    required this.mainTitleOpacity,
    required this.descriptionOpacity,
    required this.titleOpacity,
    required this.titleScale,
    required this.setScrollEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 16),
            opacity: titleOpacity,
            child: Transform.scale(
              scale: titleScale,
              child: ProjectDetailTitle(
                model: model,
                onScrollChange: (isEnabled) => setScrollEnabled(isEnabled),
              ),
            ),
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          left: 0,
          right: 0,
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: mainTitleOpacity,
                child: const Center(
                  child: Text(
                    '바로 핵심부터',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: descriptionOpacity,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      '잎사이 프로젝트에 적용한 모든 기술입니다. 상세한 내용은 클릭해주세요',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
