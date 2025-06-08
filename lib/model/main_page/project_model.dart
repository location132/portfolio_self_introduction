import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default(false) bool isBackGroundAniStart,
    @Default(false) bool isTitleAniStart,
    @Default(false) bool isProjectItemsAniStart,
    @Default(false) bool isProjectDetailVisible,
    @Default(false) bool isProjectDetailAni,
    @Default('All') String selectedProjectCategory,
    @Default(false) bool isProjectListVisible,
    @Default(false) bool isProjectListAni,
  }) = _ProjectModel;
}
