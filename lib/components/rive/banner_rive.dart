import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BannerRive extends StatefulWidget {
  final Function(String) onStateChange;
  const BannerRive({super.key, required this.onStateChange});

  @override
  State<BannerRive> createState() => _BannerRiveState();
}

class _BannerRiveState extends State<BannerRive> {
  late StateMachineController? _controller;

  void _onRiveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
      onStateChange: _onStateChange,
    );

    if (_controller != null) {
      artboard.addController(_controller!);
    }
  }

  void _onStateChange(String stateMachineName, String stateName) {
    widget.onStateChange(stateName);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      'assets/rive/banner.riv',
      artboard: 'Artboard',
      stateMachines: const ['State Machine 1'],
      onInit: _onRiveInit,
    );
  }
}
