/*
재사용

잎사이에서 자주 사용하는 초록색 버튼
버튼 클릭 시 함수 실행
*/

import 'package:flutter/material.dart';

class WideGreenButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const WideGreenButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6FBF8A),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'Pretendard',
        ),
      ),
    );
  }
}
