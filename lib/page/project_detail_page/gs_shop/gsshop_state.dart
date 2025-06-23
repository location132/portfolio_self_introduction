import 'package:freezed_annotation/freezed_annotation.dart';

part 'gsshop_state.freezed.dart';

@freezed
class GsShopState with _$GsShopState {
  const factory GsShopState.initial() = _Initial;
  const factory GsShopState.loading() = _Loading;
  const factory GsShopState.success() = _Success;
  const factory GsShopState.error(String message) = _Error;
}
