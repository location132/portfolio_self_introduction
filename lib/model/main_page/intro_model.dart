import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_model.freezed.dart';

@freezed
class IntroModel with _$IntroModel {
  const factory IntroModel({
    @Default(false) bool isDeviceSelector,
    @Default(false) bool isDescription,
    @Default(false) bool isTitelText,
    @Default(false) bool isFirstIntroText,

    // 인트로 배경화면 변경
    @Default(false) bool isIntroImageChange,
    @Default(false) bool isIntroImageinit,
    @Default(false) bool isIntroImageChange2,

    //메뉴 클릭 여부
    @Default(false) bool isMenuClicked,

    // 화면 전환
    @Default(false) bool isPageTransition,
    @Default(false) bool isTitelTextAniStart,
    @Default(false) bool isChapterContainerAniStart,
    @Default(false) bool isHome,

    // 모바일 디바이스 안내 다이얼로그
    @Default(false) bool isIntroInActive,
  }) = _IntroModel;
}

enum MobileDialogType { none, active, inactive }
