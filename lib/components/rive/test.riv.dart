import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TestRiv extends StatefulWidget {
  const TestRiv({super.key});

  @override
  State<TestRiv> createState() => _TestRivState();
}

class _TestRivState extends State<TestRiv> {
  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/untitled.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
      antialiasing: true,
      isTouchScrollEnabled: true,
    );
  }
}
