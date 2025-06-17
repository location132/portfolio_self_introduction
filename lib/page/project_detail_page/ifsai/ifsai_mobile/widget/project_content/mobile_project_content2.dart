import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

import 'mobile_project_image_section.dart';
import 'mobile_tech_stack_card.dart';
import 'animation/mobile_tech_stack_animation_controller.dart';

class MobileProjectContent2 extends StatefulWidget {
  final bool isVisible;

  const MobileProjectContent2({super.key, required this.isVisible});

  @override
  State<MobileProjectContent2> createState() => _MobileProjectContent2State();
}

class _MobileProjectContent2State extends State<MobileProjectContent2>
    with TickerProviderStateMixin {
  late MobileTechStackAnimationController _animationController;
  bool _showAll = false;

  @override
  void initState() {
    super.initState();
    _animationController = MobileTechStackAnimationController();
    _animationController.initializeAnimation(this);

    if (widget.isVisible) {
      _animationController.startAnimation();
    }
  }

  @override
  void didUpdateWidget(MobileProjectContent2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !oldWidget.isVisible) {
      _animationController.startAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const techStackData = TitleTextConstants.projectTechStackData;
    final techStacks = List<Map<String, dynamic>>.from(
      techStackData['techStacks'],
    );

    return Column(
      children: [
        SizedBox(height: 80.h),

        Center(
          child: SizedBox(
            width: (ScreenUtil().screenWidth * 0.9).clamp(280.0, 600.0),
            child: Column(
              children: [
                Text(
                  techStackData['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 60.h),
                SizedBox(
                  width: (ScreenUtil().screenWidth * 0.7).clamp(250.0, 400.0),
                  child: MobileProjectImageSection(
                    imagePath: techStackData['imagePath'],
                    imageDescription: techStackData['imageDescription'],
                    width: (ScreenUtil().screenWidth * 0.7).clamp(250.0, 400.0),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 80.h),

        // 기술 스택 카드
        FadeTransition(
          opacity: _animationController.fadeAnimation,
          child: SlideTransition(
            position: _animationController.slideAnimation,
            child: Center(
              child: SizedBox(
                width: (ScreenUtil().screenWidth * 0.9).clamp(280.0, 400.0),
                child: Column(
                  children: [
                    ...(_showAll ? techStacks : techStacks.take(2)).map((
                      techStack,
                    ) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 40.h),
                        child: MobileTechStackCard(
                          title: techStack['title'],
                          items: List<String>.from(techStack['items']),
                        ),
                      );
                    }),
                    if (techStacks.length > 2 && !_showAll) ...[
                      SizedBox(height: 20.h),
                      _buildToggleButton(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 120.h),
      ],
    );
  }

  Widget _buildToggleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showAll = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          '더보기 (${techStacks.length - 2}개)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> get techStacks {
    const techStackData = TitleTextConstants.projectTechStackData;
    return List<Map<String, dynamic>>.from(techStackData['techStacks']);
  }
}
