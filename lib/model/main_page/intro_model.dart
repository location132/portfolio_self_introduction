import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_model.freezed.dart';

@freezed
class IntroModel with _$IntroModel {
  const factory IntroModel({
    @Default(false) bool isDeviceSelector,
    @Default(false) bool isDescription,
    @Default(false) bool isTitelText,
    @Default(false) bool isFirstIntroText,
    @Default(false) bool isSubTitle,

    //웨이브 애니메이션
    @Default(true) bool isWaveAnimation,
    @Default(false) bool isWaveAnimationVisible,

    //메뉴 클릭 여부
    @Default(false) bool isMenuClicked,

    // 화면 전환
    @Default(false) bool isPageTransition,
    @Default(false) bool isTitelTextAniStart,
    @Default(false) bool isChapterContainerAniStart,
    @Default(false) bool isHome,
  }) = _IntroModel;
}
