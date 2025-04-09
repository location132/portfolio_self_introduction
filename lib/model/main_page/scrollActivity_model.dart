import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scrollActivity_model.freezed.dart';

@freezed
class ScrollActivityModel with _$ScrollActivityModel {
  const factory ScrollActivityModel({
    @Default(ScrollStatus.stopped) ScrollStatus scrollActivityStatus,
    ScrollController? scrollController,
  }) = _ScrollActivityModel;
}

enum ScrollStatus {
  scrolling,
  stopped,
}
