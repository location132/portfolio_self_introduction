//다이어 로그
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class ResendEmail extends StatefulWidget {
  const ResendEmail({super.key});
  @override
  State<ResendEmail> createState() => _ResendEmailState();
}

class _ResendEmailState extends State<ResendEmail> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final emailStatus = Provider.of<JoinModel>(context, listen: false);

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
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xffc1c1c1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.04),
                      const Text(
                        '인증번호 전송 오류',
                        style: TextStyle(
                          color: Color(0xff111111),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.024),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color(0xff5b5b5b),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            height: 1.2,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: '현재 입력하신 이메일 주소는\n'),
                            TextSpan(
                              text: emailStatus.isUserEmail,
                              style: const TextStyle(
                                color: Color(0xff6fbf8a), // 이메일 주소 부분의 색상
                              ),
                            ),
                            const TextSpan(
                                text: ' 입니다.\n메일을 받지 못하셨다면 아래의 다른 방법을 확인해주세요!'),
                          ],
                        ),
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
                            onPressed: () {
                              Navigator.pop(context);
                              emailStatus.setRetypeEmail(true);
                              emailStatus.setEmailStatus(false);
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
                                      '이메일 다시 입력하기',
                                      textAlign:
                                          TextAlign.center, // 텍스트를 가운데 정렬
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 12,
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
                                      '인증번호 재전송',
                                      textAlign:
                                          TextAlign.center, // 텍스트를 가운데 정렬
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 12,
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
                                      textAlign:
                                          TextAlign.center, // 텍스트를 가운데 정렬
                                      style: TextStyle(
                                        color: Color(0xff393939),
                                        fontSize: 12,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
