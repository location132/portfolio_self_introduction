import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default(0.0) double backgroundDarkness, // 0.0(흰색) ~ 1.0(검정색)
    @Default(Colors.black) Color textColor, // 텍스트 색상
  }) = _IfsaiState;
}
