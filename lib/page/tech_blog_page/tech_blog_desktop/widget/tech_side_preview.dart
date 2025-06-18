import 'package:flutter/material.dart';

class TechSidePreview extends StatelessWidget {
  const TechSidePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 700,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade800, Colors.grey.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        '사이드 배너 또는 이미지 영역',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
      ),
    );
  }
}
