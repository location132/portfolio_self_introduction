import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_category_section.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/project_detail_content.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/project_view/animation/project_detail_animation.dart';

class ProjectPage extends StatefulWidget {
  final ProjectModel state;
  final MobileCubit cubit;
  const ProjectPage({super.key, required this.state, required this.cubit});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin {
  late ProjectDetailAnimation _detailAnimation;

  @override
  void initState() {
    super.initState();
    _detailAnimation = ProjectDetailAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(ProjectPage oldWidget) {
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
                        title: 'Flutter',
                        description: 'Flutter를 사용해 만든 모든 프로젝트를 소개합니다.',
                        projectCount: '4개의 프로젝트',
                        onButtonPressed: () {
                          widget.cubit.showProjectDetail('flutter');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 0,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 30.h),

                      ProjectCategorySection(
                        title: '선배 개발자 따라잡기',
                        description:
                            '실제 출시된 앱을 분석하고 개선 아이디어를 반영해보는 실전 리디자인 프로젝트입니다.',
                        projectCount: '2개의 프로젝트',
                        onButtonPressed: () {
                          widget.cubit.showProjectDetail('senior_developer');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 200,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 30.h),

                      ProjectCategorySection(
                        title: 'Flutter in Rive',
                        description:
                            'Rive 애니메이션과 Flutter의 완벽한 조합으로 만든 프로젝트입니다.',
                        projectCount: '3개의 프로젝트',
                        onButtonPressed: () {
                          widget.cubit.showProjectDetail('flutter_rive');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 400,
                        isSelected: false,
                        isDetailMode: false,
                      ),

                      SizedBox(height: 30.h),

                      ProjectCategorySection(
                        title: '앞으로 진행할 프로젝트',
                        description: '새로운 도전을 준비하고 있습니다. 목표와 언제 시작할지 정해두었습니다.',
                        projectCount: '4개의 계획',
                        onButtonPressed: () {
                          widget.cubit.showProjectDetail('future');
                        },
                        isAnimationStart: widget.state.isProjectItemsAniStart,
                        animationDelay: 600,
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

        if (widget.state.isProjectDetailVisible)
          SlideTransition(
            position: _detailAnimation.slideAnimation,
            child: FadeTransition(
              opacity: _detailAnimation.opacityAnimation,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.black),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w,
                          vertical: 40.h,
                        ),
                        child: GestureDetector(
                          onTap: () => widget.cubit.hideProjectDetail(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white.withValues(alpha: 0.8),
                                size: 16.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '프로젝트 목록으로 돌아가기',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: ProjectDetailContent(
                          category: widget.state.selectedProjectCategory,
                          isAnimationStart: widget.state.isProjectDetailAni,
                        ),
                      ),

                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
