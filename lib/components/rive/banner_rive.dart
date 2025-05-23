import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BannerRive extends StatefulWidget {
  final bool isStartAni;
  const BannerRive({super.key, required this.isStartAni});

  @override
  State<BannerRive> createState() => _BannerRiveState();
}

class _BannerRiveState extends State<BannerRive> {
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
    if (_startAniTrigger == null) {
      await Future.delayed(const Duration(seconds: 1));
      return _startAni();
    }

    _startAniTrigger?.fire();
    _hasStarted = true;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isStartAni && !_hasStarted) {
      _startAni();
    }
    return RiveAnimation.asset(
      'assets/rive/rive_banner.riv',
      artboard: 'Artboard',
      stateMachines: const ['State Machine 1'],
      onInit: _onRiveInit,
      antialiasing: true,
      isTouchScrollEnabled: true,
    );
  }
}
