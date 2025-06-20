import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class MyPageSetting extends StatefulWidget {
  const MyPageSetting({super.key});

  @override
  State<MyPageSetting> createState() => _MyPageSettingState();
}

class _MyPageSettingState extends State<MyPageSetting> {
  bool isAlarmEnabled = true;
  bool isAdAlarmEnabled = true;
  bool isCommunityAlarmEnabled = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: '설정'),
                    SizedBox(
                      height: screenHeight * 0.092,
                      child: const Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '어플 버전',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard'),
                              ),
                              Text(
                                '1.0.1.329',
                                style: TextStyle(
                                    color: Color(0xffbdbdbd),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.012,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: SizedBox(
                  height: screenHeight * 0.049,
                  child: const Row(
                    children: [
                      Text(
                        '알림 설정',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Pretendard'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: SizedBox(
                  height: screenHeight * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PUSH 알람설정',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Pretendard'),
                      ),
                      CupertinoSwitch(
                        value: isAlarmEnabled,
                        activeColor: CupertinoColors.activeGreen,
                        onChanged: (bool? value) {
                          setState(() {
                            isAlarmEnabled = value ?? false;
                            if (isAlarmEnabled) {
                              isAdAlarmEnabled = true;
                              isCommunityAlarmEnabled = true;
                            } else {
                              isAdAlarmEnabled = false;
                              isCommunityAlarmEnabled = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: SizedBox(
                  height: screenHeight * 0.112,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '이벤트 및 광고성 알림',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'Pretendard'),
                          ),
                          SizedBox(height: screenHeight * 0.011),
                          const Text(
                            '할인과 혜택에 관련된 모든 이벤트와\n 광고성 알람을 차단합니다.',
                            style: TextStyle(
                                color: Color(0xffbdbdbd),
                                fontSize: 12,
                                fontFamily: 'Pretendard'),
                          ),
                        ],
                      ),
                      CupertinoSwitch(
                        value: isAdAlarmEnabled,
                        activeColor: CupertinoColors.activeGreen,
                        onChanged: (bool? value) {
                          setState(() {
                            isAdAlarmEnabled = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: SizedBox(
                  height: screenHeight * 0.118,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '커뮤니티 알림',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: 'Pretendard'),
                          ),
                          SizedBox(height: screenHeight * 0.011),
                          const Text(
                            '내가 쓴 리뷰와 요청글, 또는 좋아요 및 댓글 등\n모든 커뮤니티 관련 알람을 차단합니다.',
                            style: TextStyle(
                                color: Color(0xffbdbdbd),
                                fontSize: 12,
                                fontFamily: 'Pretendard'),
                          )
                        ],
                      ),
                      CupertinoSwitch(
                        value: isCommunityAlarmEnabled,
                        activeColor: CupertinoColors.activeGreen,
                        onChanged: (bool? value) {
                          setState(() {
                            isCommunityAlarmEnabled = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.012,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: SizedBox(
                  height: screenHeight * 0.049,
                  child: const Row(
                    children: [
                      Text(
                        '정책 및 약관',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Pretendard'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              customSetting(screenWidth, screenHeight, '서비스 이용약관'),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              customSetting(screenWidth, screenHeight, '위치기반 서비스 이용약관'),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              customSetting(screenWidth, screenHeight, '전자금융거래 약관'),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
              customSetting(screenWidth, screenHeight, '개인정보취급방침'),
              Container(
                height: screenHeight * 0.001,
                decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customSetting(double screenWidth, double screenHeight, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
      child: SizedBox(
        height: screenHeight * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Pretendard'),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
