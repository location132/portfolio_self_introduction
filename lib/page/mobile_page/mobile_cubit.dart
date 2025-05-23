import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
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
  void init() async {
    introAtBottom();
    //TODO: 배포시 주석 해제
    // emit(
    //   state.copyWith(
    //     introModel: state.introModel.copyWith(isHome: true),
    //     scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
    //   ),
    // );
    // await Future.delayed(const Duration(milliseconds: 300));
    // emit(
    //   state.copyWith(
    //     initModel: state.initModel.copyWith(isMobileInit: true),
    //     introModel: state.introModel.copyWith(isDeviceSelector: true),
    //   ),
    // );

    // await Future.delayed(const Duration(milliseconds: 500));
    // emit(
    //   state.copyWith(
    //     introModel: state.introModel.copyWith(isDescription: true),
    //   ),
    // );
    // await Future.delayed(const Duration(milliseconds: 500));
    // emit(
    //   state.copyWith(
    //     introModel: state.introModel.copyWith(
    //       isTitelText: true,
    //       isFirstIntroText: true,
    //       isHome: false,
    //     ),
    //   ),
    // );

    // await Future.delayed(const Duration(seconds: 1));
    // if (state.introModel.isMobileDialog == MobileDialogType.none) {
    //   emit(
    //     state.copyWith(
    //       introModel: state.introModel.copyWith(
    //         isMobileDialog: MobileDialogType.active,
    //       ),
    //     ),
    //   );
    //   await Future.delayed(const Duration(milliseconds: 100));
    //   emit(
    //     state.copyWith(
    //       introModel: state.introModel.copyWith(
    //         isMobileDialog: MobileDialogType.inactive,
    //       ),
    //     ),
    //   );
    // }
    // emit(
    //   state.copyWith(
    //     scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
    //   ),
    // );
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
    // emit(
    //   state.copyWith(
    //     scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
    //   ),
    // );
    // await Future.delayed(const Duration(milliseconds: 500));
    // emit(
    //   state.copyWith(
    //     scrollModel: state.scrollModel.copyWith(isAtBottom: true),
    //     introModel: state.introModel.copyWith(
    //       isSubTitle: true,
    //       isWaveAnimation: false,
    //     ),
    //   ),
    // );

    // await Future.delayed(const Duration(milliseconds: 2500));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(
          isWaveAnimationVisible: true,
          isPageTransition: true,
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isTitelTextAniStart: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isChapterContainerAniStart: true),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
      ),
    );
  }

  // 다시 홈 화면으로 돌아가기
  void goHome() async {
    if (state.introModel.isHome) return;

    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(
          isDescription: false,
          isDeviceSelector: false,
          isTitelText: false,
          isFirstIntroText: false,
          isMenuClicked: true,
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

    init();
  }

  // aboutMe ani
  void aboutMeAniStart() async {
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isSectionTitleAniStart: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isBannerAniStart: true),
      ),
    );
  }

  void aboutMeBackGroundColor(bool isBackGroundAniStart) {
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(
          isBackGroundAniStart: isBackGroundAniStart,
        ),
      ),
    );
  }
}
