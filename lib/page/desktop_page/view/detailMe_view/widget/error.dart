import 'package:flutter/material.dart';

class ErrorSize extends StatelessWidget {
  const ErrorSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            '화면 높이가 너무 낮습니다',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Rive 애니메이션을 안전하게 실행하려면\n'
            '브라우저 창의 높이를 늘려주세요',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 28),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              '권장 높이: 600이상  •  현재: ${MediaQuery.of(context).size.height.toInt()}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 13.5,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
