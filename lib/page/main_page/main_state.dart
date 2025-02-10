import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const MainPageState._();
  const factory MainPageState({
    @Default(MainPageStatus.initial) MainPageStatus status,
    @Default(0) int stateNameIndex,
    @Default('') String stateBannerText,
  }) = _MainPageState;
}

enum MainPageStatus {
  initial,
  loading,
  loaded,
}
