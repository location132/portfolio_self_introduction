import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_post.freezed.dart';

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
