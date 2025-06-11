import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/components/condition_utils/profile_view_condition_utils.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/main_page/start_animation_model.dart';
import 'package:self_introduction_flutter/model/main_page/chapter_model.dart';
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

  void textAnimation(List<String> characters) {
    emit(
      state.copyWith(startAnimation: StartAnimationModel(words: characters)),
    );
  }

  void textAnimationController(
    List<AnimationController> newControllers,
    List<Animation<double>> newAnimations,
  ) {
    emit(
      state.copyWith(
        startAnimation: state.startAnimation!.copyWith(
          controllers: newControllers,
          animations: newAnimations,
        ),
      ),
    );
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
    // 이미 같은 상태면 중복 호출 방지
    if (state.chapterModel.isBlackBackgroundColor == isActive) return;

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

  //섹션별 배경화면 제어 (더 안전한 방법)
  void setBackgroundForSection(String sectionName, bool isVisible) {
    switch (sectionName) {
      case 'banner':
        if (isVisible && state.chapterModel.isBlackBackgroundColor) {
          blackBackgroundActive(false);
        }
        break;
      case 'chapter':
        if (isVisible && !state.chapterModel.isBlackBackgroundColor) {
          blackBackgroundActive(true);
        }
        break;
    }
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

  // 프로젝트 애니메이션 시작
  void projectAniStart() async {
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          isTitleAniStart: true,
          selectedProjectCategory: 'All',
          isProjectListVisible: true,
          isProjectListAni: true, // 바로 애니메이션 시작하도록 변경
        ),
      ),
    );
  }

  // 프로젝트 카테고리 선택
  void selectProjectCategory(String category) async {
    if (state.projectModel.selectedProjectCategory == category) {
      return;
    }

    if (state.projectModel.isProjectListVisible) {
      emit(
        state.copyWith(
          projectModel: state.projectModel.copyWith(isProjectListAni: false),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 300));
    }

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          selectedProjectCategory: category,
          isProjectListVisible: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 100));
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isProjectListAni: true),
      ),
    );
  }

  // 프로젝트 디테일 스크린 표시
  void showProjectDetail(String category) async {
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          isProjectDetailVisible: true,
          selectedProjectCategory: category,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 400));
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isProjectDetailAni: true),
      ),
    );
  }

  // 프로젝트 디테일 스크린 숨기기
  void hideProjectDetail() async {
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isProjectDetailAni: false),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 600));
    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          isProjectDetailVisible: false,
          selectedProjectCategory: '',
        ),
      ),
    );
  }

  // 챕터 상세 화면 표시
  void showChapterDetail(int chapterIndex) async {
    // 챕터2인 경우 섹션 데이터 초기화
    List<Map<String, String>> chapter2Sections = [];
    if (chapterIndex == 1) {
      chapter2Sections = [
        {
          'title': '입학 후, 처음 개발 강의를 수강했던 날',
          'imagePath': 'assets/images/story_3.png',
          'contentTitle': '기본 개념조차 잡히지 않았던 우리.',
          'description':
              '기본 개념조차 잡히지 않았던 저와 동기들, Unix 수업 시간에 처음 들은 cd와 ls.\n\n'
              '하지만 이게 왜 필요한지, 어디에 쓰이는 건지 몰랐던 우리.\n\n'
              '궁금증만 커져가던 시간 속에서, 우리는 서로를 붙잡고, 매일 스터디에 모였습니다.',
        },
        {
          'title': '우리손으로 뭔가를 해보겠다는 노력',
          'imagePath': 'assets/images/story_1.png',
          'contentTitle': '하나의 프로젝트라는 꿈으로 이어졌습니다.',
          'description':
              '처음엔 학생 몇 명이 모여 만든 엉망진창의 결과물. 완성도는 부족했지만,\n\n'
              '우리 손으로 무언가를 만들어냈다는 그 기쁨은, 현재도 제가 개발공부를 하고, 계속 공부할 수 있도록 만들어주었습니다.',
        },
        {
          'title': 'Klang 프로젝트와 잎사이 프로젝트',
          'imagePath': 'assets/images/story_2.png',
          'contentTitle': 'Flutter 개발자로서의 가장 커다란 대학 경험.',
          'description':
              '9명의 개발자, 3명의 디자이너, 1명의 보안 전문가, 그리고 3명의 경영학 전공 친구들과 함께\n\n'
              '기획부터 디자인 · 개발까지 진행하며 하나의 작은 서비스를 우리 손으로 만들어내는 PM경험을 해보기도 했습니다.\n\n'
              '저는 이 모든 경험들이 저를 여기까지 올라오게 만들어준 Flutter 개발자로서의 가장 커다란 대학 경험이라 생각합니다.',
        },
      ];
    }

    emit(
      state.copyWith(
        scrollModel: state.scrollModel.copyWith(isScrollWaiting: true),
        chapterModel: state.chapterModel.copyWith(
          isChapterDetailVisible: true,
          selectedChapterIndex: chapterIndex,
          isButtonVisible: false,
          isChapterContentVisible: false,
          isBackGroundAniStart: true,
          currentChapter2Index: 0,
          chapter2Sections: chapter2Sections,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 50));
    emit(
      state.copyWith(
        chapterModel: state.chapterModel.copyWith(isChapterDetailAni: true),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 300));
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
          isButtonVisible: true,
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

  // 챕터 디테일 버튼 클릭
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

  // 챕터2 이전 섹션으로 이동
  void chapter2NavigatePrevious() {
    final currentIndex = state.chapterModel.currentChapter2Index;
    if (currentIndex > 0) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            currentChapter2Index: currentIndex - 1,
          ),
        ),
      );
    }
  }

  // 챕터2 다음 섹션으로 이동
  void chapter2NavigateNext() {
    final currentIndex = state.chapterModel.currentChapter2Index;
    final maxIndex = state.chapterModel.chapter2Sections.length - 1;
    if (currentIndex < maxIndex) {
      emit(
        state.copyWith(
          chapterModel: state.chapterModel.copyWith(
            currentChapter2Index: currentIndex + 1,
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
