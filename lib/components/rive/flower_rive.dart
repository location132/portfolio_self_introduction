import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FlowerRive extends StatelessWidget {
  const FlowerRive({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/plantgame_closeup.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
    );
  }
}
