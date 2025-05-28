import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailMe_model.freezed.dart';

@freezed
class DetailMeModel with _$DetailMeModel {
  const factory DetailMeModel({
    @Default(false) bool isDetailMe,
    @Default(false) bool isDetailMeRiveStart,
    @Default(false) bool isAppPageStart,
    @Default(false) bool isAppPageScrollStart,
  }) = _DetailMeModel;
}
