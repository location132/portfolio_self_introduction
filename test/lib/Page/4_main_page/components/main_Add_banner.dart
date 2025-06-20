/*
  메인화면의 배너를 포함한 위젯입니다.
 */

import 'package:flutter/material.dart';

class MainAddBanner extends StatelessWidget {
  final Widget content;
  final double height;
  final double? width;
  const MainAddBanner(
      {super.key, required this.content, required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xffdbdbdb),
        borderRadius: BorderRadius.circular(8),
      ),
      child: content,
    );
  }
}
