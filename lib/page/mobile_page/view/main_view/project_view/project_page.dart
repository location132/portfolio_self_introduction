import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/two_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';

class ProjectPage extends StatelessWidget {
  final ProjectModel state;
  final MobileCubit cubit;
  const ProjectPage({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TwoLineTitle(
          isTitelText: state.isTitleAniStart,
          title: '더 강력한 개발자로 UP',
          subTitle: '신입 프로젝트를 더욱 멋지게',
          color: Colors.white,
          subTitleColor: Colors.white,
          subTitleFontSize: 17.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              AnimatedOpacity(
                opacity: state.isProjectItemsAniStart ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: Column(
                  children: [
                    ProjectCategorySection(
                      title: 'Flutter',
                      description: 'Flutter를 사용해 만든 모든 프로젝트를 소개합니다.',
                      projectCount: '6개의 프로젝트',
                      onButtonPressed: () {
                        cubit.showProjectDetail('flutter');
                      },
                      isAnimationStart: state.isProjectItemsAniStart,
                      animationDelay: 0,
                    ),

                    SizedBox(height: 30.h),

                    ProjectCategorySection(
                      title: 'Flutter in Rive',
                      description: 'Rive 애니메이션과 Flutter의 완벽한 조합으로 만든 프로젝트입니다.',
                      projectCount: '3개의 프로젝트',
                      onButtonPressed: () {
                        cubit.showProjectDetail('flutter_rive');
                      },
                      isAnimationStart: state.isProjectItemsAniStart,
                      animationDelay: 200,
                    ),

                    SizedBox(height: 30.h),

                    ProjectCategorySection(
                      title: '앞으로 진행할 프로젝트',
                      description: '새로운 도전을 준비하고 있습니다. 더 나은 개발자가 되기 위한 여정입니다.',
                      projectCount: '4개의 계획',
                      onButtonPressed: () {
                        cubit.showProjectDetail('future');
                      },
                      isAnimationStart: state.isProjectItemsAniStart,
                      animationDelay: 400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectCategorySection extends StatefulWidget {
  final String title;
  final String description;
  final String projectCount;
  final VoidCallback onButtonPressed;
  final bool isAnimationStart;
  final int animationDelay;

  const ProjectCategorySection({
    super.key,
    required this.title,
    required this.description,
    required this.projectCount,
    required this.onButtonPressed,
    required this.isAnimationStart,
    required this.animationDelay,
  });

  @override
  State<ProjectCategorySection> createState() => _ProjectCategorySectionState();
}

class _ProjectCategorySectionState extends State<ProjectCategorySection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    if (widget.isAnimationStart) {
      Future.delayed(Duration(milliseconds: widget.animationDelay), () {
        if (mounted) {
          _animationController.forward();
        }
      });
    }
  }

  @override
  void didUpdateWidget(ProjectCategorySection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isAnimationStart != widget.isAnimationStart) {
      if (widget.isAnimationStart) {
        Future.delayed(Duration(milliseconds: widget.animationDelay), () {
          if (mounted) {
            _animationController.forward();
          }
        });
      } else {
        _animationController.reset();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white.withValues(alpha: 0.05),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withValues(alpha: 0.8),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.projectCount,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: widget.onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.1),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 8.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '프로젝트 보기',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.arrow_forward_ios, size: 12.w),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
