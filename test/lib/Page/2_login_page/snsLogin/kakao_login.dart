import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:provider/provider.dart';

class KakaoLogin extends StatefulWidget {
  final Function(bool) onLoginResult;
  final Function(bool) isLoading;

  const KakaoLogin({
    super.key,
    required this.onLoginResult,
    required this.isLoading,
  });

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  Future<void> signInWithKakao() async {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final joinStatus = Provider.of<JoinModel>(context, listen: false);
    joinStatus.setIsFirstClickSNSLogin(false);
    setState(() {
      widget.isLoading(true); // 로딩 인디케이터
    });

    OAuthToken token;

    // 카카오톡이 설치되어있으면 카카오톡으로 먼저 로그인을 시도
    // --------------------
    // 설치되어있지 않다면 다음 If문으로 넘어갑니다.
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        var result = await snsLogin('KAKAO', token.accessToken);
        if (result['status'] == 'success') {
          loginStatus.setloginStatus(true);
          var roleResult = await patchRoleSendSever();
          loginStatus
              .setStudentEmail(roleResult['userEmail'].toString()); // 학생 이메일 저장
          loginStatus.setOnProfileImageReceived(
              roleResult['image'].toString()); // 프로필 이미지 저장
          loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장
          if (roleResult['school']) {
            // 학생인증을 예전에 완료했을 시,
            loginStatus.setIsStudent(roleResult['school']);
            userIsStudents();
          } else if (!roleResult['school']) {
            // 학생인증이 안되어있을 시,
            loginStatus.setIsStudent(roleResult['school']);
            userIsNotStudents();
          }
        } else {
          widget.isLoading(false);
          joinStatus.setIsFirstClickSNSLogin(true);
          widget.onLoginResult(false);
        }
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          widget.isLoading(false);
          joinStatus.setIsFirstClickSNSLogin(true);
          widget.onLoginResult(false);
          return;
        }
        try {
          token = await UserApi.instance.loginWithKakaoAccount();

          var result = await snsLogin('KAKAO', token.accessToken);
          await Future.delayed(const Duration(seconds: 2));

          if (result['status'] == 'success') {
            loginStatus.setloginStatus(true);

            var roleResult = await patchRoleSendSever(); // 프로필 조회
            loginStatus.setStudentEmail(
                roleResult['userEmail'].toString()); // 학생 이메일 저장
            loginStatus.setOnProfileImageReceived(
                roleResult['image'].toString()); // 프로필 이미지 저장
            loginStatus.setBasketCount(roleResult['basketCount']); // 장바구니 개수 저장
            if (roleResult['school']) {
              // 학생인증을 예전에 완료했을 시,
              loginStatus.setIsStudent(roleResult['school']);
              userIsStudents();
            } else if (!roleResult['school']) {
              // 학생인증이 안되어있을 시,
              loginStatus.setIsStudent(roleResult['school']);
              userIsNotStudents();
            }
          } else {
            widget.isLoading(false);
            joinStatus.setIsFirstClickSNSLogin(true);
            widget.onLoginResult(false);
          }
        } catch (error) {
          widget.isLoading(false);
          joinStatus.setIsFirstClickSNSLogin(true);
          widget.onLoginResult(false);
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();

        var result = await snsLogin('KAKAO', token.accessToken);
        await Future.delayed(const Duration(seconds: 2));
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
            userIsStudents();
          } else if (!roleResult['school']) {
            // 학생인증이 안되어있을 시,
            loginStatus.setIsStudent(roleResult['school']);
            userIsNotStudents();
          }
        } else {
          widget.isLoading(false);
          joinStatus.setIsFirstClickSNSLogin(true);
          widget.onLoginResult(false);
        }
      } catch (error) {
        widget.isLoading(false);
        joinStatus.setIsFirstClickSNSLogin(true);
        widget.onLoginResult(false);
      }
    }
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

  // 학생인증을 하지 않았을 때,
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
      onPressed: signInWithKakao,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/kakao_login_medium_narrow.png',
        ),
      ),
    );
  }
}
