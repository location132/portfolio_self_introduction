import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';

@freezed
class ChapterModel with _$ChapterModel {
  const factory ChapterModel({
    @Default(false) bool isChapterDetailVisible,
    @Default(false) bool isChapterDetailAni,
    @Default(0) int selectedChapterIndex,

    // 타이틀 애니메이션 활성화
    @Default(false) bool isChapterDetailAniTitle,
    // 내용 공간 애니메이션 활성화
    @Default(false) bool isChapterDetailAniContent,
    //내용 텍스트 애니메이션 활성화
    @Default(false) bool isChapterDetailAniText,

    // 챕터 설명 화면 애니메이션 활성화
    @Default(false) bool isChapterDescriptionAni,

    // 버튼 표시 여부
    @Default(false) bool isButtonVisible,

    // 챕터 컨텐츠 표시 여부 (3개 세미나 섹션 한번에 제어)
    @Default(false) bool isChapterContentVisible,

    // 자세히보기 간략히보기 버튼 표시 여부
    @Default(ChapterDetailButton.none) ChapterDetailButton chapterDetailButton,

    // 백그라운드
    @Default(false) bool isBackGroundAniStart,
  }) = _ChapterModel;
}

enum ChapterDetailButton { none, simple, detail }
