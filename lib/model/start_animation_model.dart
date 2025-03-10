import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

part 'start_animation_model.freezed.dart';

@freezed
class StartAnimationModel with _$StartAnimationModel {
  const factory StartAnimationModel({
    @Default([]) List<AnimationController> controllers,
    @Default([]) List<Animation<double>> animations,
    @Default([]) List<String> words,
    @Default(false) bool endAnimation,
    TextConstants? textConstants,
  }) = _StartAnimationModel;
}
