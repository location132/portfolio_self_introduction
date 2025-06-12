import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_detail_state.freezed.dart';

@freezed
class ProjectDetailState with _$ProjectDetailState {
  const factory ProjectDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoaded,
    @Default(false) bool isScrollEnabled,
    @Default('') String projectName,
    ScrollController? scrollController,
  }) = _ProjectDetailState;
}
