import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Padding? padding;

  const StyledText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.padding,
  });

  factory StyledText.heading({
    required String text,
    Color? color,
    TextAlign? textAlign,
  }) {
    return StyledText(
      text: text,
      fontSize: 38,
      fontWeight: FontWeight.bold,
      color: color,
      textAlign: textAlign,
    );
  }

  factory StyledText.subHeading({
    required String text,
    Color? color,
    TextAlign? textAlign,
  }) {
    return StyledText(
      text: text,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
