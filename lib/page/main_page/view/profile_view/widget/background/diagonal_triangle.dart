import 'package:flutter/material.dart';

class DiagonalTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, size.height) // 우측 하단
      ..lineTo(0, size.height) // 좌측 하단
      ..lineTo(size.width, 0) // 우측 상단
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DiagonalTriangleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0) // 좌측 상단
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
  final String? description;

  const DiagonalTriangle({
    super.key,
    required this.isTop,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: isTop ? DiagonalTriangleClipper() : DiagonalTriangleClipper2(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
