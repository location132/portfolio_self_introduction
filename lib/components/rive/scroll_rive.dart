import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ScrollRive extends StatefulWidget {
  const ScrollRive({super.key});

  @override
  State<ScrollRive> createState() => _ScrollRiveState();
}

class _ScrollRiveState extends State<ScrollRive> {
  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/scroll-techconecta.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
    );
  }
}
