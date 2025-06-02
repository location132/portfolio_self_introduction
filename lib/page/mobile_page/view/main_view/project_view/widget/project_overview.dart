import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectOverview extends StatefulWidget {
  final List<Map<String, String>> projects;
  final bool isAnimationStart;
  const ProjectOverview({
    super.key,
    required this.projects,
    required this.isAnimationStart,
  });

  @override
  State<ProjectOverview> createState() => _ProjectOverviewState();
}

class _ProjectOverviewState extends State<ProjectOverview>
    with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<Offset>> _slideAnimations = [];
  final List<Animation<double>> _opacityAnimations = [];

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
    for (var controller in _controllers) {
      controller.dispose();
    }
    _controllers.clear();
    _slideAnimations.clear();
    _opacityAnimations.clear();

    for (int i = 0; i < widget.projects.length; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
      _controllers.add(controller);

      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );
      _slideAnimations.add(slideAnimation);

      final opacityAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
      _opacityAnimations.add(opacityAnimation);
    }
  }

  @override
  void didUpdateWidget(ProjectOverview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.projects.length != widget.projects.length) {
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
    for (var controller in _controllers) {
      controller.reset();
    }

    await Future.delayed(const Duration(milliseconds: 100));

    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          _controllers[i].forward();
        }
      });
    }
  }

  void _resetAnimations() {
    for (var controller in _controllers) {
      controller.reset();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildProjectCard(Map<String, String> project, int index) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: FadeTransition(
        opacity: _opacityAnimations[index],
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
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
                project['title'] ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                project['description'] ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withValues(alpha: 0.7),
                  height: 1.4,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 40.w,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            widget.projects.asMap().entries.map((entry) {
              return _buildProjectCard(entry.value, entry.key);
            }).toList(),
      ),
    );
  }
}
