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
              Text(
                widget.title,
                style: widget.titleTextStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
