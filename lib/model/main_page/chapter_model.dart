import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isBlackBackgroundColor,
    @Default(false) bool isChapterActive,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isManuallyChanged,

    // 챕터 디테일 관련 필드들
    @Default(false) bool isChapterDetailVisible,
    @Default(false) bool isChapterDetailAni,
    @Default(0) int selectedChapterIndex,
    @Default(false) bool isChapterDetailAniTitle,
    @Default(false) bool isChapterDetailAniContent,
    @Default(false) bool isChapterDetailAniText,
    @Default(false) bool isChapterDescriptionAni,
    @Default(false) bool isButtonVisible,
    @Default(false) bool isChapterContentVisible,
    @Default(ChapterDetailButton.none) ChapterDetailButton chapterDetailButton,
    @Default(false) bool isBackGroundAniStart,
  }) = _ChapterModel;
}

enum ChapterDetailButton { none, simple, detail }
