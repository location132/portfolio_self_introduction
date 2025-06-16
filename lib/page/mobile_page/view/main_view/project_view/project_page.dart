import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model_mobile.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_category_section.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_detail_content.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/animation/project_detail_animation.dart';

class ProjectPageWithMobile extends StatefulWidget {
  final ProjectModelWithMobile state;
  final Function(String) showProjectDetail;
  const ProjectPageWithMobile({
    super.key,
    required this.state,
    required this.showProjectDetail,
  });

  @override
  State<ProjectPageWithMobile> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPageWithMobile>
    with TickerProviderStateMixin {
  late ProjectDetailAnimation _detailAnimation;

  @override
  void initState() {
    super.initState();
    _detailAnimation = ProjectDetailAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(ProjectPageWithMobile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state.isProjectDetailAni != widget.state.isProjectDetailAni) {
      if (widget.state.isProjectDetailAni) {
        _detailAnimation.show();
      } else {
        _detailAnimation.hide();
      }
    }
  }

  @override
  void dispose() {
    _detailAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 프로젝트 목록
        AnimatedOpacity(
          opacity: widget.state.isProjectDetailVisible ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),

                AnimatedOpacity(
                  opacity: widget.state.isProjectItemsAniStart ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      ProjectCategorySection(
                        title: ProjectTextConstants.flutterTitle,
                        description: ProjectTextConstants.flutterDescription,
                        projectCount: ProjectTextConstants.flutterProjectCount,
                        onButtonPressed: () {
                          widget.showProjectDetail('flutter');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 0,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 30.h),

                      ProjectCategorySection(
                        title: ProjectTextConstants.flutterRiveTitle,
                        description:
                            ProjectTextConstants.flutterRiveDescription,
                        projectCount:
                            ProjectTextConstants.flutterRiveProjectCount,
                        onButtonPressed: () {
                          widget.showProjectDetail('flutter_rive');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 200,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 30.h),

                      ProjectCategorySection(
                        title: ProjectTextConstants.futureProjectTitle,
                        description:
                            ProjectTextConstants.futureProjectDescription,
                        projectCount: ProjectTextConstants.futureProjectCount,
                        onButtonPressed: () {
                          widget.showProjectDetail('future');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 400,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Flutter 프로젝트 상세
        Visibility(
          visible:
              widget.state.isProjectDetailVisible &&
              widget.state.selectedProjectCategory == 'flutter',
          child: SlideTransition(
            position: _detailAnimation.slideAnimation,
            child: FadeTransition(
              opacity: _detailAnimation.opacityAnimation,
              child: _buildProjectDetailContainer(
                ProjectDetailContent(
                  category: 'flutter',
                  isAnimationStart: widget.state.isProjectDetailAni,
                ),
              ),
            ),
          ),
        ),

        // Flutter Rive 프로젝트 상세
        Visibility(
          visible:
              widget.state.isProjectDetailVisible &&
              widget.state.selectedProjectCategory == 'flutter_rive',
          child: SlideTransition(
            position: _detailAnimation.slideAnimation,
            child: FadeTransition(
              opacity: _detailAnimation.opacityAnimation,
              child: _buildProjectDetailContainer(
                ProjectDetailContent(
                  category: 'flutter_rive',
                  isAnimationStart: widget.state.isProjectDetailAni,
                ),
              ),
            ),
          ),
        ),

        // 미래 프로젝트 상세
        Visibility(
          visible:
              widget.state.isProjectDetailVisible &&
              widget.state.selectedProjectCategory == 'future',
          child: SlideTransition(
            position: _detailAnimation.slideAnimation,
            child: FadeTransition(
              opacity: _detailAnimation.opacityAnimation,
              child: _buildProjectDetailContainer(
                ProjectDetailContent(
                  category: 'future',
                  isAnimationStart: widget.state.isProjectDetailAni,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectDetailContainer(Widget child) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
            child: child,
          ),
        ],
      ),
    );
  }
}
