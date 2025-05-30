// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChapterModel {
  bool get isChapterDetailVisible => throw _privateConstructorUsedError;
  bool get isChapterDetailAni => throw _privateConstructorUsedError;
  int get selectedChapterIndex =>
      throw _privateConstructorUsedError; // 타이틀 애니메이션 활성화
  bool get isChapterDetailAniTitle =>
      throw _privateConstructorUsedError; // 내용 공간 애니메이션 활성화
  bool get isChapterDetailAniContent =>
      throw _privateConstructorUsedError; //내용 텍스트 애니메이션 활성화
  bool get isChapterDetailAniText =>
      throw _privateConstructorUsedError; // 챕터 설명 화면 애니메이션 활성화
  bool get isChapterDescriptionAni =>
      throw _privateConstructorUsedError; // 버튼 표시 여부
  bool get isButtonVisible =>
      throw _privateConstructorUsedError; // 챕터 컨텐츠 표시 여부 (3개 세미나 섹션 한번에 제어)
  bool get isChapterContentVisible =>
      throw _privateConstructorUsedError; // 자세히보기 간략히보기 버튼 표시 여부
  ChapterDetailButton get chapterDetailButton =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterModelCopyWith<ChapterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterModelCopyWith<$Res> {
  factory $ChapterModelCopyWith(
    ChapterModel value,
    $Res Function(ChapterModel) then,
  ) = _$ChapterModelCopyWithImpl<$Res, ChapterModel>;
  @useResult
  $Res call({
    bool isChapterDetailVisible,
    bool isChapterDetailAni,
    int selectedChapterIndex,
    bool isChapterDetailAniTitle,
    bool isChapterDetailAniContent,
    bool isChapterDetailAniText,
    bool isChapterDescriptionAni,
    bool isButtonVisible,
    bool isChapterContentVisible,
    ChapterDetailButton chapterDetailButton,
  });
}

