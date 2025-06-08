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
          scrollModel: ScrollModel(scrollController: ScrollController()),
        ),
      );

  @postConstruct
  void init() async {
    //TODO:  배포 후, 주석 해제
    if (!isClosed) {
      emit(
        state.copyWith(
          initModel: state.initModel.copyWith(initState: InitState.active),
        ),
      );
    }

    final controller = state.scrollModel.scrollController;
    if (controller != null) {
      await changeProfileViewHeight(controller);
    }

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
          bannerModel: state.bannerModel.copyWith(
            isBannerActive: true,
            currentTitleIndex: 1,
          ),
        ),
      );

      // 제목 애니메이션 완료 후 버튼 표시 (스킬과 동일한 1200ms)
      await Future.delayed(const Duration(milliseconds: 400));
      if (!isClosed) {
        emit(
          state.copyWith(
            bannerModel: state.bannerModel.copyWith(isButtonVisible: true),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 400));
      if (!isClosed) {
        emit(
          state.copyWith(
            scrollModel: state.scrollModel.copyWith(
              bannerState: BannerState.activated,
            ),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 300));
      if (!isClosed) {
        playerActive('banner', isActive: true);
      }
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

      // 제목 애니메이션 완료 후 버튼 표시
      await Future.delayed(const Duration(milliseconds: 1200));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(isButtonVisible: true),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 1300));
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
          currentTitleIndex: isActive ? 1 : 0,
          isManuallyChanged: false,
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

  //더 자세히 살펴보기 Rive 애니메이션 종료
  void detailMeRiveEnd() {
    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(
          isAppPageScrollStart: false,
          isDetailMeRiveStart: false,
          isAppPageStart: false,
        ),
      ),
    );
  }

  //더 자세히 살펴보기 SlowScrollPhysics 비활성화
  void updateSlowScrollState(bool shouldDisable) {
    if (state.detailMeModel.isSlowScrollDisabled == shouldDisable) return;

    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(
          isSlowScrollDisabled: shouldDisable,
        ),
      ),
    );
  }

  //플레이어 활성화/비활성화
  void playerActive(String sectionName, {bool isActive = true}) {
    if (sectionName == 'banner') {
      emit(
        state.copyWith(
          bannerModel: state.bannerModel.copyWith(isPlayerActive: isActive),
        ),
      );
    } else if (sectionName == 'skill') {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(isPlayerActive: isActive),
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
      if (isActive == false) {
        _delayedPlayerActivation();
      }
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

  // 1초 딜레이 후 플레이어 활성화
  void _delayedPlayerActivation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!isClosed) {
      playerActive('banner', isActive: true);
    }
  }

  // 스킬 제목 이전으로 이동
  void skillTitlePrevious() async {
    final currentIndex = state.mySkillModel.currentTitleIndex;
    if (currentIndex > 0 &&
        state.mySkillModel.status == MySkillViewStatus.active) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(
            isTitleChanging: true,
            riveOpacity: 0.0,
            isPlayerActive: false,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 300));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(
              currentTitleIndex: currentIndex - 1,
              isTitleChanging: false,
            ),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 300));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(
              riveOpacity: currentIndex - 1 == 0 ? 0.0 : 1.0,
              isRiveVisible: currentIndex - 1 != 0,
            ),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 500));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(
              isPlayerActive:
                  state.mySkillModel.status == MySkillViewStatus.active,
            ),
          ),
        );
      }
    }
  }

  // 스킬 제목 다음으로 이동
  void skillTitleNext() async {
    final currentIndex = state.mySkillModel.currentTitleIndex;
    const maxIndex = 1;
    if (currentIndex < maxIndex &&
        state.mySkillModel.status == MySkillViewStatus.active) {
      emit(
        state.copyWith(
          mySkillModel: state.mySkillModel.copyWith(
            isTitleChanging: true,
            currentTitleIndex: currentIndex + 1,
            isRiveVisible: true,
            riveOpacity: 1.0,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 400));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(isTitleChanging: false),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 500));
      if (!isClosed) {
        emit(
          state.copyWith(
            mySkillModel: state.mySkillModel.copyWith(isPlayerActive: true),
          ),
        );
      }
    }
  }

  // 챕터 제목 이전으로
  void chapterTitlePrevious() {
    final currentIndex = state.chapterModel.currentTitleIndex;
    if (currentIndex > 0) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            currentTitleIndex: currentIndex - 1,
            isManuallyChanged: true,
          ),
        ),
      );
    }
  }

  // 챕터 제목 다음으로
  void chapterTitleNext() {
    final currentIndex = state.chapterModel.currentTitleIndex;
    const maxIndex = 1;
    if (currentIndex < maxIndex) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            currentTitleIndex: currentIndex + 1,
            isManuallyChanged: true,
          ),
        ),
      );
    }
  }

  // 배너 제목 이전으로 이동
  void bannerTitlePrevious() async {
    final currentIndex = state.bannerModel.currentTitleIndex;
    if (currentIndex > 0 && state.bannerModel.isBannerActive) {
      emit(
        state.copyWith(
          scrollModel: state.scrollModel.copyWith(
            bannerState: BannerState.inactive,
          ),
          bannerModel: state.bannerModel.copyWith(
            isTitleChanging: true,
            riveOpacity: 0.0,
            isPlayerActive: false,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 300));
      if (!isClosed) {
        emit(
          state.copyWith(
            bannerModel: state.bannerModel.copyWith(
              currentTitleIndex: 0,
              isTitleChanging: false,
            ),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 300));
      if (!isClosed) {
        emit(
          state.copyWith(
            bannerModel: state.bannerModel.copyWith(isRiveVisible: false),
          ),
        );
      }
    }
  }

  // 배너 제목 다음으로 이동
  void bannerTitleNext() async {
    final currentIndex = state.bannerModel.currentTitleIndex;
    const maxIndex = 1;
    if (currentIndex < maxIndex && state.bannerModel.isBannerActive) {
      emit(
        state.copyWith(
          bannerModel: state.bannerModel.copyWith(
            isTitleChanging: true,
            currentTitleIndex: 1,
            isRiveVisible: true,
            riveOpacity: 1.0,
          ),
        ),
      );

      await Future.delayed(const Duration(milliseconds: 400));
      if (!isClosed) {
        emit(
          state.copyWith(
            bannerModel: state.bannerModel.copyWith(isTitleChanging: false),
            scrollModel: state.scrollModel.copyWith(
              bannerState: BannerState.activated,
            ),
          ),
        );
      }

      await Future.delayed(const Duration(milliseconds: 500));
      if (!isClosed) {
        emit(
          state.copyWith(
            bannerModel: state.bannerModel.copyWith(isPlayerActive: true),
          ),
        );
      }
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
