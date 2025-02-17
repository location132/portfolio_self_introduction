import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AirRive extends StatelessWidget {
  const AirRive({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/air.riv',
      artboard: 'Air',
      stateMachines: ['State Machine 1'],
    );
  }
}
