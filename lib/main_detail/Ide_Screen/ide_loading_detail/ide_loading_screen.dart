import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_introduction_flutter/%08core_service/animation/error_check_ani.dart';
import 'package:self_introduction_flutter/%08core_service/animation/loading_ani.dart';
import 'package:self_introduction_flutter/%08core_service/animation/loading_ani2.dart';
import 'package:self_introduction_flutter/%08core_service/provider.dart';

class IdeLoadingScreen extends StatefulWidget {
  IdeLoadingScreen({super.key});

  @override
  State<IdeLoadingScreen> createState() => _IdeLoadingScreenState();
}

class _IdeLoadingScreenState extends State<IdeLoadingScreen> {
  bool _isProceeding = true; // 로딩 바 애니메이션 진행중
  bool _isProceedingAni = true; // 로딩 인디 애니메이션 진행중
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
  bool _textAni28 = false;

  //===================================

  @override
  void initState() {
    super.initState();
    _scheduleAnimations();
  }

  void _scheduleAnimations() {
    final screenChange = Provider.of<ScreenChange>(context, listen: false);

    // 지연 시간 설정 및 해당 상태 업데이트
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) setState(() => _isProceeding = false);
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) setState(() => _isProceedingAni = false);
    });

    for (int i = 1; i <= 11; i++) {
      Future.delayed(Duration(milliseconds: 6100 + i * 110), () {
        if (mounted) setState(() => _setTextAniTrue1(i));
      });
    }

    for (int i = 12; i <= 21; i++) {
      Future.delayed(Duration(milliseconds: 6800 + i * 110), () {
        if (mounted) setState(() => _setTextAniTrue2(i));
      });
    }

    for (int i = 22; i <= 26; i++) {
      Future.delayed(Duration(milliseconds: 7500 + i * 110), () {
        if (mounted) {
          setState(() {
            _setTextAniTrue3(i);
          });
          if (i == 26) {
            screenChange.setStartScreen(true);
            Future.delayed(const Duration(seconds: 4), () {
              screenChange.setSuccessSimulator(true);
            });
            Future.delayed(const Duration(seconds: 6), () {
              setState(() {
                _textAni27 = true;
              });
            });

            Future.delayed(const Duration(seconds: 7), () {
              setState(() {
                _textAni28 = true;
              });
            });
          }
        }
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
    }
  }

  void _setTextAniTrue2(int index) {
    switch (index) {
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
    }
  }

  void _setTextAniTrue3(int index) {
    switch (index) {
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          Center(
            child: Text(
              'Loading Message',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.021,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03, right: screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    AnimatedOpacity(
                      opacity: _isProceedingAni ? 1.0 : 0.0,
                      duration: const Duration(seconds: 12),
                      child: const RiveAniLoding(),
                    ),
                    AnimatedOpacity(
                      opacity: _isProceeding ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: const LoadingBar(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                    top: 30),
                child: AnimatedOpacity(
                  opacity: !_textAni28 ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    children: [
                      Text(
                        '왼쪽의 시뮬레이터에 보이는 "start reading" 버튼\n또는, 아래의 시작하기 버튼을 클릭해주세요! ',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.012,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.1),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 15),
                                blurRadius: 30,
                                color: const Color(0xFF666666).withOpacity(.11))
                          ],
                        ),
                        child: Text(
                          "start reading",
                          style: TextStyle(
                              fontSize: screenWidth * 0.012,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: _textAni27 ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.03, right: screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.15),
                      AnimatedOpacity(
                        opacity: !_textAni1 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Text(
                          '안녕하세요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.014,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: !_textAni1 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          '\n',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Row(
                        children: [
                          AnimatedOpacity(
                            opacity: !_textAni2 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '저는 ',
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
                              '오른쪽에 위치한',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni4 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              ' 시뮬레이터 ',
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
                              '화면 설정을',
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
                              ' 도와주는',
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
                            opacity: !_textAni6 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              'Interactive ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 133, 222, 236),
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni7 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              'Simulator ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 133, 222, 236),
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni8 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '입니다.',
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
                              '  "시뮬이"',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 133, 222, 236),
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni10 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '라고 ',
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
                              '불러주세요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: !_textAni11 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          '\n',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Row(
                        children: [
                          AnimatedOpacity(
                            opacity: !_textAni12 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '저는 ',
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
                              '오른쪽 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni14 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '시뮬레이터의 ',
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
                              '전체 환경을 ',
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
                              '담당하며, ',
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
                            opacity: !_textAni17 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '다양한 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni18 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '방면에서 ',
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
                              '여러분을 ',
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
                              '지원할 ',
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
                              '예정입니다. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: !_textAni21 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          '\n',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      Row(
                        children: [
                          AnimatedOpacity(
                            opacity: !_textAni22 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '지금부터 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: !_textAni23 ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Text(
                              '시뮬레이터의 ',
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
                              '화면을 ',
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
                              '작동시켜 ',
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
                              '보겠습니다! ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.012,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: !_textAni1 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: const Text(
                          '\n\n',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: !_textAni25 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1000),
                        child: const RiveAniErrorCheck(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
