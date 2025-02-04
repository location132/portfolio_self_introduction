import 'package:flutter/material.dart';

class ArrowWithTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = const Color.fromARGB(255, 110, 169, 193)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width - 10, size.height / 2),
      linePaint,
    );

    Paint trianglePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path trianglePath = Path();
    double arrowSize = 10;

    // 🔹 화살표 머리 그리기
    trianglePath.moveTo(size.width, size.height / 2);
    trianglePath.lineTo(
        size.width - arrowSize, size.height / 2 - arrowSize / 2);
    trianglePath.lineTo(
        size.width - arrowSize, size.height / 2 + arrowSize / 2);
    trianglePath.close();

    canvas.drawPath(trianglePath, trianglePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
