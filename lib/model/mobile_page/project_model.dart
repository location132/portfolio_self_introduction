import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default(false) bool isVisible,
    @Default(false) bool isBackGroundAniStart,
    @Default(false) bool isTitleAniStart,
    @Default(false) bool isProjectItemsAniStart,
    @Default(false) bool isProjectViewInit,
  }) = _ProjectModel;
}
