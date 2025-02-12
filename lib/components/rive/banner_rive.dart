import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BannerRive extends StatefulWidget {
  const BannerRive({super.key});

  @override
  State<BannerRive> createState() => _BannerRiveState();
}

class _BannerRiveState extends State<BannerRive> {
  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/rive/rive_banner.riv',
      artboard: 'Artboard',
      stateMachines: ['State Machine 1'],
    );
  }
}
