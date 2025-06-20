import 'dart:ui';
import 'package:flutter/material.dart';

class EmailError extends StatefulWidget {
  const EmailError({super.key});

  @override
  State<EmailError> createState() => _EmailErrorState();
}

class _EmailErrorState extends State<EmailError> {
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
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.04),
                  const Text(
                    '이메일 전송 오류',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.024),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '이용에 불편을 끼치게 되어 대단히 죄송합니다.\n현재 서버에 예상치 못한 오류가 발생하였습니다.',
                          style: TextStyle(
                            color: Color(0xff5b5b5b),
                            fontSize: 13,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                        TextSpan(
                          text: '\n\n아래의 다른 방법을 통해 접속을 진행해주세요:)',
                          style: TextStyle(
                            color: Color(0xff6fbf8a),
                            fontSize: 13,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    textAlign: TextAlign.center, // 중앙 정렬 설정
                  ),

                  SizedBox(height: screenHeight * 0.022),
                  Container(
                    height: 1.5,
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  //이메일 다시 입력하기
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '학생증으로 인증하기',
                                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 13,
                                    fontFamily: 'PretendardSemiBold',
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xffc1c1c1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  // 인증번호 재전송
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (mounted) {
                            Navigator.pushNamed(context, '/MainScreen');
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '메인화면 둘러보기',
                                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 13,
                                    fontFamily: 'PretendardSemiBold',
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xffc1c1c1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  // 다른 방법으로 인증
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: SizedBox(
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xfff5f5f5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '이메일 재전송하기',
                                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 13,
                                    fontFamily: 'PretendardSemiBold',
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xffc1c1c1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
