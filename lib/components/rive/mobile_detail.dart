import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MobileDetailRive extends StatefulWidget {
  final bool isStartAni;
  const MobileDetailRive({super.key, required this.isStartAni});

  @override
  State<MobileDetailRive> createState() => _MobileDetailRiveState();
}

class _MobileDetailRiveState extends State<MobileDetailRive> {
  StateMachineController? _controller;
  SMITrigger? _startAniTrigger;
  bool _hasStarted = false;

  void _onRiveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );

    if (_controller != null) {
      artboard.addController(_controller!);
      _startAniTrigger = _controller!.findSMI<SMITrigger>('Trigger 1');
    }
  }

  void _startAni() async {
    if (_hasStarted) return;

    _startAniTrigger?.fire();
    _hasStarted = true;
  }

  @override
  void didUpdateWidget(covariant MobileDetailRive oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isStartAni != widget.isStartAni && !_hasStarted) {
      _startAni();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/mobile_detail.riv',
      artboard: 'Artboard',
      stateMachines: const ['State Machine 1'],
      onInit: _onRiveInit,
      antialiasing: true,
      isTouchScrollEnabled: true,
    );
  }
}
