import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
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
            subScrollController: ScrollController(),
          ),
        ));

  @postConstruct
  void init() async {
    //TODO:  배포 후, 주석 해제
    emit(state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.active)));
    final controller = state.scrollModel.scrollController;
    isInitProfileView();
    await changeProfileViewHeight(controller);
    emit(state.copyWith(
        initModel: state.initModel.copyWith(initState: InitState.inactive)));
  }

  //브라우저 확인
  void isChromeBrowser(bool isChrome) {
    emit(state.copyWith(
        initModel: state.initModel.copyWith(isChromeBrowser: isChrome)));
  }

  // 프로필 뷰 초기화
  void isInitProfileView() async {
    for (int i = 0; i < 16; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      emit(state.copyWith(
        profileModel: state.profileModel
            .copyWith(scrollCount: state.profileModel.scrollCount + 1),
      ));
      if (state.profileModel.scrollCount == 9) {
        isImagePartActive();
        isTextPartActive();
      }
    }

    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        scrollCount: 0,
        finalCount: 1,
        previousCount: 0,
        profileChapter2Model: state.profileModel.profileChapter2Model
            .copyWith(isImagePartReverseActive: false),
      ),
    ));
  }

  Future<void> changeProfileViewHeight(controller) async {
    //TODO: 배포 주석 해제
    emit(state.copyWith(
        initModel: state.initModel
            .copyWith(remainingTime: state.initModel.remainingTime)));
    await Future.delayed(Duration(seconds: state.initModel.remainingTime));

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

//******************************************************* */

  // 프로필 뷰 활성화
  Future<void> profileViewActive() async {
    await isTextPartDispose(isReverseTime: false);
    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        //TODO: 스크롤 카운트 변경
        scrollCount: 1,
        finalCount: 1,
        previousCount: 0,
      ),
      scrollModel:
          state.scrollModel.copyWith(profileViewState: ProfileViewState.active),
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      scrollModel: state.scrollModel.copyWith(isScrollInit: true),
    ));
  }

  //사용자 스크롤 감지
  void viewListener(String viewName) async {
    if (ProfileViewConditionUtils.isBannerScrollActive(viewName)) {
      emit(state.copyWith(
        scrollModel:
            state.scrollModel.copyWith(bannerState: BannerState.activated),
      ));
    } else if (ProfileViewConditionUtils.isUserScrollActive(viewName)) {
      emit(state.copyWith(
          mySkillModel:
              state.mySkillModel.copyWith(status: MySkillViewStatus.active)));
    }
  }

  Future<void> profileIsTopScroll() async {
    if (state.scrollModel.isScrollWaiting == true) {
      return;
    }

    if (!ProfileViewConditionUtils.isProfileCountZero(state)) {
      emit(state.copyWith(
          profileModel: state.profileModel.copyWith(
              previousCount: state.profileModel.scrollCount,
              scrollCount: state.profileModel.scrollCount - 1),
          scrollModel: state.scrollModel.copyWith(isScrollWaiting: true)));

      //-------------- 프로필 뷰 카운트가 0이라면 ---------------
      if (ProfileViewConditionUtils.isProfileCountZero(state)) {
        emit(state.copyWith(
            profileModel:
                state.profileModel.copyWith(scrollCount: 0, previousCount: 1),
            scrollModel: state.scrollModel.copyWith(
                profileViewState: ProfileViewState.inactive,
                isScrollInit: false)));
      }

      // 8번 페이지일 경우
      if (state.profileModel.scrollCount == 8) {
        isImagePartReverseActive();
      }
      // 9번 페이지라면
      if (state.profileModel.scrollCount == 9) {
        isTextPartDispose();
      }

      // 10번 페이지일 경우
      if (state.profileModel.scrollCount == 10) {
        isTextPartActive();
      }

      // 11번 페이지일 경우
      if (state.profileModel.scrollCount == 11) {
        isTextPartActive();
      }

      if (state.profileModel.scrollCount != 1) {
        await Future.delayed(const Duration(milliseconds: 1500));
      } else {
        await Future.delayed(const Duration(milliseconds: 1000));
      }

      emit(state.copyWith(
          scrollModel: state.scrollModel.copyWith(isScrollWaiting: false)));
    }

    return;
  }

  // 사용자가 스크롤을 아래로 내리면
  Future<void> profileIsBottomScroll() async {
    if (state.scrollModel.isScrollWaiting == true) {
      return;
    }

    emit(state.copyWith(
        profileModel: state.profileModel.copyWith(
            previousCount: state.profileModel.scrollCount,
            scrollCount: state.profileModel.scrollCount + 1),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true)));

    // 9번 페이지일 경우
    if (state.profileModel.scrollCount == 9) {
      isImagePartActive();
    }
    if (state.profileModel.scrollCount == 10) {
      isTextPartActive();
    }

    await Future.delayed(const Duration(milliseconds: 1500));
    emit(state.copyWith(
      scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
    ));

    return;
  }

  // 사용자가 화면을 클릭했을 시,
  void userClickWithProfileViewScreen() async {
    if (state.profileModel.isUserClick) {
      return;
    } else {
      emit(state.copyWith(
        profileModel: state.profileModel.copyWith(isUserClick: true),
      ));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        profileModel: state.profileModel.copyWith(isUserClick: false),
      ));
    }
  }

