import 'dart:ui';

import 'package:flutter/material.dart';

class LoginError extends StatefulWidget {
  const LoginError({super.key});

  @override
  State<LoginError> createState() => _LoginErrorState();
}

class _LoginErrorState extends State<LoginError> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: screenWidth * 0.85,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset('assets/error.png', height: 50),
                const SizedBox(height: 9),
                const Text(
                  '로그인 실패',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111111),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '로그인에 실패하였습니다.\n잠시후 다시 로그인 시도해 주세요.',
                  style: TextStyle(
                    color: Color(0xff5b5b5b),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6fbf8a), // 버튼 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: const Size(double.infinity, 40), // 버튼 사이즈 조절
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
