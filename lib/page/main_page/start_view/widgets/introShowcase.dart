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
        // 내 소개 카드
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 20,
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80),
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(260),
              ),
            ),
            height: 650,
            width: 360,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 30),
                const Text(
                  '이정원',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '  Lee  JungWon  ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------

        // const Waves(),
        // Positioned(
        //   top: MediaQuery.of(context).size.height / 2 - 50,
        //   left: 0,
        //   right: 0,
        //   child: TextAnimation(
        //     state: state,
        //     initializeAnimations: initializeAnimations,
        //   ),
        // ),
        // Positioned(
        //   bottom: 30.sh,
        //   left: 0,
        //   right: 0,
        //   child: const SizedBox(
        //     height: 50,
        //     width: 50,
        //     child: ScrollRive(),
        //   ),
        // ),
      ],
    );
  }
}
