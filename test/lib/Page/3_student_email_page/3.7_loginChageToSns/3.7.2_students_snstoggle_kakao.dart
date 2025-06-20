import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class EmailWithKakao extends StatefulWidget {
  const EmailWithKakao({super.key});

  @override
  State<EmailWithKakao> createState() => _EmailWithKakaoState();
}

class _EmailWithKakaoState extends State<EmailWithKakao> {
  bool _isIndicator = false;
  bool _isIndicatorOpacity = false;
  bool _isFiltter = false;

  void isChangeSnsLogin() async {
    setState(() {
      _isIndicatorOpacity = true;
      _isFiltter = true;
      _isIndicator = true;
    });
    await ifsaiLogout(); // 잎사이 로그아웃
    signInWithKakao();
  }

  Future<void> signInWithKakao() async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    joinStatus.setIsFirstClickSNSLogin(false);

    OAuthToken token;
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        String accessToken = token.accessToken;
        var result = await snsLogin('KAKAO', accessToken);

        await Future.delayed(const Duration(seconds: 2));
        if (result['status'] == 'success') {
          loginStatus.setloginStatus(true);

          var roleResult = await patchRoleSendSever();
          loginStatus
              .setStudentEmail(roleResult['userEmail'].toString()); // 학생 이메일 저장
          loginStatus.setOnProfileImageReceived(
              roleResult['image'].toString()); // 프로필 이미지 저장
          loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장

          if (roleResult['status'] == 'students') {
            // 학생인증을 예전에 완료했을 시,
            userIsStudents();
          } else if (roleResult['status'] == 'not students') {
            // 학생인증이 안되어있을 시,
            userIsNotStudents();
          }
        } else {}
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          String accessToken = token.accessToken;
          var result = await snsLogin('KAKAO', accessToken);

          await Future.delayed(const Duration(seconds: 2));

          if (result['status'] == 'success') {
            loginStatus.setloginStatus(true);

            var roleResult = await patchRoleSendSever();
            loginStatus.setStudentEmail(
                roleResult['userEmail'].toString()); // 학생 이메일 저장
            loginStatus.setOnProfileImageReceived(
                roleResult['image'].toString()); // 프로필 이미지 저장
            loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장
            if (roleResult['status'] == 'students') {
              // 학생인증을 예전에 완료했을 시,
              userIsStudents();
            } else if (roleResult['status'] == 'not students') {
              // 학생인증이 안되어있을 시,
              userIsNotStudents();
            }
          } else {}
        } catch (error) {}
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        String accessToken = token.accessToken;
        var result = await snsLogin('KAKAO', accessToken);
        await Future.delayed(const Duration(seconds: 2));
        if (result['status'] == 'success') {
          loginStatus.setloginStatus(true);

          var roleResult = await patchRoleSendSever();
          loginStatus
              .setStudentEmail(roleResult['userEmail'].toString()); // 학생 이메일 저장
          loginStatus.setOnProfileImageReceived(
              roleResult['image'].toString()); // 프로필 이미지 저장
          loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장
          if (roleResult['status'] == 'students') {
            // 학생인증을 예전에 완료했을 시,
            userIsStudents();
          } else if (roleResult['status'] == 'not students') {
            // 학생인증이 안되어있을 시,
            userIsNotStudents();
          }
        } else {}
      } catch (error) {}
    }
  }

  // 해당 사용자가 학생일 떄,
  void userIsStudents() async {
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    print('네이버 로그인 성공, 해당 유저는 이미 학생으로 인증을 완료하였습니다');

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isIndicatorOpacity = false;
      _isFiltter = false;
      _isIndicator = false;
    });

    if (mounted) {
      Navigator.pushNamed(context, '/MainScreen');
      joinStatus.setIsFirstClickSNSLogin(false);
    }
  }

  // 해당 사용자가 학생이지만, 네이버 아이디와 일치하지 않을 떄,
  void userIsNotStudents() async {
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    print('네이버 로그인 성공, 기존에 가입했던 네이버 아이디와 일치하지 않습니다.');

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isIndicatorOpacity = false;
      _isFiltter = false;
      _isIndicator = false;
    });
    if (mounted) {
      Navigator.pushNamed(context, '/StudentIdentityCheck');
      joinStatus.setIsFirstClickSNSLogin(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = Provider.of<JoinModel>(context).isUserEmail;
    final screenHeight = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.only(left: 30, right: 30),
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          '해당 이메일 $userEmail 은\n 카카오로 학생인증이 완료된 이메일입니다\n\n 아래의 확인버튼을 클릭하시면\n 현재 로그인된 sns를 로그아웃하고\n 카카오로 로그인합니다',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff5b5b5b),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            !_isIndicator ? isChangeSnsLogin() : null;
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff6fbf8a),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: SizedBox(
                                      width: screenHeight * 0.118,
                                      height: screenHeight * 0.118,
                                      child: const CircularProgressIndicator(
                                        strokeCap: StrokeCap.round,
                                        strokeWidth: 12,
                                        backgroundColor: Color(0xffeeeeee),
                                        color: Color(0xff6fbf8a),
                                      ),
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
          ],
        ),
      ),
    );
  }
}
