import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rive/rive.dart';

part 'main_state.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const MainPageState._();
  const factory MainPageState({
    StateMachineController? controller,
    @Default([]) List<SMIInput<bool>?> buttonTriggers,
    @Default(MainPageStatus.initial) MainPageStatus status,
  }) = _MainPageState;
}

enum MainPageStatus {
  initial,
  loading,
  loaded,
}
