import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';

part 'projects_main_state.freezed.dart';

@freezed
class ProjectsMainState with _$ProjectsMainState {
  const factory ProjectsMainState({
    // 프로젝트 모델
    @Default(ProjectModel()) ProjectModel projectModel,

    //네비게이션 애니메이션 상태
    @Default(false) bool isNaviAniStart,
  }) = _ProjectsMainState;
}
