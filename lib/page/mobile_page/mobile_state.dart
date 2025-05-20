import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_state.freezed.dart';

@freezed
class MobileState with _$MobileState {
  const factory MobileState({
    @Default('') String test,
  }) = _MobileState;
}
