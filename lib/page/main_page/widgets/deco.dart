import 'package:flutter/material.dart';

//상단 직각삼각형
class DiagonalTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, size.height) // 우측 하단 (직각 위치)
      ..lineTo(0, size.height) // 좌측 하단
      ..lineTo(size.width, 0) // 우측 상단
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//하단 직각삼각형
class DiagonalTriangleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0) // 좌측 상단 (직각 위치)
      ..lineTo(size.width, 0) // 우측 상단
      ..lineTo(0, size.height) // 좌측 하단
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DiagonalTriangle extends StatelessWidget {
  final bool isTop;
  const DiagonalTriangle({super.key, required this.isTop});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: isTop ? DiagonalTriangleClipper() : DiagonalTriangleClipper2(),
      child: SizedBox(
        width: double.infinity,
        height: 220,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              color: const Color.fromARGB(255, 192, 183, 170),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.10,
              color: const Color.fromARGB(255, 227, 217, 205),
            ),
          ],
        ),
      ),
    );
  }
}
