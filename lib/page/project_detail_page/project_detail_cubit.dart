import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/project_detail_page/project_detail_state.dart';

@injectable
class ProjectDetailCubit extends Cubit<ProjectDetailState> {
  ProjectDetailCubit()
    : super(ProjectDetailState(scrollController: ScrollController()));

  void setProjectName(String projectName) {
    emit(state.copyWith(projectName: projectName));
  }

  void loadProject() async {
    await Future.delayed(const Duration(milliseconds: 780));
    if (isClosed) {
      return;
    }
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 300));
    if (isClosed) {
      return;
    }
    emit(state.copyWith(isLoaded: true));
  }

  void setScrollEnabled(bool enabled) {
    emit(state.copyWith(isScrollEnabled: enabled));
  }

  // 메뉴 토글 함수
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  @override
  Future<void> close() {
    state.scrollController?.dispose();
    return super.close();
  }
}
