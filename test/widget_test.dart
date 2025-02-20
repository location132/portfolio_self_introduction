import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AirBubble extends StatefulWidget {
  const AirBubble({super.key});

  @override
  State<AirBubble> createState() => _AirBubbleState();
}

class _AirBubbleState extends State<AirBubble> {
  late StateMachineController? _controller;
  bool _isInitialized = false; // 초기화 상태 추적을 위한 변수 추가

  void _onRiveInit(Artboard artboard) {
    if (_isInitialized) return; // 이미 초기화된 경우 중복 실행 방지

    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
      onStateChange: _onStateChange,
    );
    if (_controller != null) {
      artboard.addController(_controller!);
      _isInitialized = true; // 초기화 완료 표시
    }
  }

  void _onStateChange(String stateMachineName, String stateName) {
    if (stateName == 'End') {
      print('check ==> 실행1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/air_bubble.riv',
      artboard: 'Air',
      stateMachines: const ['State Machine 1'],
      onInit: _onRiveInit,
    );
  }
}
