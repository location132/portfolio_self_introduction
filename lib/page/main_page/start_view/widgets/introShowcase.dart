import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/start_view/widgets/animation/text_animation.dart';
import 'package:self_introduction_flutter/page/main_page/start_view/widgets/animation/wave_animation.dart';

class Introshowcase extends StatelessWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync) initializeAnimations;

  const Introshowcase({
    super.key,
    required this.state,
    required this.initializeAnimations,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Waves(),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 50,
          left: 0,
          right: 0,
          child: TextAnimation(
            state: state,
            initializeAnimations: initializeAnimations,
          ),
        ),
        Positioned(
          bottom: 30.sh,
          left: 0,
          right: 0,
          child: const SizedBox(
            height: 50,
            width: 50,
            child: ScrollRive(),
          ),
        ),
      ],
    );
  }
}
