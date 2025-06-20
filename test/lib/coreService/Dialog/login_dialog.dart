//로그인이 필요한 기능에 나오는 모달창//

/* 다이아 로그
1. 로그인 페이지로 이동하기
2. 뒤로가기
3. 로그인 완료되면 감지해서 모달창 종료
 */

/* 다이아 로그
1. 학생 인증 페이지로 이동하기
2. 뒤로가기
3. 학생 인증 완료되면 감지해서 모달창 종료
 */

/* 다이아 로그
1. 앱 업데이트 필요시 발생
2. 뒤로가기 불가능
3. 업데이트 필수
 */

import 'dart:ui';
import 'package:flutter/material.dart';

enum LoginDialogType {
  login,
  studentAuth,
  update,
}

class DialogContent {
  final String message;
  final String buttonText;
  final String routeName;

  const DialogContent({
    required this.message,
    required this.buttonText,
    required this.routeName,
  });
}

class LoginDialogConfig {
  static final Map<LoginDialogType, DialogContent> contents = {
    LoginDialogType.login: const DialogContent(
      message: '로그인이 필요한 기능입니다.\n로그인 후 이용해주세요:)',
      buttonText: '로그인하러 가기',
      routeName: '/LoginPage',
    ),
    LoginDialogType.studentAuth: const DialogContent(
      message: '학생인증이 필요한 기능입니다.\n인증 후 이용해주세요:)',
      buttonText: '학생인증하러 가기',
      routeName: '/StudentIdentityCheck',
    ),
    LoginDialogType.update: const DialogContent(
      message: '원활한 어플 사용을 위해\n최신 버전으로 업데이트 해주세요:)',
      buttonText: '업데이트하러 가기',
      routeName: '',
    ),
  };
}

// Dialog, 유저 미로그인상태, 로그인 필요한 페이지 접근 시도시 발생(noti, cart)
void showLoginDialog(BuildContext context, LoginDialogType type) {
  showDialog(
    context: context,
    barrierDismissible: type != LoginDialogType.update, // 업데이트 다이얼로그는 뒤로가기 불가
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return LoginDialog(type: type);
    },
  );
}

class LoginDialog extends StatefulWidget {
  final LoginDialogType type;
  const LoginDialog({super.key, required this.type});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> with WidgetsBindingObserver {
  late final DialogContent content;

  @override
  void initState() {
    super.initState();
    content = LoginDialogConfig.contents[widget.type]!;
    if (widget.type != LoginDialogType.update) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    if (widget.type != LoginDialogType.update) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                alignment: Alignment.topRight,
                children: [
                  if (widget.type != LoginDialogType.update)
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xffc1c1c1),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.047),
                      Text(
                        content.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xff5b5b5b),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (widget.type == LoginDialogType.update) {
                              // TODO: 스토어로 이동하는 로직 구현
                            } else {
                              Navigator.pushReplacementNamed(
                                context,
                                content.routeName,
                              );
                            }
                          },
                          child: Container(
                            height: screenHeight * 0.047,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff6fbf8a),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                content.buttonText,
                                style: const TextStyle(
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
                      SizedBox(height: screenHeight * 0.024),
                    ],
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
