import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @Default(0) int scrollCount,
    @Default(0) int finalCount,
  }) = _ProfileModel;
}