/// @nodoc
class _$ChapterModelCopyWithImpl<$Res, $Val extends ChapterModel>
    implements $ChapterModelCopyWith<$Res> {
  _$ChapterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChapterDetailVisible = null,
    Object? isChapterDetailAni = null,
    Object? selectedChapterIndex = null,
    Object? isChapterDetailAniTitle = null,
    Object? isChapterDetailAniContent = null,
    Object? isChapterDetailAniText = null,
    Object? isChapterDescriptionAni = null,
    Object? isButtonVisible = null,
    Object? isChapterContentVisible = null,
    Object? chapterDetailButton = null,
  }) {
    return _then(
      _value.copyWith(
            isChapterDetailVisible:
                null == isChapterDetailVisible
                    ? _value.isChapterDetailVisible
                    : isChapterDetailVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterDetailAni:
                null == isChapterDetailAni
                    ? _value.isChapterDetailAni
                    : isChapterDetailAni // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedChapterIndex:
                null == selectedChapterIndex
                    ? _value.selectedChapterIndex
                    : selectedChapterIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isChapterDetailAniTitle:
                null == isChapterDetailAniTitle
                    ? _value.isChapterDetailAniTitle
                    : isChapterDetailAniTitle // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterDetailAniContent:
                null == isChapterDetailAniContent
                    ? _value.isChapterDetailAniContent
                    : isChapterDetailAniContent // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterDetailAniText:
                null == isChapterDetailAniText
                    ? _value.isChapterDetailAniText
                    : isChapterDetailAniText // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterDescriptionAni:
                null == isChapterDescriptionAni
                    ? _value.isChapterDescriptionAni
                    : isChapterDescriptionAni // ignore: cast_nullable_to_non_nullable
                        as bool,
            isButtonVisible:
                null == isButtonVisible
                    ? _value.isButtonVisible
                    : isButtonVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            isChapterContentVisible:
                null == isChapterContentVisible
                    ? _value.isChapterContentVisible
                    : isChapterContentVisible // ignore: cast_nullable_to_non_nullable
                        as bool,
            chapterDetailButton:
                null == chapterDetailButton
                    ? _value.chapterDetailButton
                    : chapterDetailButton // ignore: cast_nullable_to_non_nullable
                        as ChapterDetailButton,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapterModelImplCopyWith<$Res>
    implements $ChapterModelCopyWith<$Res> {
  factory _$$ChapterModelImplCopyWith(
    _$ChapterModelImpl value,
    $Res Function(_$ChapterModelImpl) then,
  ) = __$$ChapterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isChapterDetailVisible,
    bool isChapterDetailAni,
    int selectedChapterIndex,
    bool isChapterDetailAniTitle,
    bool isChapterDetailAniContent,
    bool isChapterDetailAniText,
    bool isChapterDescriptionAni,
    bool isButtonVisible,
    bool isChapterContentVisible,
    ChapterDetailButton chapterDetailButton,
  });
}

/// @nodoc
class __$$ChapterModelImplCopyWithImpl<$Res>
    extends _$ChapterModelCopyWithImpl<$Res, _$ChapterModelImpl>
    implements _$$ChapterModelImplCopyWith<$Res> {
  __$$ChapterModelImplCopyWithImpl(
    _$ChapterModelImpl _value,
    $Res Function(_$ChapterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChapterDetailVisible = null,
    Object? isChapterDetailAni = null,
    Object? selectedChapterIndex = null,
    Object? isChapterDetailAniTitle = null,
    Object? isChapterDetailAniContent = null,
    Object? isChapterDetailAniText = null,
    Object? isChapterDescriptionAni = null,
    Object? isButtonVisible = null,
    Object? isChapterContentVisible = null,
    Object? chapterDetailButton = null,
  }) {
    return _then(
      _$ChapterModelImpl(
        isChapterDetailVisible:
            null == isChapterDetailVisible
                ? _value.isChapterDetailVisible
                : isChapterDetailVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterDetailAni:
            null == isChapterDetailAni
                ? _value.isChapterDetailAni
                : isChapterDetailAni // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedChapterIndex:
            null == selectedChapterIndex
                ? _value.selectedChapterIndex
                : selectedChapterIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isChapterDetailAniTitle:
            null == isChapterDetailAniTitle
                ? _value.isChapterDetailAniTitle
                : isChapterDetailAniTitle // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterDetailAniContent:
            null == isChapterDetailAniContent
                ? _value.isChapterDetailAniContent
                : isChapterDetailAniContent // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterDetailAniText:
            null == isChapterDetailAniText
                ? _value.isChapterDetailAniText
                : isChapterDetailAniText // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterDescriptionAni:
            null == isChapterDescriptionAni
                ? _value.isChapterDescriptionAni
                : isChapterDescriptionAni // ignore: cast_nullable_to_non_nullable
                    as bool,
        isButtonVisible:
            null == isButtonVisible
                ? _value.isButtonVisible
                : isButtonVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        isChapterContentVisible:
            null == isChapterContentVisible
                ? _value.isChapterContentVisible
                : isChapterContentVisible // ignore: cast_nullable_to_non_nullable
                    as bool,
        chapterDetailButton:
            null == chapterDetailButton
                ? _value.chapterDetailButton
                : chapterDetailButton // ignore: cast_nullable_to_non_nullable
                    as ChapterDetailButton,
      ),
    );
  }
}

/// @nodoc

class _$ChapterModelImpl implements _ChapterModel {
  const _$ChapterModelImpl({
    this.isChapterDetailVisible = false,
    this.isChapterDetailAni = false,
    this.selectedChapterIndex = 0,
    this.isChapterDetailAniTitle = false,
    this.isChapterDetailAniContent = false,
    this.isChapterDetailAniText = false,
    this.isChapterDescriptionAni = false,
    this.isButtonVisible = false,
    this.isChapterContentVisible = false,
    this.chapterDetailButton = ChapterDetailButton.none,
  });

  @override
  @JsonKey()
  final bool isChapterDetailVisible;
  @override
  @JsonKey()
  final bool isChapterDetailAni;
  @override
  @JsonKey()
  final int selectedChapterIndex;
  // 타이틀 애니메이션 활성화
  @override
  @JsonKey()
  final bool isChapterDetailAniTitle;
  // 내용 공간 애니메이션 활성화
  @override
  @JsonKey()
  final bool isChapterDetailAniContent;
  //내용 텍스트 애니메이션 활성화
  @override
  @JsonKey()
  final bool isChapterDetailAniText;
  // 챕터 설명 화면 애니메이션 활성화
  @override
  @JsonKey()
  final bool isChapterDescriptionAni;
  // 버튼 표시 여부
  @override
  @JsonKey()
  final bool isButtonVisible;
  // 챕터 컨텐츠 표시 여부 (3개 세미나 섹션 한번에 제어)
  @override
  @JsonKey()
  final bool isChapterContentVisible;
  // 자세히보기 간략히보기 버튼 표시 여부
  @override
  @JsonKey()
  final ChapterDetailButton chapterDetailButton;

  @override
  String toString() {
    return 'ChapterModel(isChapterDetailVisible: $isChapterDetailVisible, isChapterDetailAni: $isChapterDetailAni, selectedChapterIndex: $selectedChapterIndex, isChapterDetailAniTitle: $isChapterDetailAniTitle, isChapterDetailAniContent: $isChapterDetailAniContent, isChapterDetailAniText: $isChapterDetailAniText, isChapterDescriptionAni: $isChapterDescriptionAni, isButtonVisible: $isButtonVisible, isChapterContentVisible: $isChapterContentVisible, chapterDetailButton: $chapterDetailButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterModelImpl &&
            (identical(other.isChapterDetailVisible, isChapterDetailVisible) ||
                other.isChapterDetailVisible == isChapterDetailVisible) &&
            (identical(other.isChapterDetailAni, isChapterDetailAni) ||
                other.isChapterDetailAni == isChapterDetailAni) &&
            (identical(other.selectedChapterIndex, selectedChapterIndex) ||
                other.selectedChapterIndex == selectedChapterIndex) &&
            (identical(
                  other.isChapterDetailAniTitle,
                  isChapterDetailAniTitle,
                ) ||
                other.isChapterDetailAniTitle == isChapterDetailAniTitle) &&
            (identical(
                  other.isChapterDetailAniContent,
                  isChapterDetailAniContent,
                ) ||
                other.isChapterDetailAniContent == isChapterDetailAniContent) &&
            (identical(other.isChapterDetailAniText, isChapterDetailAniText) ||
                other.isChapterDetailAniText == isChapterDetailAniText) &&
            (identical(
                  other.isChapterDescriptionAni,
                  isChapterDescriptionAni,
                ) ||
                other.isChapterDescriptionAni == isChapterDescriptionAni) &&
            (identical(other.isButtonVisible, isButtonVisible) ||
                other.isButtonVisible == isButtonVisible) &&
            (identical(
                  other.isChapterContentVisible,
                  isChapterContentVisible,
                ) ||
                other.isChapterContentVisible == isChapterContentVisible) &&
            (identical(other.chapterDetailButton, chapterDetailButton) ||
                other.chapterDetailButton == chapterDetailButton));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isChapterDetailVisible,
    isChapterDetailAni,
    selectedChapterIndex,
    isChapterDetailAniTitle,
    isChapterDetailAniContent,
    isChapterDetailAniText,
    isChapterDescriptionAni,
    isButtonVisible,
    isChapterContentVisible,
    chapterDetailButton,
  );

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      __$$ChapterModelImplCopyWithImpl<_$ChapterModelImpl>(this, _$identity);
}

