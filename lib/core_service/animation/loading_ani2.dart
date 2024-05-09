import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart'; // Rive 패키지를 임포트합니다.

class RiveAniLoding extends StatefulWidget {
  const RiveAniLoding({super.key});

  @override
  State<RiveAniLoding> createState() => _RiveAniLodingState();
}

class _RiveAniLodingState extends State<RiveAniLoding> {
  // Rive 애니메이션 컨트롤러를 위한 변수 (선택적)
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러 초기화 (자동 재생을 위함)
    _controller = SimpleAnimation('Loading');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: RiveAnimation.asset(
        'assets/rive/loading.riv', // 애니메이션 파일 경로
        controllers: [_controller], // 애니메이션 컨트롤러 추가
      ),
    );
  }

  @override
  void dispose() {
    // 위젯이 종료될 때 컨트롤러도 정리
    _controller.dispose();
    super.dispose();
  }
}
