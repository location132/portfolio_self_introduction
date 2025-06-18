import 'package:freezed_annotation/freezed_annotation.dart';
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
    @Default(0.0) double sidePreviewTopSpace,
    @Default(false) bool sidePreviewOpacity,
  }) = _TechBlogState;
}

@freezed
class BlogPost with _$BlogPost {
  const factory BlogPost({
    required String id,
    required String title,
    required String description,
    required String date,
    required String content,
    @Default([]) List<String> tags,
    @Default(false) bool isPublished,
  }) = _BlogPost;
}
