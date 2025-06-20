import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeBlock extends StatefulWidget {
  final String code;
  final String? title;
  final String language;
  final bool isBackgroundColor;
  final bool isMobile;

  const CodeBlock({
    super.key,
    required this.code,
    this.title,
    this.language = 'dart',
    this.isBackgroundColor = false,
    required this.isMobile,
  });

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 20.w : 20,
              vertical: widget.isMobile ? 12.h : 12,
            ),
            decoration: BoxDecoration(
              color:
                  widget.isBackgroundColor
                      ? Colors.grey.shade200
                      : Colors.grey.shade800,
              borderRadius:
                  _isExpanded
                      ? BorderRadius.only(
                        topLeft: Radius.circular(widget.isMobile ? 12.r : 12),
                        topRight: Radius.circular(widget.isMobile ? 12.r : 12),
                      )
                      : BorderRadius.circular(12),
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
                        width: widget.isMobile ? 12.w : 12,
                        height: widget.isMobile ? 12.h : 12,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: widget.isMobile ? 8.w : 8),
                      Container(
                        width: widget.isMobile ? 12.w : 12,
                        height: widget.isMobile ? 12.h : 12,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: widget.isMobile ? 8.w : 8),
                      Container(
                        width: widget.isMobile ? 12.w : 12,
                        height: widget.isMobile ? 12.h : 12,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: widget.isMobile ? 16.w : 16),
                  Expanded(
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                        color:
                            widget.isBackgroundColor
                                ? Colors.black
                                : Colors.white,
                        fontSize: widget.isMobile ? 14.sp : 14,
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
                    size: widget.isMobile ? 20.w : 20,
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
                        bottomLeft: Radius.circular(
                          widget.isMobile ? 12.r : 12,
                        ),
                        bottomRight: Radius.circular(
                          widget.isMobile ? 12.r : 12,
                        ),
                      )
                      : BorderRadius.circular(widget.isMobile ? 12.r : 12),
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
              padding: EdgeInsets.all(widget.isMobile ? 20.w : 20),
              textStyle: TextStyle(
                fontSize: widget.isMobile ? 16.sp : 16,
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
