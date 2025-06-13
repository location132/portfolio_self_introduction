import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'ifsai_state.freezed.dart';

@freezed
class IfsaiState with _$IfsaiState {
  const factory IfsaiState({
    @Default(false) bool isScrollEnabled,
    ScrollController? scrollController,
    // 스크롤 애니메이션 관련 상태
    @Default(1.0) double titleScale,
    @Default(1.0) double titleOpacity,
    @Default(0.0) double mainTitleOpacity,
    @Default(0.0) double descriptionOpacity,
    @Default(0.0) double titleOffset,
    @Default(1.0) double scrollDescriptionOpacity,
    @Default(50.0) double mainTitleTranslateY,
    @Default(50.0) double descriptionTranslateY,
    // 배경색과 텍스트 색상 관련 상태
    @Default(0.0) double backgroundDarkness,
    @Default(Colors.black) Color textColor,

    @Default(false) bool isPlayerVisible,
    @Default('궁금한 기술을 클릭해주세요') String playerText,
    @Default(false) bool isPlayerLongText,
    @Default(false) bool isPlayerWhiteBackground,

    // 백그라운드 비디오 관련 상태
    VideoPlayerController? backgroundVideoController,
    AnimationController? backgroundFadeController,
    @Default(false) bool isBackgroundVideoCompleted,
    @Default(false) bool isBackgroundVideoInitialized,
    @Default(false) bool isBackgroundVisible,
    @Default(false) bool hasBackgroundStartedPlaying,

    // 라이브러리 섹션 애니메이션 관련 상태
    AnimationController? libraryAnimationController,
    @Default(false) bool isLibrarySectionExpanded,
  }) = _IfsaiState;
}
