import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_chapter2_model.freezed.dart';

@freezed
class ProfileChapter2Model with _$ProfileChapter2Model {
  const factory ProfileChapter2Model({
    @Default(false) bool isTextPartReverseActive,
    @Default(false) bool isImagePartReverseActive,
  }) = _ProfileChapter2Model;
}
