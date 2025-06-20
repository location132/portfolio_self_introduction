import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/ifsai.dart';

part 'start_state.freezed.dart';

@freezed
class StartState with _$StartState {
  const factory StartState({
    @Default(ScreenState.loading) ScreenState screenState,
    Ifsai? ifsai,
    @Default(false) bool isNeedUpdateApp,
  }) = _StartState;
}

enum ScreenState {
  loading,
  loaded,
  error,
  update,
}
