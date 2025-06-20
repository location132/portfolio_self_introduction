import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget content;
  const MainContainer(
      {super.key, required this.content, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: content,
    );
  }
}
