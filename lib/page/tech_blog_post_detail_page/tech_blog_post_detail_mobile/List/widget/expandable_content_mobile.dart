import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableContentMobile extends StatefulWidget {
  final String summary;
  final String detailContent;
  final String toggleText;
  final String toggleTextClose;
  final bool isBackgroundColor;
  const ExpandableContentMobile({
    super.key,
    required this.summary,
    required this.detailContent,
    this.toggleText = '개념을 자세히 정리했어요. 궁금하면 Click',
    this.toggleTextClose = '이해했어요 (닫기)',
    this.isBackgroundColor = false,
  });

  @override
  State<ExpandableContentMobile> createState() =>
      _ExpandableContentMobileState();
}

class _ExpandableContentMobileState extends State<ExpandableContentMobile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800.w,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.summary,
              style: TextStyle(
                color: widget.isBackgroundColor ? Colors.black : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: _toggleExpansion,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isExpanded ? widget.toggleTextClose : widget.toggleText,
                  style: TextStyle(
                    color:
                        widget.isBackgroundColor
                            ? Colors.black
                            : Colors.grey.shade300,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.w),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color:
                        widget.isBackgroundColor
                            ? Colors.black
                            : Colors.grey.shade300,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded ? null : 0,
            child:
                _isExpanded
                    ? FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color:
                              widget.isBackgroundColor
                                  ? Colors.grey.shade100.withValues(alpha: 0.4)
                                  : Colors.grey.shade900.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color:
                                widget.isBackgroundColor
                                    ? Colors.grey.shade300.withValues(
                                      alpha: 0.5,
                                    )
                                    : Colors.grey.shade700.withValues(
                                      alpha: 0.5,
                                    ),
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          widget.detailContent,
                          style: TextStyle(
                            color:
                                widget.isBackgroundColor
                                    ? Colors.black
                                    : Colors.grey.shade200,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.7,
                          ),
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
