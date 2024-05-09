import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart'; // Rive 패키지를 임포트합니다.

class RiveAniwrite extends StatefulWidget {
  const RiveAniwrite({super.key});

  @override
  State<RiveAniwrite> createState() => _RiveAniwriteState();
}

class _RiveAniwriteState extends State<RiveAniwrite> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('Animation 1');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: RiveAnimation.asset(
        'assets/rive/new_file.riv', // 애니메이션 파일 경로
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
