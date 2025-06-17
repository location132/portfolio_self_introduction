import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileFaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isLastItem;
  final Duration animationDelay;

  const MobileFaqItem({
    super.key,
    required this.question,
    required this.answer,
    this.isLastItem = false,
    this.animationDelay = Duration.zero,
  });

  @override
  State<MobileFaqItem> createState() => _MobileFaqItemState();
}

class _MobileFaqItemState extends State<MobileFaqItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _iconRotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _iconRotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          children: [
            // 질문 섹션 (항상 보임)
            InkWell(
              onTap: _toggleExpansion,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 118, 239, 241),
                          height: 1.4,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    AnimatedBuilder(
                      animation: _iconRotationAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _iconRotationAnimation.value * 3.14159,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white.withValues(alpha: 0.7),
                            size: 24.sp,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // 답변 섹션 (확장/축소)
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  widget.answer,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[300],
                    height: 1.6,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
