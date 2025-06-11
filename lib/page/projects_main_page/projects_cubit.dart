import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_state.dart';

@injectable
class ProjectsMainCubit extends Cubit<ProjectsMainState> {
  ProjectsMainCubit() : super(const ProjectsMainState());

  // 페이지 초기화
  Future<void> initializePage() async {
    if (isClosed) return;
  }
}
