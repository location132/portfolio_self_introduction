import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_introduction_flutter/%08core_service/provider.dart';
import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_loading_detail/ide_loading_screen.dart';

class IdeScreen extends StatefulWidget {
  const IdeScreen({super.key});

  @override
  State<IdeScreen> createState() => _IdeScreenState();
}

class _IdeScreenState extends State<IdeScreen> {
  bool _iscolorChenge = true; // 컨테이너 색
  double _opacity = 1.0;
  bool _isVisible = true;
  double _xOffset = 0.0;
  bool _aniStart = false;

  void _fadeOut() {
    setState(() {
      _opacity = 0.0;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isVisible = false;
        _iscolorChenge = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        // 왼쪽으로 이동
        _isVisible = true;
        _opacity = 1.0;
        _xOffset = -280;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // 애니메이션 시작
        _aniStart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenChange = Provider.of<ScreenChange>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 140, left: 25),
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        child: Transform.translate(
          offset: Offset(_xOffset, 0),
          child: Container(
            height: 750,
            width: 450,
            decoration: BoxDecoration(
              color: _iscolorChenge
                  ? Colors.transparent
                  : Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(59),
            ),
            child: Visibility(
              visible: _isVisible,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    !_aniStart
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 140),
                              const Text(
                                '안녕하세요\n\nFlutter를 공부하며 앱과 웹을 공부하는 이정원입니다.\n지금부터 flutter로 만들어진 웹사이트와 다양한 앱 프로젝트\n그리고 제가 가진 모든 경험을 시각적으로 표현해보겠습니다.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(left: 240),
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: TextButton(
                                    style: TextButton.styleFrom(),
                                    onPressed: () {
                                      _fadeOut();
                                      screenChange.setChangeScreen(true);
                                    },
                                    child: const Text(
                                      'start reading',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(width: 390, child: IdeLoadingScreen()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
