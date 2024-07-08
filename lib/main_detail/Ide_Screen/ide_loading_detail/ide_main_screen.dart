import 'package:flutter/material.dart';

class IdeMainScreen extends StatefulWidget {
  const IdeMainScreen({super.key});

  @override
  State<IdeMainScreen> createState() => _IdeMainScreenState();
}

class _IdeMainScreenState extends State<IdeMainScreen> {
  //===================================
  bool _textAni1 = false;
  bool _textAni2 = false;
  bool _textAni3 = false;
  bool _textAni4 = false;
  bool _textAni5 = false;
  bool _textAni6 = false;
  bool _textAni7 = false;
  bool _textAni8 = false;
  bool _textAni9 = false;
  bool _textAni10 = false;
  bool _textAni11 = false;
  bool _textAni12 = false;
  bool _textAni13 = false;
  bool _textAni14 = false;
  bool _textAni15 = false;
  bool _textAni16 = false;
  bool _textAni17 = false;
  bool _textAni18 = false;
  bool _textAni19 = false;
  bool _textAni20 = false;
  bool _textAni21 = false;
  bool _textAni22 = false;
  bool _textAni23 = false;
  bool _textAni24 = false;
  bool _textAni25 = false;

  bool _textAni26 = false;
  bool _textAni27 = false;

  @override
  void initState() {
    super.initState();
    _scheduleAnimations();
  }

  void _scheduleAnimations() {
    for (int i = 1; i <= 27; i++) {
      Future.delayed(Duration(milliseconds: 100 + i * 110), () {
        if (mounted) setState(() => _setTextAniTrue1(i));
      });
    }
  }

  void _setTextAniTrue1(int index) {
    switch (index) {
      case 1:
        _textAni1 = true;
        break;
      case 2:
        _textAni2 = true;
        break;
      case 3:
        _textAni3 = true;
        break;
      case 4:
        _textAni4 = true;
        break;
      case 5:
        _textAni5 = true;
        break;
      case 6:
        _textAni6 = true;
        break;
      case 7:
        _textAni7 = true;
        break;
      case 8:
        _textAni8 = true;
        break;
      case 9:
        _textAni9 = true;
        break;
      case 10:
        _textAni10 = true;
        break;
      case 11:
        _textAni11 = true;
        break;
      case 12:
        _textAni12 = true;
        break;
      case 13:
        _textAni13 = true;
        break;
      case 14:
        _textAni14 = true;
        break;
      case 15:
        _textAni15 = true;
        break;
      case 16:
        _textAni16 = true;
        break;
      case 17:
        _textAni17 = true;
        break;
      case 18:
        _textAni18 = true;
        break;
      case 19:
        _textAni19 = true;
        break;
      case 20:
        _textAni20 = true;
        break;
      case 21:
        _textAni21 = true;
        break;
      case 22:
        _textAni22 = true;
        break;
      case 23:
        _textAni23 = true;
        break;
      case 24:
        _textAni24 = true;
        break;
      case 25:
        _textAni25 = true;
        break;
      case 26:
        _textAni26 = true;
        break;
      case 27:
        _textAni27 = true;
        break;
    }
  }

  //===================================
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.1),
          Center(
            child: Text(
              'Interactive Simulator',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.021,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.03, right: screenWidth * 0.03),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni1 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '지금 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni2 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '보고계신 화면은 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni3 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '메인화면 입니다! ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni4 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '실제 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni5 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '시뮬레이터가 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni6 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '아닌 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni7 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '컨테이너로 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni8 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '구성된 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni9 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '화면이라 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni10 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        'PageView위젯, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni11 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        'ListBuilder를 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni12 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '사용하지 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni13 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '못했습니다. ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni14 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '점차 더 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni15 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '화면을 채워 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni16 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '성장하는 모습을 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni17 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '보여드리겠습니다! ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni18 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '관심있으신 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni19 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '내용이 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni20 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '있으시다면 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni21 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '시뮬레이터를 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni22 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '클릭하거나, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedOpacity(
                      opacity: !_textAni23 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '시뮬이 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni24 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '아래의 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni25 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '버튼을 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: !_textAni26 ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        '클릭해주세요! ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.08),
                AnimatedOpacity(
                  opacity: !_textAni27 ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 3000),
                  child: Column(
                    children: [
                      // 자소서
                      Row(
                        children: [
                          _textAni27
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "자기 소개서",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // 클랭 잎사이
                      Row(
                        children: [
                          _textAni27
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "클랭 프로젝트",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: screenHeight * 0.01),
                          _textAni27
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "잎사이 프로젝트",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: screenHeight * 0.01),
                          _textAni27
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "coming soon",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: screenHeight * 0.01),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      Row(
                        children: [
                          _textAni27
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Flutter 정리 페이지",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.012,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: screenHeight * 0.01),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
