import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class BannerRive extends StatelessWidget {
  final MainPageState? state;
  const BannerRive({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state?.startViewScrollStatus == StartViewScrollStatus.scrolled
        ? const RiveAnimation.asset(
            'assets/rive/rive_banner.riv',
            artboard: 'Artboard',
            stateMachines: ['State Machine 1'],
          )
        : const SizedBox();
  }
}
