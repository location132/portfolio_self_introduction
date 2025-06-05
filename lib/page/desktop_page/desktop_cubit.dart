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
    // if (!isClosed) {
    //   emit(
    //     state.copyWith(
    //       initModel: state.initModel.copyWith(initState: InitState.active),
    //     ),
    //   );
    // }

    // final controller = state.scrollModel.scrollController;
    // if (controller != null) {
    //   await changeProfileViewHeight(controller);
    // }

    if (!isClosed) {
      emit(
        state.copyWith(
          initModel: state.initModel.copyWith(initState: InitState.inactive),
          scrollModel: state.scrollModel.copyWith(isScrollEnabled: true),
        ),
      );
    }
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
    if (isClosed) return;

    final List<String> characters = [];

    for (int i = 0; i < message.length; i++) {
      characters.add(message[i]);
    }

    if (!isClosed) {
      emit(
        state.copyWith(startAnimation: StartAnimationModel(words: characters)),
      );
    }

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
        if (!isClosed && controller.isAnimating == false) {
          controller.forward();
        }
      });
    }

    if (!isClosed && newControllers.isNotEmpty && newAnimations.isNotEmpty) {
      emit(
        state.copyWith(
          startAnimation: state.startAnimation!.copyWith(
            controllers: newControllers,
            animations: newAnimations,
          ),
        ),
      );
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
    if (isClosed) return;

    await Future.delayed(duration);

    if (!isClosed && state.startAnimation != null) {
      for (var controller in state.startAnimation!.controllers) {
        try {
          controller.reverse();
        } catch (e) {
          print('Controller already disposed: $e');
        }
      }
    }

    await Future.delayed(const Duration(seconds: 1));

    if (!isClosed) {
      initializeAnimations(vsync, message: message);
    }
  }

  //******************************************************* */

  //사용자 스크롤 감지
  void viewListener(String viewName) async {
    if (!state.scrollModel.isScrollEnabled || isClosed) return;

    if (ProfileViewConditionUtils.isBannerScrollActive(viewName)) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            bannerState: BannerState.activated,
          ),
        ),
      );
    } else if (ProfileViewConditionUtils.isChapterScrollActive(viewName)) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            chapterViewState: ChapterViewState.active,
          ),
        ),
      );
    } else if (ProfileViewConditionUtils.isSkillScrollActive(viewName)) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(
            status: MySkillViewStatus.active,
          ),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(isChapterActive: true),
        ),
      );
    } else if (ProfileViewConditionUtils.isAboutMeScrollActive(viewName)) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            aboutMeViewState: AboutMeViewState.active,
          ),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  //검정색 배경화면 활성화
  void blackBackgroundActive(bool isActive) {
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(
          isBlackBackgroundColor: isActive,
        ),
      ),
    );
  }

  //더 자세히 살펴보기 Rive 애니메이션 시작
  void detailMeRiveStart() async {
    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(isDetailMeRiveStart: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 900));
    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(isAppPageStart: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(isAppPageScrollStart: true),
      ),
    );
  }

  //플레이어 활성화
  void playerActive(String sectionName) {
    if (sectionName == 'banner' && state.bannerModel.isPlayerActive == false) {
      emit(
        state.copyWith(
          bannerModel: state.bannerModel.copyWith(isPlayerActive: true),
        ),
      );
    } else if (sectionName == 'skill' &&
        state.mySkillModel.isPlayerActive == false) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(isPlayerActive: true),
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
    } else if (descriptionName == 'chapter') {
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

  // 애니메이션 컨트롤러들 정리
  @override
  Future<void> close() async {
    if (state.startAnimation != null) {
      for (var controller in state.startAnimation!.controllers) {
        controller.dispose();
      }
    }
    return super.close();
  }
}
