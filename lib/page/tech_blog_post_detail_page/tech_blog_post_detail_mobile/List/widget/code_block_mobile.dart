import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeBlockMobile extends StatefulWidget {
  final String code;
  final String? title;
  final String language;
  final bool isBackgroundColor;

  const CodeBlockMobile({
    super.key,
    required this.code,
    this.title,
    this.language = 'dart',
    this.isBackgroundColor = false,
  });

  @override
  State<CodeBlockMobile> createState() => _CodeBlockMobileState();
}

class _CodeBlockMobileState extends State<CodeBlockMobile> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
              color:
                  widget.isBackgroundColor
                      ? Colors.grey.shade200
                      : Colors.grey.shade800,
              borderRadius:
                  _isExpanded
                      ? BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      )
                      : BorderRadius.circular(12.r),
              border: Border.all(
                color:
                    widget.isBackgroundColor
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                        color:
                            widget.isBackgroundColor
                                ? Colors.black
                                : Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color:
                        widget.isBackgroundColor
                            ? Colors.grey.shade600
                            : Colors.grey.shade400,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
        if (_isExpanded) ...[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color:
                  widget.isBackgroundColor
                      ? Colors.grey.shade50
                      : const Color(0xFF23241f),
              borderRadius:
                  widget.title != null
                      ? BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      )
                      : BorderRadius.circular(12.r),
              border: Border.all(
                color:
                    widget.isBackgroundColor
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
              ),
            ),
            child: HighlightView(
              widget.code,
              language: widget.language,
              theme: monokaiSublimeTheme,
              padding: EdgeInsets.all(20.w),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Courier',
                height: 1.5,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
