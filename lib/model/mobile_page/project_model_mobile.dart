import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model_mobile.freezed.dart';

@freezed
class ProjectModelWithMobile with _$ProjectModelWithMobile {
  const factory ProjectModelWithMobile({
    @Default(false) bool isBackGroundAniStart,
    @Default(false) bool isTitleAniStart,
    @Default(false) bool isProjectItemsAniStart,
    @Default(false) bool isProjectDetailVisible,
    @Default(false) bool isProjectDetailAni,
    @Default('') String selectedProjectCategory,
  }) = _ProjectModelWithMobile;
}
