import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/animation/intro_ani.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/bottom_message.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/loading_message.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/text_animation.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/intro_view/widget/wave_animation.dart';

class Introshowcase extends StatefulWidget {
  final DesktopState state;
  final DesktopCubit cubit;
  final bool isChromeBrowser;

  const Introshowcase({
    super.key,
    required this.state,
    required this.cubit,
    required this.isChromeBrowser,
  });

  @override
  State<Introshowcase> createState() => _IntroshowcaseState();
}

class _IntroshowcaseState extends State<Introshowcase> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 물결 wave
        AnimatedOpacity(
          duration: const Duration(milliseconds: 720),
          opacity: Conditions.isInitStateLoaded(widget.state) ? 0 : 1,
          child: const Waves(deviceType: 'desktop'),
        ),
        // 텍스트 애니메이션
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 100,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: Conditions.isInitStateLoaded(widget.state) ? 0 : 1,
            duration: const Duration(milliseconds: 720),
            child: TextAnimation(
              state: widget.state,
              initializeAnimations:
                  IntroAnimation(
                    state: widget.state,
                    cubit: widget.cubit,
                  ).awaitDuration,
            ),
          ),
        ),
        // 로딩 메시지
        AnimatedOpacity(
          opacity: widget.state.initModel.initState == InitState.active ? 1 : 0,
          duration: const Duration(milliseconds: 720),
          child: Center(
            child: LoadingMessage(
              isChromeBrowser: widget.isChromeBrowser,
              isChromeBrowserWithCubit: widget.cubit.isChromeBrowser,
            ),
          ),
        ),
        // 브라우저 환경에 따른 애니메이션
        Positioned(
          bottom: 100.sh,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: Conditions.isInitStateLoaded(widget.state) ? 0 : 1,
            duration: const Duration(milliseconds: 720),
            child: BottomMessage(isChromeBrowser: widget.isChromeBrowser),
          ),
        ),
      ],
    );
  }
}
/*
 initializeAnimations:
                  IntroAnimation(
                    state: widget.state,
                    cubit: widget.cubit,
                  ).awaitDuration,
 */