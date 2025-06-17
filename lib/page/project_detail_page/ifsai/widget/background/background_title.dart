import 'package:flutter/material.dart';

class BackgroundTitle extends StatelessWidget {
  const BackgroundTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '사용자 경험을 위해 탄생한 백그라운드\n조용하게 돌아가는 최고의 기술',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.4,
      ),
    );
  }
}
