import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @Default(0) int scrollCount,
    @Default(0) int finalCount,
    // 사용자가 1번 화면에서 터치를 했을 때, 관리하는 상태 변수
    @Default(false) bool isUserClick,
  }) = _ProfileModel;
}
