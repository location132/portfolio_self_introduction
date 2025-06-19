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
  }) = _TechBlogPostDetailState;
}
