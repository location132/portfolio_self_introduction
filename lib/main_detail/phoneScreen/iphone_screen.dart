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
  bool _isStartScreen = false;
  double _opacity = 0.0;
  double _opacityAni = 1.0;
  final String _myName = 'FLUTTER     이정원';
  String _displayedText = "";
  final int _delayMilliseconds = 100;
  double cornerRadius = 67.4333;
  double cornerRadius1 = 60.4333;

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
    double screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1500),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight * 0.9,
                width: screenHeight * 0.43,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenHeight * 0.054)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.009),
                  child: SizedBox(
                    height: screenHeight * 0.87,
                    width: screenHeight * 0.416,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/Images/bg.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenHeight * 0.0483)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: screenHeight * 0.017),
                                child: Container(
                                  height: screenHeight * 0.03,
                                  width: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: screenHeight * 0.27),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        children: [
                                          TextSpan(
                                            text: 'self',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenHeight * 0.032,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '-introduction',
                                            style: TextStyle(
                                              fontSize: screenHeight * 0.032,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '.',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenHeight * 0.032,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text(
                                          _displayedText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: screenHeight * 0.017,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      AnimatedOpacity(
                                        opacity: _opacityAni,
                                        duration: const Duration(seconds: 1),
                                        child: SizedBox(
                                            height: screenWidth * 0.03,
                                            child: const RiveAniwrite()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(height: screenHeight * 0.43),
                                          Container(
                                            height: screenHeight * 0.04,
                                            width: screenHeight * 0.19,
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
                                              child: Padding(
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
                                                        fontSize: screenHeight *
                                                            0.015,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size:
                                                          screenHeight * 0.025,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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