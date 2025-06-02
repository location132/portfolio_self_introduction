import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/chapter_model.dart';
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
    await Future.delayed(const Duration(milliseconds: 500));
    // aboutMePlayerAni(true);
    //TODO: 배포시 주석 해제
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
    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(
          isTitelText: true,
          isHome: false,
          isFirstIntroText: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isIntroImageinit: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1100));
    aboutMePlayerAni(false);
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
        introModel: state.introModel.copyWith(isIntroImageChange2: true),
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
        introModel: state.introModel.copyWith(
          isIntroImageChange: true,
          isFirstIntroText: false,
        ),
        isPlayerText: '제 소개 지금 바로 시작합니다!',
      ),
    );
    await Future.delayed(const Duration(milliseconds: 750));
    aboutMePlayerAni(true);
    await Future.delayed(const Duration(milliseconds: 1750));
    //=======================
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isPageTransition: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(
          isTitelTextAniStart: true,
          isIntroInActive: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      state.copyWith(
        introModel: state.introModel.copyWith(isChapterContainerAniStart: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 900));
    aboutMePlayerAni(false);
    emit(
      state.copyWith(
        aboutMeModel: state.aboutMeModel.copyWith(isVisible: true),
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
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
          isIntroInActive: false,
        ),
        initModel: state.initModel.copyWith(isMobileInit: false),
        isPlayerText: '지금 바로 시작합니다.',
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
        isPlayerText: '화면을 옆으로 넘겨 다양한 이야기를 확인해보세요',
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

  // detailMe ani
  void detailMePageStart(bool isDetailMe) {
    if (state.detailMeModel.isDetailMe == isDetailMe) return;

    emit(
      state.copyWith(
        detailMeModel: state.detailMeModel.copyWith(isDetailMe: isDetailMe),
      ),
    );
    aboutMePlayerAni(false);
  }

  // detailMe image ani
  void detailMeImageAni() async {
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
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
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
        skillModel: state.skillModel.copyWith(isSkillViewInit: true),
      ),
    );
  }

  // 모바일 화면 폴드, 또는 웹
  void isMobileFoldable(bool isFoldable) {
    if (state.initModel.isMobileFoldable == isFoldable) return;
    emit(
      state.copyWith(
        initModel: state.initModel.copyWith(isMobileFoldable: isFoldable),
      ),
    );
  }

  // 챕터 상세 화면 표시
  void showChapterDetail(int chapterIndex) async {
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailVisible: true,
          selectedChapterIndex: chapterIndex,
          isButtonVisible: false,
          isChapterContentVisible: false,
          isBackGroundAniStart: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 50));
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(isChapterDetailAni: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 600));
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailAniTitle: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 800));
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailAniContent: true,
          isChapterDescriptionAni: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 800));
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailAniText: true,
          isChapterContentVisible: true,
          chapterDetailButton: ChapterDetailButton.detail,
        ),
      ),
    );
  }

  // 챕터 상세 화면 숨기기
  void hideChapterDetail() async {
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(isChapterDetailAni: false),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: false),
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailVisible: false,
          isChapterDetailAniTitle: false,
          isChapterDetailAniContent: false,
          isChapterDetailAniText: false,
          isChapterDescriptionAni: false,
          isButtonVisible: false,
          isChapterContentVisible: false,
          isBackGroundAniStart: false,
          chapterDetailButton: ChapterDetailButton.none,
        ),
      ),
    );
  }

  // 스킬 섹션 애니메이션
  void skillBackGroundColor(bool isBackGroundAniStart) {
    if (state.skillModel.isBackGroundAniStart == isBackGroundAniStart) return;
    emit(
      state.copyWith(
        skillModel: state.skillModel.copyWith(
          isBackGroundAniStart: isBackGroundAniStart,
        ),
      ),
    );

    if (isBackGroundAniStart) {
      skillAniStart(true);
    } else {
      skillAniStart(false);
    }
  }

  // 스킬 애니메이션 시작
  void skillAniStart(bool isStart) async {
    emit(
      state.copyWith(
        skillModel: state.skillModel.copyWith(isTitleAniStart: isStart),
      ),
    );
    if (isStart) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    emit(
      state.copyWith(
        skillModel: state.skillModel.copyWith(isSkillItemsAniStart: isStart),
      ),
    );
    if (isStart) {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(
        state.copyWith(
          skillModel: state.skillModel.copyWith(isProgressAniStart: isStart),
        ),
      );
    }
  }

  // 자세히보기 간략히 보기 버튼 클릭
  void chapterDetailButtonClicked() {
    if (state.chapterModel.chapterDetailButton == ChapterDetailButton.none) {
      return;
    }

    if (state.chapterModel.chapterDetailButton == ChapterDetailButton.detail) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            chapterDetailButton: ChapterDetailButton.simple,
            isChapterDetailAniContent: false,
          ),
        ),
      );
      return;
    } else if (state.chapterModel.chapterDetailButton ==
        ChapterDetailButton.simple) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            chapterDetailButton: ChapterDetailButton.detail,
            isChapterDetailAniContent: true,
          ),
        ),
      );
    }
  }
}
