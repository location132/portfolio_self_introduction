import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'dart:html';

import 'package:self_introduction_flutter/page/main_page/main_state.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState(scrollController: ScrollController()));

  @postConstruct
  void init() async {
    emit(state.copyWith(status: MainPageStatus.loaded));
  }

  // 애니메이션 시작
  Future<void> initializeAnimations(TickerProvider vsync) async {
    final List<String> characters = [];
    for (int i = 0; i < TextConstants.welcomeMessage.length; i++) {
      characters.add(TextConstants.welcomeMessage[i]);
    }
    emit(state.copyWith(words: characters));

    List<AnimationController> newControllers = [];
    List<Animation<double>> newAnimations = [];

    for (int i = 0; i < state.words.length; i++) {
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
        controller.forward();
      });
    }
    emit(state.copyWith(
      controllers: newControllers,
      animations: newAnimations,
    ));

    // await endAnimations();
  }

  // 애니메이션 종료
  Future<void> endAnimations() async {
    await Future.delayed(const Duration(seconds: 5));
    for (var controller in state.controllers) {
      controller.reverse();
    }
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(endAnimation: true));
  }

  // 스크롤 리스너
  void scrollListener() async {
    if (!state.isScrolled) {
      emit(state.copyWith(isScrolled: true, isAnimationStart: true));
    }
  }

  //전체화면 모드
  void toggleFullScreen(BuildContext context) {
    document.documentElement?.requestFullscreen();
  }
}
