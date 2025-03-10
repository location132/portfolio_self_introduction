import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/profile_model.dart';
import 'package:self_introduction_flutter/model/start_animation_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const MainPageState._();
  const factory MainPageState({
    //StartAnimation 컨트롤러
    StartAnimationModel? startAnimation,

    //프로필 뷰 모델
    ProfileViewModel? profileViewModel,

    //스크롤 컨트롤러
    ScrollController? startViewScrollController,
    @Default(StartViewScrollStatus.initial)
    StartViewScrollStatus startViewScrollStatus,
  }) = _MainPageState;
}

enum StartViewScrollStatus {
  initial,
  scrolled,
  end,
}
