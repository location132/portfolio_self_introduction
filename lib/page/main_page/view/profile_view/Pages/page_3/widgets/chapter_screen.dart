import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class ChapterScreen extends StatefulWidget {
  final int scrollCount;

  const ChapterScreen({
    super.key,
    required this.scrollCount,
  });

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen>
    with TickerProviderStateMixin {
  late final AnimationController _backdropController;
  late final Animation<double> _backdropOpacity;
  late final Animation<double> _backdropBlur;
  late final AnimationController _contentController;
  late final Animation<double> _textOpacity;
  late final Animation<Offset> _textSlide;
  late final Animation<double> _buttonOpacity;
  late final Animation<Offset> _buttonSlide;

  //-- 챕터마다 변경되는 변수
  String chapterNumber = ProfilePage1Constants.chapter1;
  String chapterTitle = ' ${ProfilePage1Constants.chapter1Title}';
  String chapterContent =
      '\n\n이번 챕터에서는\n각종 세미나와 컨퍼런스에 참여한 이유를\n확인하실 수 있습니다.\n\n세 가지로 구성된 작은 이야기는\n제가 꿈꾸던 목표와 느낀점을 공유할 수\n있도록 구셩한 챕터입니다.';
  String chapterImage = 'assets/images/screen_2.jpeg';
  /*
  // 챕터 2 내용
  'assets/images/phone_screen.webp',
  ProfilePage1Constants.chapter2
  가장 큰 성장이 이루어졌던 대학생활\n\n
  대학 시절 제가 겪은 경험과 정체기 그리고 극복에 관한 이야기를 확인하실 수 있습니다.\n\n 세 가지로 구성된 작은 이야기는 앞으로의 성장 가능성을 확인하실 수 있도록 구성한 챕터입니다.
 */
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
  void didUpdateWidget(covariant ChapterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scrollCount == 3) {
      _backdropController.forward();
      _contentController.forward();
    } else if (widget.scrollCount == 4 || widget.scrollCount == 2) {
      _backdropController.reverse();
      _contentController.reverse();
    }

    // TODO: 스크롤 번호 변경 예정
    if (widget.scrollCount == 6) {
      _backdropController.forward();
      _contentController.forward();
    } else if (widget.scrollCount == 7) {
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
    return AnimatedOpacity(
      opacity: widget.scrollCount == 6 ||
              widget.scrollCount == 2 ||
              widget.scrollCount == 3
          ? 1.0
          : 0.0,
      duration: const Duration(milliseconds: 720),
      child: Stack(
        children: [
          SizedBox(
            height: 750,
            child: Image.asset(
              chapterImage,
              fit: BoxFit.cover,
            ),
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
                        Color.fromRGBO(0, 0, 0, _backdropOpacity.value * 0.4),
                        Color.fromRGBO(0, 0, 0, _backdropOpacity.value * 0.7),
                      ],
                    ),
                  ),
                  child: child,
                ),
              );
            },
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    FadeTransition(
                      opacity: _textOpacity,
                      child: SlideTransition(
                        position: _textSlide,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                chapterNumber,
                                style: GoogleFonts.dancingScript(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                chapterTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              chapterContent,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
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
                                  backgroundColor: const Color(0xFFFDF6EC),
                                  foregroundColor: const Color(0xFF5D4037),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
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
    );
  }
}
