import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tech_blog_post_detail_state.freezed.dart';

@freezed
class TechBlogPostDetailState with _$TechBlogPostDetailState {
  const factory TechBlogPostDetailState({
    @Default('') String postSlug,
    @Default('') String title,
    @Default('') String tags,
    @Default('') String content,
    @Default(false) bool isLoading,
    @Default(false) bool isPostFound,
    @Default(false) bool isMenuClicked,

    //플레이어
    @Default(false) bool isPlayerClicked,
    @Default(false) bool showOptions,
    @Default('') String searchQuery,

    //화면 필터
    @Default(false) bool isScreenFilter,
    @Default(false) bool isBackgroundColorWhite,

    ScrollController? scrollController,
  }) = _TechBlogPostDetailState;
}
