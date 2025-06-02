import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/skill_view/animation/skill_animation.dart';

class SkillOverview extends StatefulWidget {
  final List<String> icons;
  final bool isAnimationStart;
  const SkillOverview({
    super.key,
    required this.icons,
    required this.isAnimationStart,
  });

  @override
  State<SkillOverview> createState() => _SkillOverviewState();
}

class _SkillOverviewState extends State<SkillOverview>
    with TickerProviderStateMixin {
  final List<SkillAnimation> _skillAnimations = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      }
    });
  }

  void _initializeAnimations() {
    for (var animation in _skillAnimations) {
      animation.dispose();
    }
    _skillAnimations.clear();

    for (int i = 0; i < widget.icons.length; i++) {
      _skillAnimations.add(SkillAnimation(vsync: this));
    }
  }

  @override
  void didUpdateWidget(SkillOverview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.icons.length != widget.icons.length) {
      _initializeAnimations();
      if (widget.isAnimationStart) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startSequentialAnimation();
        });
      }
    } else if (oldWidget.isAnimationStart != widget.isAnimationStart) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      } else {
        _resetAnimations();
      }
    }
  }

  void _startSequentialAnimation() async {
    for (var animation in _skillAnimations) {
      animation.reset();
    }

    await Future.delayed(const Duration(milliseconds: 100));

    for (int i = 0; i < _skillAnimations.length; i++) {
      Future.delayed(Duration(milliseconds: i * 120), () {
        if (mounted) {
          _skillAnimations[i].forward();
        }
      });
    }
  }

  void _resetAnimations() {
    for (var animation in _skillAnimations) {
      animation.reset();
    }
  }

  @override
  void dispose() {
    for (var animation in _skillAnimations) {
      animation.dispose();
    }
    super.dispose();
  }

  Widget _buildIcon(String iconPath, int index) {
    Widget iconWidget;

    if (iconPath.endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        iconPath,
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      );
    } else {
      iconWidget = Image.asset(
        iconPath,
        width: 30.w,
        height: 30.h,
        fit: BoxFit.contain,
      );
    }

    return ScaleTransition(
      scale: _skillAnimations[index].scaleShow,
      child: FadeTransition(
        opacity: _skillAnimations[index].opacityShow,
        child: Container(
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: iconWidget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white.withValues(alpha: 0.05),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children:
              widget.icons.asMap().entries.map((entry) {
                return _buildIcon(entry.value, entry.key);
              }).toList(),
        ),
      ),
    );
  }
}
