import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';

class IntroAnimation {
  final DesktopState state;
  final DesktopCubit cubit;

  IntroAnimation({required this.state, required this.cubit});

  void awaitDuration(
    TickerProvider vsync, {
    String message = TextConstants.welcomeMessage1,
  }) async {
    //TODO: 추 후, 주석 해제
    await Future.delayed(Duration(seconds: state.initModel.remainingTime));

    initializeAnimations(vsync, message: message);
  }

  // text 애니메이션 시작
  Future<void> initializeAnimations(
    TickerProvider vsync, {
    String message = TextConstants.welcomeMessage1,
  }) async {
    if (cubit.isClosed) return;

    final List<String> characters = [];

    for (int i = 0; i < message.length; i++) {
      characters.add(message[i]);
    }

    cubit.textAnimation(characters);

    List<AnimationController> newControllers = [];
    List<Animation<double>> newAnimations = [];

    for (int i = 0; i < cubit.state.startAnimation!.words.length; i++) {
      final controller = AnimationController(
        vsync: vsync,
        duration: const Duration(milliseconds: 820),
      );

      final animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      );

      newControllers.add(controller);
      newAnimations.add(animation);

      Future.delayed(Duration(milliseconds: i * 25), () {
        if (!cubit.isClosed && controller.isAnimating == false) {
          controller.forward();
        }
      });
    }

    if (!cubit.isClosed &&
        newControllers.isNotEmpty &&
        newAnimations.isNotEmpty) {
      cubit.textAnimationController(newControllers, newAnimations);
    }

    if (message == TextConstants.welcomeMessage1) {
      await endAnimations(
        vsync,
        TextConstants.welcomeMessage2,
        const Duration(milliseconds: 4500),
      );
    } else {
      await endAnimations(
        vsync,
        TextConstants.welcomeMessage1,
        const Duration(milliseconds: 5500),
      );
    }
  }

  // text애니메이션 종료
  Future<void> endAnimations(
    TickerProvider vsync,
    String message,
    Duration duration,
  ) async {
    if (cubit.isClosed) return;

    await Future.delayed(duration);

    if (!cubit.isClosed && cubit.state.startAnimation != null) {
      for (var controller in cubit.state.startAnimation!.controllers) {
        try {
          controller.reverse();
        } catch (e) {
          print('Controller already disposed: $e');
        }
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    if (!cubit.isClosed) {
      initializeAnimations(vsync, message: message);
    }
  }
}
