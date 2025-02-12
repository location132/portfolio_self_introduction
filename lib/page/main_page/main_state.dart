import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const MainPageState._();
  const factory MainPageState({
    ScrollController? scrollController,
    @Default(false) bool isScrolled,
    @Default(false) bool isAnimationStart,
    @Default(MainPageStatus.initial) MainPageStatus status,
  }) = _MainPageState;
}

enum MainPageStatus {
  initial,
  loading,
  loaded,
}
