import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MySkillRive extends StatelessWidget {
  const MySkillRive({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/my_sktll.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
    );
  }
}
