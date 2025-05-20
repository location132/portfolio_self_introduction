// 좌즉 하단 회고 텍스트

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class RetrospectTextView extends StatelessWidget {
  final int scrollCount;
  const RetrospectTextView({
    super.key,
    required this.scrollCount,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 40,
      child: Stack(
        children: [
          // 페이지 0번
          AnimatedOpacity(
            opacity: scrollCount == 0 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1100),
            child: const Text(
              ProfilePage1Constants.retrospect1,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          // 페이지 1번
          AnimatedOpacity(
            opacity: scrollCount == 1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1100),
            child: const Text(
              ProfilePage1Constants.retrospect0,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
