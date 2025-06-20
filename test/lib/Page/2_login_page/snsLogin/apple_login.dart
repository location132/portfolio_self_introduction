import 'package:flutter/material.dart';

class AppleLogin extends StatefulWidget {
  final Function(bool) onLoginResult;
  final Function(bool) isLoading;
  const AppleLogin(
      {super.key, required this.onLoginResult, required this.isLoading});

  @override
  State<AppleLogin> createState() => _AppleLogin();
}

class _AppleLogin extends State<AppleLogin> {
  void signInWithApple() async {
    setState(() {
      widget.isLoading(true); // 로딩 인디케이터
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      widget.isLoading(false);
      widget.onLoginResult(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        signInWithApple();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/apple_login.png',
        ),
      ),
    );
  }
}
