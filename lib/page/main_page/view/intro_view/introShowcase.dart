import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';

import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/loading_message.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/text_animation.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/wave_animation.dart';

class Introshowcase extends StatefulWidget {
  final MainPageState state;

  final void Function(TickerProvider vsync) initializeAnimations;

  const Introshowcase({
    super.key,
    required this.state,
    required this.initializeAnimations,
  });

  @override
  State<Introshowcase> createState() => _IntroshowcaseState();
}

class _IntroshowcaseState extends State<Introshowcase> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: ProfileConditions.isProfileViewActive(widget.state) ? 0 : 1,
          child: const Waves(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 100,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity:
                ProfileConditions.isProfileViewActive(widget.state) ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: TextAnimation(
              state: widget.state,
              initializeAnimations: widget.initializeAnimations,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: ProfileConditions.isProfileViewActive(widget.state) ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: Center(
            child: LoadingMessage(
              state: widget.state,
            ),
          ),
        ),
        Positioned(
          bottom: 100.sh,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity:
                ProfileConditions.isProfileViewActive(widget.state) ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.sh),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: ScrollRive(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
