import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';

import 'package:provider/provider.dart';

class GoogleLogin extends StatefulWidget {
  final Function(bool) onLoginResult;
  final Function(bool) isLoading;

  const GoogleLogin(
      {super.key, required this.onLoginResult, required this.isLoading});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  void signInWithGoogle() async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    joinStatus.setIsFirstClickSNSLogin(false);
    setState(() {
      widget.isLoading(true); // 로딩 인디케이터
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        String accessToken = googleAuth.accessToken!;
        var result = await snsLogin('GOOGLE', accessToken);
        if (result['status'] == 'success') {
          loginStatus.setloginStatus(true);
          var roleResult = await patchRoleSendSever(); // 프로필 조회
          loginStatus
              .setStudentEmail(roleResult['userEmail'].toString()); // 학생 이메일 저장
          loginStatus.setOnProfileImageReceived(
              roleResult['image'].toString()); // 프로필 이미지 저장
          loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장

          if (roleResult['school']) {
            // 학생인증을 예전에 완료했을 시,
            loginStatus.setIsStudent(roleResult['school']);
            _offIndicator();
            userIsStudents();
          } else if (!roleResult['school']) {
            // 학생인증이 안되어있을 시,
            _offIndicator();
            userIsNotStudents();
          }
        } else {
          // 서버 에러
          await Future.delayed(const Duration(seconds: 1));
          widget.isLoading(false);
          joinStatus.setIsFirstClickSNSLogin(true);
          widget.onLoginResult(false);
        }
      } else {
        widget.isLoading(false);
        joinStatus.setIsFirstClickSNSLogin(true);
        widget.onLoginResult(false);
      }
    } catch (e) {
      widget.isLoading(false);
      joinStatus.setIsFirstClickSNSLogin(true);
      widget.onLoginResult(false);
    }
  }

  // 인디케이터 끄기
  void _offIndicator() async {
    setState(() {
      widget.isLoading(false);
    });
    await Future.delayed(const Duration(seconds: 1));
  }

  // 해당 사용자가 학생일 떄,
  void userIsStudents() async {
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);

    setState(() {
      widget.isLoading(false);
    });
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      // 앱을 둘러보던 중 로그인을 하는거라면 마지막페이지로 이동
      if (pageRoutesStatus.pageController.isEmpty ||
          pageRoutesStatus.pageController == '') {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/MainScreen',
          (route) => false,
        );
        joinStatus.setIsFirstClickSNSLogin(false);
      } else {
        if (pageRoutesStatus.pageController == '/StoreDetail') {
          pageRoutesStatus.setRetryStoreDetail(true);
          Navigator.popUntil(context, ModalRoute.withName('/StoreDetail'));
        } else {
          Navigator.pushReplacementNamed(
              context, pageRoutesStatus.pageController);
          joinStatus.setIsFirstClickSNSLogin(false);
        }
      }
      pageRoutesStatus.setclearPageController();
    }
  }

  // 해당 사용자가 학생인증을 안했다면
  void userIsNotStudents() async {
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    setState(() {
      widget.isLoading(false);
    });
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/StudentIdentityCheck');
      joinStatus.setIsFirstClickSNSLogin(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () => signInWithGoogle(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/ios_light_sq_SU@3x.png',
        ),
      ),
    );
  }
}