// 이미지 파트 활성화
  void isImagePartActive() {
    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        profileChapter2Model: state.profileModel.profileChapter2Model
            .copyWith(isImagePartReverseActive: true),
      ),
    ));
  }

  // 이미지 파트 리버스 활성화
  void isImagePartReverseActive() async {
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        profileChapter2Model: state.profileModel.profileChapter2Model
            .copyWith(isImagePartReverseActive: false),
      ),
    ));
  }

  // 텍스트 파트 활성화 With 1번텍스트
  void isTextPartActive() {
    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        profileChapter2Model: state.profileModel.profileChapter2Model
            .copyWith(isTextPartReverseActive: true),
      ),
    ));
  }

  // 텍스트 파트 리버스 활성화 With 1번텍스트
  Future<void> isTextPartDispose({bool isReverseTime = true}) async {
    if (isReverseTime) {
      await Future.delayed(const Duration(milliseconds: 700));
    }

    emit(state.copyWith(
      profileModel: state.profileModel.copyWith(
        profileChapter2Model: state.profileModel.profileChapter2Model
            .copyWith(isTextPartReverseActive: false),
      ),
    ));
  }

  // 챕터 건너뛰기, 이어보기
  Future<void> continueChapterView(int pageNumber, bool isContinue) async {
    if (pageNumber == 3) {
      // 챕터 1 건너뛰기, 이어보기
      await skipChapterView(isContinue, 3);
    } else if (pageNumber == 8) {
      // 챕터 2 건너뛰기, 이어보기
      await skipChapterView(isContinue, 1);
    } else {
      // 챕터 3 건너뛰기, 이어보기
    }
  }

  // 챕터 건너뛰기
  Future<void> skipChapterView(bool isContinue, int count) async {
    if (isContinue) {
      // 이어보기
      await profileIsBottomScroll();
    } else {
      // 건너뛰기
      emit(state.copyWith(
        profileModel: state.profileModel.copyWith(
            isChapterSkip: true,
            scrollCount: state.profileModel.scrollCount + 1),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      ));
      for (int i = 0; i < count; i++) {
        await Future.delayed(const Duration(milliseconds: 950));
        emit(state.copyWith(
          profileModel: state.profileModel
              .copyWith(scrollCount: state.profileModel.scrollCount + 1),
        ));
      }
      emit(state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
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
      emit(state.copyWith(
          descriptionModel: state.descriptionModel.copyWith(
              skillDescriptionState: isActive
                  ? SkillDescriptionState.active
                  : SkillDescriptionState.inactive)));
    }
  }
}
