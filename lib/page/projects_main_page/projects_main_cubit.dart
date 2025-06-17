import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_state.dart';

@injectable
class ProjectsMainCubit extends Cubit<ProjectsMainState> {
  ProjectsMainCubit() : super(const ProjectsMainState());

  void startNaviAni() async {
    emit(
      state.copyWith(
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isProjectItemsAniStart: true,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 400));
    if (isClosed) return;

    emit(state.copyWith(isNaviAniStart: true));
  }

  // 페이지 초기화 및 애니메이션 시작
  Future<void> initializePage() async {
    if (isClosed) return;

    startNaviAni();

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isBackGroundAniStart: true),
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isBackGroundAniStart: true,
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isTitleAniStart: true),
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isTitleAniStart: true,
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 1000));
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          isProjectListAni: true,
          isProjectListVisible: true,
        ),
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isProjectItemsAniStart: true,
        ),
      ),
    );
  }

  // 프로젝트 카테고리 선택
  void selectProjectCategory(String category) {
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(
          selectedProjectCategory: category,
        ),
      ),
    );
  }

  // 프로젝트 디테일 스크린 표시 (모바일용)
  void showProjectDetail(String category) async {
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isProjectDetailVisible: true,
          selectedProjectCategory: category,
        ),
        isPlayerVisible: true,
        playerText: ProjectTextConstants.backToProjectList,
      ),
    );

    await Future.delayed(const Duration(milliseconds: 400));
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isProjectDetailAni: true,
        ),
      ),
    );
  }

  // 프로젝트 디테일 스크린 숨기기 (모바일용)
  void hideProjectDetail() {
    emit(
      state.copyWith(
        projectModelWithMobile: state.projectModelWithMobile.copyWith(
          isProjectDetailVisible: false,
          isProjectDetailAni: false,
        ),
        isPlayerVisible: false,
        playerText: '',
      ),
    );
  }

  // 메뉴 토글 함수
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }
}
