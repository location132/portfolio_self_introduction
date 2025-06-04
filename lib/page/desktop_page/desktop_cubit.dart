import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/description_model.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

@injectable
class DesktopCubit extends Cubit<DesktopState> {
  DesktopCubit()
    : super(
        DesktopState(
          scrollModel: ScrollModel(
            scrollController: ScrollController(),
            subScrollController: ScrollController(),
          ),
        ),
      );

  @postConstruct
  void init() async {
    //TODO:  배포 후, 주석 해제
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.active),
      ),
    );
    final controller = state.scrollModel.scrollController;
    await changeProfileViewHeight(controller);
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.inactive),
      ),
    );
  }

  //브라우저 확인
  void isChromeBrowser(bool isChrome) {
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(isChromeBrowser: isChrome),
      ),
    );
  }

  Future<void> changeProfileViewHeight(controller) async {
    //TODO: 배포 주석 해제
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(
          remainingTime: state.initModel.remainingTime,
        ),
      ),
    );
    await Future.delayed(Duration(seconds: state.initModel.remainingTime));
  }

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
    final List<String> characters = [];

    for (int i = 0; i < message.length; i++) {
      characters.add(message[i]);
    }
    emit(
      state.copyWith(startAnimation: StartAnimationModel(words: characters)),
    );

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
    emit(
      state.copyWith(
        startAnimation: state.startAnimation!.copyWith(
          controllers: newControllers,
          animations: newAnimations,
        ),
      ),
    );

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
    await Future.delayed(duration);
    for (var controller in state.startAnimation!.controllers) {
      controller.reverse();
    }
    await Future.delayed(const Duration(seconds: 1));

    initializeAnimations(vsync, message: message);
  }

  //******************************************************* */

  //사용자 스크롤 감지
  void viewListener(String viewName) async {
    if (ProfileViewConditionUtils.isBannerScrollActive(viewName)) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            bannerState: BannerState.activated,
          ),
        ),
      );
    } else if (ProfileViewConditionUtils.isUserScrollActive(viewName)) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(
            status: MySkillViewStatus.active,
          ),
        ),
      );
    }
  }

  //Description 버튼 클릭
  void descriptionButton(String descriptionName, bool isActive) {
    if (descriptionName == 'banner') {
      emit(
        state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
            bannerDescriptionState:
                isActive
                    ? BannerDescriptionState.active
                    : BannerDescriptionState.inactive,
          ),
        ),
      );
    } else if (descriptionName == 'profile') {
      emit(
        state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
            profileDescriptionState:
                isActive
                    ? ProfileDescriptionState.active
                    : ProfileDescriptionState.inactive,
          ),
        ),
      );
    } else if (descriptionName == 'skill') {
      emit(
        state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
            skillDescriptionState:
                isActive
                    ? SkillDescriptionState.active
                    : SkillDescriptionState.inactive,
          ),
        ),
      );
    }
  }
}
