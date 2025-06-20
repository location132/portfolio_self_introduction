import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/2_login_page/2.1_login_error.dart';
import 'package:my_dream/Page/2_login_page/snsLogin/apple_login.dart';
import 'package:my_dream/Page/2_login_page/snsLogin/google_login.dart';
import 'package:my_dream/Page/2_login_page/snsLogin/kakao_login.dart';
import 'package:my_dream/Page/2_login_page/snsLogin/naver_login.dart';

import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
      if (mounted) {
        setState(() {
          _isIndicator = toggleIndicator;
          _isFiltter = false;
        });
      }
    }
  }

  void handleLoginResult(bool isSuccess) {
    if (!isSuccess) {
      showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return const LoginError();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final joinStatus = Provider.of<JoinModel>(context).isFirstClickSNSLogin;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 6,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 32,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.076, right: screenWidth * 0.076),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/ifSaiLogo.png',
                      width: 150,
                    ),
                    const SizedBox(height: 40),
                    const Text('잎사이에 오신것을 환영합니다!\n소셜계정을 통해 회원가입을 진행해주세요:)',
                        style: TextStyle(
                          color: Color(0xff111111),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20), // 삭제
                    const Text('현재 테스터는 구글 로그인만 가능합니다.',
                        style: TextStyle(color: Colors.red)), // 삭제
                    SizedBox(height: screenHeight * 0.09),
                    IgnorePointer(
                      ignoring: !joinStatus,
                      child: Column(
                        children: [
                          NaverLogin(
                            onLoginResult: handleLoginResult,
                            isLoading: _isToggleIndicator,
                          ),
                          const SizedBox(height: 14),
                          KakaoLogin(
                            onLoginResult: handleLoginResult,
                            isLoading: _isToggleIndicator,
                          ),
                          const SizedBox(height: 14),
                          GoogleLogin(
                            onLoginResult: handleLoginResult,
                            isLoading: _isToggleIndicator,
                          ),
                          const SizedBox(height: 14),
                          AppleLogin(
                            onLoginResult: handleLoginResult,
                            isLoading: _isToggleIndicator,
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushNamed(context, '/MainScreen');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Color(0xff757575),
                                  )),
                                ),
                                child: const Text(
                                  '회원가입 없이 둘러보기',
                                  style: TextStyle(
                                    color: Color(0xff757575),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.12),
                  ],
                ),
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
    );
  }
}
