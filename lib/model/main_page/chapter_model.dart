import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isBlackBackgroundColor,
    @Default(false) bool isChapterActive,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isManuallyChanged,
  }) = _ChapterModel;
}
