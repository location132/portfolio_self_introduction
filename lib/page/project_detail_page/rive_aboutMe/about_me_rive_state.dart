import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_rive_state.freezed.dart';

@freezed
class RiveAboutMeState with _$RiveAboutMeState {
  const factory RiveAboutMeState({@Default(false) bool isMenuClicked}) =
      _GsShopState;
}
