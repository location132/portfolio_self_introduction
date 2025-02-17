import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BannerRive extends StatelessWidget {
  const BannerRive({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/rive_banner.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
    );
  }
}