abstract class _ChapterModel implements ChapterModel {
  const factory _ChapterModel({
    final bool isChapterDetailVisible,
    final bool isChapterDetailAni,
    final int selectedChapterIndex,
    final bool isChapterDetailAniTitle,
    final bool isChapterDetailAniContent,
    final bool isChapterDetailAniText,
    final bool isChapterDescriptionAni,
    final bool isButtonVisible,
    final bool isChapterContentVisible,
    final ChapterDetailButton chapterDetailButton,
  }) = _$ChapterModelImpl;

  @override
  bool get isChapterDetailVisible;
  @override
  bool get isChapterDetailAni;
  @override
  int get selectedChapterIndex; // 타이틀 애니메이션 활성화
  @override
  bool get isChapterDetailAniTitle; // 내용 공간 애니메이션 활성화
  @override
  bool get isChapterDetailAniContent; //내용 텍스트 애니메이션 활성화
  @override
  bool get isChapterDetailAniText; // 챕터 설명 화면 애니메이션 활성화
  @override
  bool get isChapterDescriptionAni; // 버튼 표시 여부
  @override
  bool get isButtonVisible; // 챕터 컨텐츠 표시 여부 (3개 세미나 섹션 한번에 제어)
  @override
  bool get isChapterContentVisible; // 자세히보기 간략히보기 버튼 표시 여부
  @override
  ChapterDetailButton get chapterDetailButton;

  /// Create a copy of ChapterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterModelImplCopyWith<_$ChapterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
