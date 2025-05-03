import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class IntroPhoneScreen extends StatefulWidget {
  final MainPageState state;
  const IntroPhoneScreen({super.key, required this.state});

  @override
  State<IntroPhoneScreen> createState() => _IntroPhoneScreenState();
}

class _IntroPhoneScreenState extends State<IntroPhoneScreen>
    with TickerProviderStateMixin {
  late final AnimationController _backdropController;
  late final Animation<double> _backdropOpacity;
  late final Animation<double> _backdropBlur;
  late final AnimationController _contentController;
  late final Animation<double> _textOpacity;
  late final Animation<Offset> _textSlide;
  late final Animation<double> _buttonOpacity;
  late final Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();
    _backdropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _backdropOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _backdropController, curve: Curves.easeInOut),
    );
    _backdropBlur = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _backdropController, curve: Curves.easeInOut),
    );

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _contentController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );
    _textSlide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _contentController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );

    _buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _contentController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeOut)),
    );
    _buttonSlide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(
          parent: _contentController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeOut)),
    );
  }

  @override
  void didUpdateWidget(covariant IntroPhoneScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.profileModel.scrollCount == 2) {
      _backdropController.forward();
      _contentController.forward();
    } else if (widget.state.profileModel.scrollCount == 1) {
      _backdropController.reverse();
      _contentController.reverse();
    }
  }

  @override
  void dispose() {
    _backdropController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8,
            left: 5,
            right: 5,
            bottom: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/phone_screen.webp',
                    fit: BoxFit.cover,
                  ),
                  AnimatedBuilder(
                    animation: _backdropController,
                    builder: (context, child) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: _backdropBlur.value,
                          sigmaY: _backdropBlur.value,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(
                                    0, 0, 0, _backdropOpacity.value * 0.4),
                                Color.fromRGBO(
                                    0, 0, 0, _backdropOpacity.value * 0.7),
                              ],
                            ),
                          ),
                          child: child,
                        ),
                      );
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 50),
                            FadeTransition(
                              opacity: _textOpacity,
                              child: SlideTransition(
                                position: _textSlide,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        ProfilePage1Constants.chapter2,
                                        style: GoogleFonts.dancingScript(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    const Text(
                                      '가장 큰 성장이 이루어졌던 대학생활\n\n',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 13),
                                    const Text(
                                      '대학 시절 제가 겪은 경험과 정체기 그리고 극복에 관한 이야기를 확인하실 수 있습니다.\n\n 세 가지로 구성된 작은 이야기는 앞으로의 성장 가능성을 확인하실 수 있도록 구성한 챕터입니다.',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 130),
                            FadeTransition(
                              opacity: _buttonOpacity,
                              child: SlideTransition(
                                position: _buttonSlide,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 220,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFDF6EC),
                                          foregroundColor:
                                              const Color(0xFF5D4037),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: const Text(
                                          '이어서 보기',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF5D4037),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        '다음에 보기',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
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
                ],
              ),
            ),
          ),
          Image.asset('assets/images/profile_card.png'),
        ],
      ),
    );
  }
}
