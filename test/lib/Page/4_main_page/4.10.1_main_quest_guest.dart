import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class QuestForGuest extends StatefulWidget {
  const QuestForGuest({super.key});

  @override
  State<QuestForGuest> createState() => _QuestForGuestState();
}

class _QuestForGuestState extends State<QuestForGuest> {
  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final secondScreenHeight = screenHeight * 0.2465;
    final secondScreenWidth = screenWidth - screenWidth * 0.082;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '진행 중인 퀘스트',
                style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              const Spacer(),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (!loginStatus.loginStatus) {
                    showLoginDialog(context, LoginDialogType.login);
                  } else if (!loginStatus.isStudent) {
                    showLoginDialog(context, LoginDialogType.studentAuth);
                  }
                },
                child: const Row(
                  children: [
                    Text(
                      '전체보기',
                      style: TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xff8e8e8e),
                      size: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: screenWidth * 0.585,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: secondScreenHeight * 0.081),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: secondScreenHeight * 0.08,
                              child: const Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '[30단계]',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 잎사이 30일 출석하기',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    size: 24,
                                    color: Color(0xff8e8e8e),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: secondScreenWidth * 0.776,
                                  height: secondScreenHeight * 0.038,
                                  child: LinearProgressIndicator(
                                    color: const Color(0xff6fbf8a),
                                    backgroundColor: const Color(0xffeeeeee),
                                    value: 0,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '29/30',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16.5,
                          ),
                          const Divider(
                            height: 1,
                            color: Color(0xfff5f5f5),
                          ),
                          const SizedBox(
                            height: 18.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: secondScreenHeight * 0.08,
                              child: const Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '[5단계]',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 잎사이 할인쿠폰 5번 사용하기',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    size: 24,
                                    color: Color(0xff8e8e8e),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: secondScreenWidth * 0.776,
                                  height: secondScreenHeight * 0.038,
                                  child: LinearProgressIndicator(
                                    color: const Color(0xff6fbf8a),
                                    backgroundColor: const Color(0xffeeeeee),
                                    value: 0,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '1/5',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16.5,
                          ),
                          const Divider(
                            height: 1,
                            color: Color(0xfff5f5f5),
                          ),
                          const SizedBox(
                            height: 18.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: secondScreenHeight * 0.08,
                              child: const Row(
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '[3단계]',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 리뷰 3번 쓰기',
                                          style: TextStyle(
                                            color: Color(0xff5b5b5b),
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    size: 24,
                                    color: Color(0xff8e8e8e),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: secondScreenWidth * 0.776,
                                  height: secondScreenHeight * 0.038,
                                  child: LinearProgressIndicator(
                                    color: const Color(0xff6fbf8a),
                                    backgroundColor: const Color(0xffeeeeee),
                                    value: 0,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '2/3',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildMessage(loginStatus),
                              const SizedBox(height: 5),
                              if (!loginStatus.loginStatus ||
                                  !loginStatus.isStudent)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    if (!loginStatus.loginStatus) {
                                      Navigator.pushNamed(
                                          context, '/LoginPage');
                                    } else {
                                      // 학생 인증 페이지로 이동하는 로직 추가
                                      // 예: Navigator.pushNamed(context, '/StudentVerificationPage');
                                    }
                                  },
                                  child: Text(
                                    !loginStatus.loginStatus
                                        ? '로그인하러가기'
                                        : '인증하러가기',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff6fbf8a),
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xff6fbf8a),
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildMessage(LoginModel loginStatus) {
  if (!loginStatus.loginStatus) {
    return const Text(
      '로그인 후 이용해주세요👀',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (!loginStatus.isStudent) {
    return const Text(
      '학생 인증 후 이용해주세요👀',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
    );
  }
  return const SizedBox.shrink();
}
