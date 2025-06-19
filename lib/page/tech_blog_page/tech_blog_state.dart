import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/tech_note/blog_post.dart';

part 'tech_blog_state.freezed.dart';

@freezed
class TechBlogState with _$TechBlogState {
  const factory TechBlogState({
    @Default(false) bool isMenuClicked,
    @Default(false) bool isLoading,
    @Default([]) List<BlogPost> blogPosts,
    @Default([]) List<BlogPost> filteredPosts,
    @Default('') String searchQuery,
    @Default('all') String selectedCategory,
    @Default(0) int selectedCategoryIndex,
    @Default(0.0) double sidePreviewTopSpace,
    @Default(false) bool sidePreviewOpacity,
    @Default(false) bool isTabletMode,

    //화면 필터
    @Default(false) bool isScreenFilter,
  }) = _TechBlogState;
}
