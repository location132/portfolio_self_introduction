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
    ScrollController? mainViewScrollController,
    ScrollController? startViewScrollController,
    @Default(0.0) double previousScrollOffset,
    @Default(MainViewScrollStatus.initial)
    MainViewScrollStatus mainViewScrollStatus,
    @Default(StartViewScrollStatus.initial)
    StartViewScrollStatus startViewScrollStatus,
    @Default(MainPageStatus.initial) MainPageStatus status,
  }) = _MainPageState;
}

enum MainPageStatus {
  initial,
  loading,
  loaded,
}

enum MainViewScrollStatus {
  initial,
  scrolled,
  end,
}

enum StartViewScrollStatus {
  initial,
  scrolled,
  end,
}
