import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dream/Page/3_student_email_page/3.1_student_email.dart';
import 'package:my_dream/Page/3_student_email_page/3.2_student_email_check.dart';

class StudentIdentityCheck extends StatefulWidget {
  const StudentIdentityCheck({super.key});

  @override
  State<StudentIdentityCheck> createState() => _StudentIdentityCheck();
}

class _StudentIdentityCheck extends State<StudentIdentityCheck> {
  bool _isIndicator = false;
  bool _isIndicatorOpacity = false;
  bool _isFiltter = false;

  void _isToggleIndicator(toggleIndicator) async {
    // 이메일 코드 입력 인디케이터
    if (toggleIndicator) {
      setState(() {
        _isFiltter = true;
        _isIndicatorOpacity = true;
        _isIndicator = toggleIndicator;
      });
    } else {
      setState(() {
        _isIndicatorOpacity = false;
        _isFiltter = false;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _isIndicator = toggleIndicator;
        _isFiltter = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.076, right: screenWidth * 0.076),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.175),
                      const Text('사용자가 대학생일 경우,\n아래 학생인증을 완료해주세요:)',
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            color: Color(0xff111111),
                            fontSize: 22,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(height: screenHeight * 0.1),
                      const StudentEmailCheck(),
                      const SizedBox(height: 10),
                      UnivMailCheck(isLoading: _isToggleIndicator),
                      const Spacer(),
                      const Text(
                        '아니요, 대학생이 아닙니다.',
                        style: TextStyle(
                          color: Color(0xffa8a8a8),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/MainScreen');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  child: const Text(
                                    '건너뛰기',
                                    style: TextStyle(
                                      color: Color(0xff424242),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: AnimatedOpacity(
                      opacity: _isIndicatorOpacity ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: BackdropFilter(
                        filter: _isFiltter
                            ? ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3)
                            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Center(
                          child: AnimatedOpacity(
                            opacity: _isIndicatorOpacity ? 1.0 : 0.0,
                            duration: const Duration(seconds: 1),
                            child: _isIndicator
                                ? SizedBox(
                                    width: screenHeight * 0.118,
                                    height: screenHeight * 0.118,
                                    child: const CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      strokeWidth: 12,
                                      backgroundColor: Color(0xffeeeeee),
                                      color: Color(0xff6fbf8a),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
