// 해당 모델에서는 사용자의 스크롤에 맞추어 트리거되는 요소를 다루기 위한 모델로 정의

// 1. => 사용자가 메인화면에서 가장 먼저 볼 수 있는 배너

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scroll_model.freezed.dart';

@freezed
class ScrollModel with _$ScrollModel {
  const factory ScrollModel({
    ScrollController? scrollController,

    @Default(BannerState.inactive) BannerState bannerState,
    @Default(ProfileViewState.inactive) ProfileViewState profileViewState,
    @Default(ChapterViewState.inactive) ChapterViewState chapterViewState,
    @Default(AboutMeViewState.inactive) AboutMeViewState aboutMeViewState,
    @Default(false) bool isScrollWaiting,
    @Default(false) bool isScrollInit,
    @Default(false) bool isScrollEnabled,
  }) = _ScrollModel;
}

enum BannerState { inactive, activated }

enum ProfileViewState { inactive, active }

enum ChapterViewState { inactive, active }

enum AboutMeViewState { inactive, active }
