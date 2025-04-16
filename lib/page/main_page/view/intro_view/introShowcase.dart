import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/components/rive/air_bubble.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/loading_message.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/text_animation.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/widget/wave_animation.dart';

class Introshowcase extends StatelessWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync) initializeAnimations;
  final void Function() onTapDescription;

  const Introshowcase({
    super.key,
    required this.state,
    required this.initializeAnimations,
    required this.onTapDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: ProfileConditions.isProfileViewActive(state) ? 0 : 1,
          child: const Waves(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 100,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: ProfileConditions.isProfileViewActive(state) ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: TextAnimation(
              state: state,
              initializeAnimations: initializeAnimations,
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: ProfileConditions.isProfileViewActive(state) ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: const Center(child: LoadingMessage()),
        ),
        Positioned(
          bottom: 100.sh,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: ProfileConditions.isIntroshowcaseActive(state) ? 1 : 0,
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
        Positioned(
          bottom: 100.sh,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: ProfileConditions.isProfileViewActive(state) ? 0 : 1,
            duration: const Duration(seconds: 1),
            child: GestureDetector(
              onTap: onTapDescription,
              child: const SizedBox(
                height: 150,
                width: 150,
                child: AirBubble(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
