import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/components/condition_utils/condition_utils.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:universal_html/html.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(MainPageState(
          scrollModel: ScrollModel(
              scrollController: ScrollController(),
              subScrollController: ScrollController()),
        ));

  @postConstruct
  void init() async {
    //TODO: 추 후, 주석 해제
    // emit(state.copyWith(
    //     initModel: state.initModel.copyWith(initState: InitState.active)));

    final controller = state.scrollModel.scrollController;
    await changeProfileViewHeight(controller);
    emit(state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.inactive)));
  }

  //브라우저 확인
  void isChromeBrowser(bool isChrome) {
    emit(state.copyWith(
        initModel: state.initModel.copyWith(isChromeBrowser: isChrome)));
  }

  Future<void> changeProfileViewHeight(controller) async {
    //TODO: 추후 주석 해제
    // emit(state.copyWith(
    //     initModel: state.initModel
    //         .copyWith(remainingTime: state.initModel.remainingTime)));
    // await Future.delayed(Duration(seconds: state.initModel.remainingTime));

    void waitForAttachment() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (controller.hasClients) {
          controller.addListener(() {
            final maxHeight = controller.position.maxScrollExtent;
            final limit = maxHeight - 87.sh;
            if (controller.offset > limit) {
              controller.jumpTo(limit);
            }
            if (limit != state.initModel.mainViewHeight) {
              emit(state.copyWith(
                  initModel: state.initModel.copyWith(mainViewHeight: limit)));
            }
          });
        } else {
          waitForAttachment();
        }
      });
    }

    waitForAttachment();
  }

  void awaitDuration(TickerProvider vsync,
      {String message = TextConstants.welcomeMessage1}) async {
    //TODO: 추 후, 주석 해제
    // await Future.delayed(Duration(seconds: state.initModel.remainingTime));

    initializeAnimations(vsync, message: message);
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

  void toggleFullScreen(BuildContext context) {
    document.documentElement?.requestFullscreen();
  }

  //사용자 스크롤 감지
  void viewListener(String viewName) async {
    if (Conditions.isBannerScrollActive(viewName)) {
      emit(state.copyWith(
        scrollModel:
            state.scrollModel.copyWith(bannerState: BannerState.activated),
      ));
    } else if (Conditions.isProfileBackgroundScrollActive(viewName)) {
      emit(state.copyWith(
        scrollModel: state.scrollModel
            .copyWith(profileViewState: ProfileViewState.active),
      ));
    } else if (Conditions.isProfileIsTopScrollActive(viewName)) {
      upScrollPageNumber();
    } else if (Conditions.isProfileIsBottomScrollActive(viewName)) {
      emit(state.copyWith(
        scrollModel: state.scrollModel
            .copyWith(profileViewState: ProfileViewState.inactive),
      ));
    } else if (Conditions.isUserScrollActive(viewName)) {
      //TODO: 아직 모델 변경 안됨
      emit(state.copyWith(
        mySkillModel:
            state.mySkillModel.copyWith(status: MySkillViewStatus.loaded),
      ));
    }
  }

  // 프로필 페이지 전환 (사용자가 위로 올렸을 때)
  void upScrollPageNumber() {
    if (state.profileModel.scrollCount == 0) {
      // 페이지 종료
      emit(state.copyWith(
        scrollModel: state.scrollModel
            .copyWith(profileViewState: ProfileViewState.inactive),
      ));
    } else {
      // 상위 페이지로 이동
      emit(state.copyWith(
        profileModel: state.profileModel
            .copyWith(scrollCount: state.profileModel.scrollCount - 1),
      ));
    }
  }

  // 프로필 페이지 전환 (사용자가 아래로 내렸을 때)
  void downScrollPageNumber() {
    //TODO: 마지막 페이지 ==> 0이 될 수 있도록 수정
    if (state.profileModel.scrollCount != 3) {
      // 하위 페이지로 이동
      emit(state.copyWith(
        profileModel: state.profileModel
            .copyWith(scrollCount: state.profileModel.scrollCount + 1),
      ));
    } else {
      // 페이지 종료
      emit(state.copyWith(
        scrollModel: state.scrollModel
            .copyWith(profileViewState: ProfileViewState.inactive),
      ));
    }
  }

  //Description 버튼 클릭
  void descriptionButton(String descriptionName, bool isActive) {
    if (descriptionName == 'banner') {
      emit(state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
              bannerDescriptionState: isActive
                  ? BannerDescriptionState.active
                  : BannerDescriptionState.inactive)));
    } else if (descriptionName == 'profile') {
      emit(state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
              profileDescriptionState: isActive
                  ? ProfileDescriptionState.active
                  : ProfileDescriptionState.inactive)));
    } else if (descriptionName == 'skill') {
      //TODO: 아직 모델 변경 안됨
      emit(state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
              skillDescriptionState: isActive
                  ? SkillDescriptionState.active
                  : SkillDescriptionState.inactive)));
    }
  }
}
