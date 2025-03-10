import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/profile_model.dart';
import 'package:self_introduction_flutter/model/start_animation_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:universal_html/html.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(MainPageState(
          startViewScrollController: ScrollController(),
          profileViewModel: const ProfileViewModel(),
        ));

  @postConstruct
  void init() {
    state.startViewScrollController?.addListener(() {
      startViewScrollListener();
    });
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
    emit(
        state.copyWith(startAnimation: StartAnimationModel(words: characters)));

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

  //프로필 뷰 스크롤 감지
  void profileViewListener(double visibleFraction) async {
    if (visibleFraction > 0.03 &&
        state.profileViewModel?.status == ProfileViewStatus.init) {
      emit(state.copyWith(
        profileViewModel: state.profileViewModel!
            .copyWith(status: ProfileViewStatus.end, isProfileCard: true),
      ));
      await Future.delayed(const Duration(milliseconds: 350));
      emit(state.copyWith(
        profileViewModel: state.profileViewModel!.copyWith(aboutSection1: true),
      ));
      await Future.delayed(const Duration(milliseconds: 330));
      emit(state.copyWith(
        profileViewModel: state.profileViewModel!.copyWith(aboutSection2: true),
      ));
      await Future.delayed(const Duration(milliseconds: 300));
      emit(state.copyWith(
        profileViewModel: state.profileViewModel!.copyWith(aboutSection3: true),
      ));
      await Future.delayed(const Duration(milliseconds: 250));
      emit(state.copyWith(
        profileViewModel:
            state.profileViewModel!.copyWith(animationStart: true),
      ));
    }
  }
}
