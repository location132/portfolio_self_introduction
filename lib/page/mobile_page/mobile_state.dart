import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:self_introduction_flutter/model/init_model.dart';
import 'package:self_introduction_flutter/model/main_page/intro_model.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';

part 'mobile_state.freezed.dart';

@freezed
class MobileState with _$MobileState {
  const factory MobileState({
    @Default(InitModel()) InitModel initModel,
    @Default(IntroModel()) IntroModel introModel,
    @Default(ScrollModel()) ScrollModel scrollModel,
    @Default(AboutMeModel()) AboutMeModel aboutMeModel,
  }) = _MobileState;
}
