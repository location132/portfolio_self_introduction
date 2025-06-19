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
    @Default('다양한 것들을 도와드릴게요 저를 클릭해주세요') String playerTitle,
    @Default(false) bool isPlayerClicked,
    @Default(false) bool showOptions,
    @Default('') String searchQuery,

    //화면 필터
    @Default(false) bool isScreenFilter,
  }) = _TechBlogPostDetailState;
}
