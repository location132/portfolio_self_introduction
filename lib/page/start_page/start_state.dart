import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_state.freezed.dart';

@freezed
class StartPageState with _$StartPageState {
  const factory StartPageState({
    @Default(false) bool isTest,
  }) = _StartPageState;
}
