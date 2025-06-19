import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isBlackBackgroundColor,
    @Default(false) bool isChapterActive,
    @Default(0) int currentTitleIndex,
    @Default(false) bool isManuallyChanged,

    // 챕터 디테일 관련 필드
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

    // 챕터2 섹션 관련 필드
    @Default(0) int currentChapter2Index,
    @Default([]) List<Map<String, String>> chapter2Sections,
  }) = _ChapterModel;
}

enum ChapterDetailButton { none, simple, detail }
