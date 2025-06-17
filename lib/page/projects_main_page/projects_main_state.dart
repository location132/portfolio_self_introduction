import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/main_page/project_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/project_model_mobile.dart';

part 'projects_main_state.freezed.dart';

@freezed
class ProjectsMainState with _$ProjectsMainState {
  const factory ProjectsMainState({
    // 프로젝트 모델
    @Default(ProjectModel()) ProjectModel projectModel,
    //프로젝트 모델 모바일
    @Default(ProjectModelWithMobile())
    ProjectModelWithMobile projectModelWithMobile,

    //네비게이션 애니메이션 상태
    @Default(false) bool isNaviAniStart,

    // 플레이어 상태
    @Default(false) bool isPlayerVisible,
    @Default('') String playerText,

    // 메뉴 상태
    @Default(false) bool isMenuClicked,
  }) = _ProjectsMainState;
}
