import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_me_model.freezed.dart';

@freezed
class DetailMeModel with _$DetailMeModel {
  const factory DetailMeModel({
    @Default(false) bool isDetailMeRiveStart,
    @Default(false) bool isAppPageStart,
    @Default(false) bool isAppPageScrollStart,
    @Default(false) bool isSlowScrollDisabled,
  }) = _DetailMeModel;
}
