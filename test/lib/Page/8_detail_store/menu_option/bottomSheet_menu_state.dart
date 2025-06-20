import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/model/menus_option.dart';

part 'bottomSheet_menu_state.freezed.dart';

@freezed
class BottomSheetMenuState with _$BottomSheetMenuState {
  const factory BottomSheetMenuState({
    @Default(ScreenState.loading) ScreenState screenState,
    MenuOptionsModel? menuOptionsModel,
    @Default({}) Map<int, int> selectedOptions,
    @Default(1) int quantity,
  }) = _BottomSheetMenuState;
}

enum ScreenState { loading, loaded }
