import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/start_animation.dart';

part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const MainPageState._();
  const factory MainPageState({
    //StartAnimation 컨트롤러
    StartAnimation? startAnimation,

    //스크롤 컨트롤러
    ScrollController? scrollController,
    @Default(false) bool isScrolled,
    @Default(false) bool isAnimationEnd,
    @Default(MainPageStatus.initial) MainPageStatus status,
  }) = _MainPageState;
}

enum MainPageStatus {
  initial,
  loading,
  loaded,
}
