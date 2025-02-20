import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/start_view/widgets/text_animation.dart';
import 'package:self_introduction_flutter/page/start_view/widgets/wave_animation.dart';

class StartView extends StatelessWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync) initializeAnimations;
  final void Function() toggleFullScreen;

  const StartView({
    super.key,
    required this.state,
    required this.initializeAnimations,
    required this.toggleFullScreen,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Waves(),
          Padding(
            padding: EdgeInsets.only(top: 15.sh),
            child: const TopNavBar(),
          ),
          Positioned(
            top: 15.sh,
            right: 20.sw,
            child: IconButton(
              icon: const Icon(
                Icons.fullscreen,
                color: Colors.black,
                size: 30,
              ),
              onPressed: toggleFullScreen,
            ),
          ),
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
      ),
    );
  }
}
