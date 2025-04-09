import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AirBubble extends StatefulWidget {
  const AirBubble({super.key});

  @override
  State<AirBubble> createState() => _AirBubbleState();
}

class _AirBubbleState extends State<AirBubble> {
  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/air_bubble5.riv',
      artboard: 'Air',
      stateMachines: ['State Machine 1'],
      antialiasing: true,
      isTouchScrollEnabled: true,
    );
  }
}
