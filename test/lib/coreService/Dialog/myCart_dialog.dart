//로그인이 필요한 기능에 나오는 모달창//

/* 다이아 로그
1. 장바구니에 물건 담겼을 때, 나오는 모달창
2. 뒤로가기
3. 완료되면 모달창 종료
 */

import 'dart:ui';
import 'package:flutter/material.dart';

//장바구니에 물건 담겼을 때, 나오는 모달창//
void showLoginRequiredForCartDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return const MyCartDialog();
    },
  );
}

class MyCartDialog extends StatefulWidget {
  const MyCartDialog({super.key});

  @override
  State<MyCartDialog> createState() => _MyCartDialogState();
}

class _MyCartDialogState extends State<MyCartDialog>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 40, right: 40),
                    child: Text(
                      '성공적으로 장바구니에 담겼습니다!',
                      style: TextStyle(
                        color: Color(0xff5b5b5b),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                  _buildButton(
                    '장바구니로 이동하기',
                    const Color(0xFF6FBE8A),
                    () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                      Navigator.pushNamed(context, '/MyShoppingCart');
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildButton(
                    '좀 더 둘러보기',
                    const Color(0xFF111111),
                    () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String text,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: ShapeDecoration(
          color: const Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      ),
    );
  }
}
