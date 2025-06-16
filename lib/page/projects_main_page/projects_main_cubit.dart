import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_state.dart';

@injectable
class ProjectsMainCubit extends Cubit<ProjectsMainState> {
  ProjectsMainCubit() : super(const ProjectsMainState());

  @postConstruct
  void pageInit() {
    startNaviAni();
  }

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

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isBackGroundAniStart: true),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 500));
    if (isClosed) return;

    emit(
      state.copyWith(
        projectModel: state.projectModel.copyWith(isTitleAniStart: true),
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
}
