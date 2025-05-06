//TODO: 리펙

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterBox extends StatefulWidget {
  final String chapter;
  final String title;
  final TextStyle? chapterTextStyle;
  final TextStyle? titleTextStyle;
  final int? scrollCount;

  const ChapterBox({
    super.key,
    required this.chapter,
    required this.title,
    this.chapterTextStyle,
    this.titleTextStyle,
    this.scrollCount,
  });

  @override
  State<ChapterBox> createState() => _ChapterBoxState();
}

class _ChapterBoxState extends State<ChapterBox> {
  String titleDescription = '';
  bool isOpacity = false;
  bool isActive = false;
  @override
  void didUpdateWidget(covariant ChapterBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 2) {
      awaitFuture(2);
    } else if (widget.scrollCount == 3 && isActive) {
      awaitFuture(3);
    } else if (widget.scrollCount == 4 && isActive) {
      setState(() {
        titleDescription = '함께하는 법을 배웠습니다.';
        isOpacity = true;
      });
    } else if (widget.scrollCount == 5) {
      setState(() {
        titleDescription = '중심이길 원해 참여하고있습니다.';
        isOpacity = true;
      });
    } else {
      setState(() {
        titleDescription = '';
        isOpacity = false;
      });
    }
  }

  void awaitFuture(int count) async {
    if (count == 2) {
      setState(() {
        isOpacity = false;
        isActive = false;
      });
      await Future.delayed(const Duration(milliseconds: 420));
      setState(() {
        titleDescription = '';
        isOpacity = false;
        isActive = true;
      });
    } else {
      setState(() {
        isOpacity = false;
        isActive = false;
      });
      await Future.delayed(const Duration(milliseconds: 420));
      setState(() {
        titleDescription = '  버튼을 클릭해 이야기를 시작해보세요';
        isOpacity = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.chapter,
            style: widget.chapterTextStyle ??
                GoogleFonts.dancingScript(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  AnimatedOpacity(
                    opacity: isOpacity ? 0 : 1,
                    duration: const Duration(milliseconds: 420),
                    child: Text(
                      widget.title,
                      style: widget.titleTextStyle ??
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isOpacity ? 1 : 0,
                    duration: const Duration(milliseconds: 420),
                    child: Text(
                      titleDescription,
                      style: widget.titleTextStyle ??
                          const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
