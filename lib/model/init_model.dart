import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_model.freezed.dart';

@freezed
class InitModel with _$InitModel {
  const factory InitModel({
    // 초기화 상태
    @Default(InitState.inactive) InitState initState,

    // 프로필 뷰 높이
    @Default(0.0) double mainViewHeight,

    // 로딩 남은시간()
    @Default(4) int remainingTime,

    // 브라우저 확인
    @Default(false) bool isChromeBrowser,

    //모바일 init 확인
    @Default(false) bool isMobileInit,

    // 모바일 화면 폴드, 또는 웹
    @Default(false) bool isMobileFoldable,
  }) = _InitModel;
}

enum InitState { inactive, active }

enum DeviceType { desktop, tablet, mobile }
