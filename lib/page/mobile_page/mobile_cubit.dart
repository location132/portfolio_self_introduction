import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_state.dart';

@injectable
class MobileCubit extends Cubit<MobileState> {
  late final VoidCallback _scrollListener;

  MobileCubit()
    : super(
        MobileState(
          scrollModel: ScrollModel(scrollController: ScrollController()),
        ),
      ) {
    _scrollListener = () {
      final ctrl = state.scrollModel.scrollController;
      if (ctrl == null || !ctrl.hasClients) return;
      if (ctrl.offset >= ctrl.position.maxScrollExtent) {
        introAtBottom();
        ctrl.removeListener(_scrollListener);
      }
    };
    state.scrollModel.scrollController?.addListener(_scrollListener);
  }

  @postConstruct
  void init({bool isDescription = true}) async {
    // introAtBottom();
    //TODO: 배포시 주석 해제
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isHome: true),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 100));
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(isMobileInit: true),
        introModel: state.introModel.copyWith(isDeviceSelector: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isDescription: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(
          isTitelText: true,
          isHome: false,
          isFirstIntroText: true,
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
      ),
    );
  }

  //메뉴 클릭
  void menuClicked() {
    if (!state.introModel.isMenuClicked) {
      emit(
        state.copyWith(
          introModel: state.introModel.copyWith(isMenuClicked: true),
        ),
      );
    } else {
      emit(
        state.copyWith(
          introModel: state.introModel.copyWith(isMenuClicked: false),
        ),
      );
    }
  }

  // 하단 스크롤에 도착하였을 때,
  void introAtBottom() async {
    //=======================
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isAtBottom: true),
        introModel: state.introModel.copyWith(isIntroImage: true),
        isPlayerText: '지금 바로 시작합니다.',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 550));
    aboutMePlayerAni(true);
    await Future.delayed(const Duration(milliseconds: 1850));
    aboutMePlayerAni(false);
    //=======================
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isPageTransition: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isTitelTextAniStart: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 600));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isChapterContainerAniStart: true),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
        aboutMeModel: state.aboutMeModel.copyWith(isVisible: true),
      ),
    );
  }

  // 다시 홈 화면으로 돌아가기
  void goHome() async {
    if (state.introModel.isHome) return;

    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isVisible: true),
        introModel: state.introModel.copyWith(
          isDescription: false,
          isDeviceSelector: false,
          isTitelText: false,
          isFirstIntroText: false,
        ),
        initModel: state.initModel.copyWith(isMobileInit: false),
      ),
    );
    final ctrl = state.scrollModel.scrollController;
    if (ctrl != null && ctrl.hasClients) {
      await ctrl.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    ctrl?.removeListener(_scrollListener);

    emit(MobileState(scrollModel: ScrollModel(scrollController: ctrl)));

    ctrl?.addListener(_scrollListener);

    init(isDescription: false);
  }

  void aboutMeBackGroundColor(bool isBackGroundAniStart) {
    if (state.aboutMeModel.isBackGroundAniStart == isBackGroundAniStart) return;
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(
          isBackGroundAniStart: isBackGroundAniStart,
        ),
      ),
    );
    if (isBackGroundAniStart) {
      aboutMeAniStart(true);
    } else {
      aboutMeAniStart(false);
    }
  }

  // aboutMe ani
  void aboutMeAniStart(bool isStart) async {
    if (isStart) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isTitleAniStart: isStart),
      ),
    );
    if (isStart) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(
          isDescriptionAniStart: isStart,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isTabBarAniOpacity: isStart),
      ),
    );
  }

  // about me player ani
  void aboutMePlayerAni(bool isStart) {
    if (state.aboutMeModel.isPlayerAniOpacity == isStart) return;
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isPlayerAniOpacity: isStart),
      ),
    );
  }
}
