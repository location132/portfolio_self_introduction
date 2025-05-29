import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isChapterDetailVisible,
    @Default(false) bool isChapterDetailAni,
    @Default(0) int selectedChapterIndex,
  }) = _ChapterModel;
}
