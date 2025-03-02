import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/start_animation.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'dart:html';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(MainPageState(
          mainViewScrollController: ScrollController(),
          startViewScrollController: ScrollController(),
        ));

  @postConstruct
  void init() {
    emit(state.copyWith(status: MainPageStatus.loaded));

    emit(state.copyWith(
      mainViewScrollStatus: MainViewScrollStatus.end,
    ));
    // 해제 메모리 확인 완료
    // state.mainViewScrollController?.addListener(() {
    //   mainViewScrollListener();
    // });
    state.startViewScrollController?.addListener(() {
      startViewScrollListener();
    });
  }

  // MainView 스크롤 리스너
  void mainViewScrollListener() async {
    if (state.mainViewScrollStatus == MainViewScrollStatus.initial) {
      emit(state.copyWith(mainViewScrollStatus: MainViewScrollStatus.scrolled));
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(state.copyWith(
        mainViewScrollStatus: MainViewScrollStatus.end,
      ));

      if (state.mainViewScrollController != null) {
        state.mainViewScrollController!
            .removeListener(() => mainViewScrollListener());
        state.mainViewScrollController?.dispose();
        emit(state.copyWith(mainViewScrollController: null));
      }
    }
  }

  // StartView 스크롤 리스너
  void startViewScrollListener() async {
    if (state.startViewScrollStatus == StartViewScrollStatus.initial &&
        state.startViewScrollController!.offset > 0) {
      emit(state.copyWith(
          startViewScrollStatus: StartViewScrollStatus.scrolled));
    } else if (state.startViewScrollStatus == StartViewScrollStatus.scrolled &&
        state.startViewScrollController!.offset == 0) {
      emit(state.copyWith(
        startViewScrollStatus: StartViewScrollStatus.initial,
      ));
    }
  }

  // text 애니메이션 시작
  Future<void> initializeAnimations(
    TickerProvider vsync, {
    String message = TextConstants.welcomeMessage1,
  }) async {
    final List<String> characters = [];
    for (int i = 0; i < message.length; i++) {
      characters.add(message[i]);
    }
    emit(state.copyWith(startAnimation: StartAnimation(words: characters)));

    List<AnimationController> newControllers = [];
    List<Animation<double>> newAnimations = [];

    for (int i = 0; i < state.startAnimation!.words.length; i++) {
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
      startAnimation: state.startAnimation!.copyWith(
        controllers: newControllers,
        animations: newAnimations,
      ),
    ));

    if (message == TextConstants.welcomeMessage1) {
      await endAnimations(vsync, TextConstants.welcomeMessage2,
          const Duration(milliseconds: 4500));
    } else {
      await endAnimations(vsync, TextConstants.welcomeMessage1,
          const Duration(milliseconds: 5500));
    }
  }

  // text애니메이션 종료
  Future<void> endAnimations(
    TickerProvider vsync,
    String message,
    Duration duration,
  ) async {
    await Future.delayed(duration);
    for (var controller in state.startAnimation!.controllers) {
      controller.reverse();
    }
    await Future.delayed(const Duration(seconds: 1));

    initializeAnimations(
      vsync,
      message: message,
    );
  }

  //전체화면 모드
  void toggleFullScreen(BuildContext context) {
    document.documentElement?.requestFullscreen();
  }
}
