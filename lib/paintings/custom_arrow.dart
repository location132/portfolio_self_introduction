import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/paintings/arrow_painter.dart';

class CustomLine extends StatelessWidget {
  final double width;
  final double height;

  const CustomLine({super.key, this.width = double.infinity, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height), // 원하는 크기 지정
      painter: ArrowWithTrianglePainter(),
    );
  }
}
