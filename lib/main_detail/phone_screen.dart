import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_introduction_flutter/%08core_service/animation/write_ani.dart';
import 'package:self_introduction_flutter/%08core_service/provider.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  double _xOffset = 0.0;
  bool _isStartScreen = false;
  double _opacity = 0.0;
  double _opacityAni = 1.0;
  final String _myName = 'FLUTTER     이정원';
  String _displayedText = "";
  final int _delayMilliseconds = 100;

  void _animateText() async {
    for (int i = 0; i < _myName.length + 1; i++) {
      await Future.delayed(Duration(milliseconds: _delayMilliseconds));
      if (mounted) {
        setState(() {
          _displayedText = _myName.substring(0, i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenChange = Provider.of<ScreenChange>(context);

    if (screenChange.isFirstScreen) {
      setState(() {
        _xOffset = 280;
      });
    }
    if (screenChange.isStartSimulator) {
      if (!_isStartScreen) {
        setState(() {
          _isStartScreen = true;
          _opacity = 0.0;
        });
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _opacity = 1.0;
          });
        });
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _animateText();
          });
        });
        Future.delayed(const Duration(seconds: 6), () {
          setState(() {
            _opacityAni = 0.0;
          });
        });
      }
    }

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1), // 1초 동안 애니메이션 진행
          curve: Curves.easeOut, // 애니메이션 곡선을 지정
          transform: Matrix4.translationValues(_xOffset, 0, 0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Image.asset(
                  'assets/Images/ipone_15pro.png',
                  scale: 2,
                ),
              ),
              //시뮬레이터 크기
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 35),
                child: SizedBox(
                  height: 923,
                  width: 430,
                  child: _isStartScreen
                      ? AnimatedOpacity(
                          opacity: _opacity,
                          duration: const Duration(milliseconds: 1500),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Images/bg.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(59),
                                topRight: Radius.circular(59),
                                bottomLeft: Radius.circular(59),
                                bottomRight: Radius.circular(59),
                              ),
                            ),
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: _opacityAni,
                                  duration: const Duration(seconds: 1),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(top: 400, left: 380),
                                    child: RiveAniwrite(),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: SizedBox(
                                        height: 30,
                                        width: 120,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 310),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 130),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              children: const [
                                                TextSpan(
                                                  text: 'self',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text: '-introduction',
                                                ),
                                                TextSpan(
                                                  text: '.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          Text(
                                            _displayedText,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 310),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: SizedBox(
                                        height: 50,
                                        width: 240,
                                        child: Container(
                                          width: 10,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 10),
                                                blurRadius: 1,
                                                color: const Color.fromARGB(
                                                        255, 0, 0, 0)
                                                    .withOpacity(.31),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(80),
                                            gradient: const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color(0xffFFAE88),
                                                Color(0xff8F93EA)
                                              ],
                                            ),
                                          ),
                                          child: MaterialButton(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: const StadiumBorder(),
                                            onPressed: () {},
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    '   start   reading',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
