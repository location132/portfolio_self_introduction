import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'gsshop_state.freezed.dart';

@freezed
class GsShopState with _$GsShopState {
  const factory GsShopState({
    @Default(false) bool isMenuClicked,

    @Default(300.0) double videoWidth,
    @Default(300.0) double textWidth,

    VideoPlayerController? videoController,
    @Default(false) bool isVideoInitialized,
    @Default(false) bool isVideoPlaying,
    @Default(true) bool showVideoControls,

    // 첫 번째 영상
    @Default('https://kr.object.ncloudstorage.com/web0314/gs_shop.mov')
    String firstVideoUrl,
    @Default('GS Shop 원본 앱') String firstVideoTitle,
    @Default('검색 시 화면 번쩍임 현상') String firstVideoDescription,
    @Default('문제 상황 설명') String firstSectionTitle,
    @Default(
      '사용자가 검색을 시도할 때, 데이터베이스에서 연관 검색어를 받아와 표시하는 과정에서 화면의 번쩍임 현상이 발생하였습니다.\n\n이 문제는 사용자가 "안녕"이라는 단어를 검색할 때, \'ㅇ\', \'ㅏ\', \'ㄴ\', \'ㄴ\', \'ㅕ\', \'ㅇ\' 총 6번의 화면이 setState 되는 문제였습니다.\n\n이로 인해 사용자는 과도한 번쩍거림 현상을 경험하게 되어 UX가 저하되는 문제가 발생하였으며, 이를 개선하고자 합니다.',
    )
    String firstSectionDescription,

    // 두 번째 영상
    @Default('https://kr.object.ncloudstorage.com/web0314/Flutter_gs_shop.mov')
    String secondVideoUrl,
    @Default('같은 문제 상황 구현해보기') String secondVideoTitle,
    @Default('같은 문제 재현') String secondVideoDescription,
    @Default('문제 상황 직접 재현하기') String secondSectionTitle,
    @Default(
      '이 문제를 이해하는 가장 좋은 방법은 직접 만들어 보는거라 생각하였습니다.\n\n그래서 저는 GS SHOP과 동일한 검색창을 Flutter로 구현했으며,\n문제 상황을 똑같이 재현하며 왜 이런 일이 벌어지는지 직접 확인했습니다.',
    )
    String secondSectionDescription,

    // 세 번째 영상 개선된 버전
    @Default('https://kr.object.ncloudstorage.com/web0314/fix_GsShop.mov')
    String thirdVideoUrl,
    @Default('검색 화면 수정 후') String thirdVideoTitle,
    @Default('번쩍임 현상 줄이기') String thirdVideoDescription,
    @Default('최종 개선 결과') String thirdSectionTitle,
    @Default(
      '6가지 핵심 개선 방법을 적용한 결과입니다.\n\n생명주기 개선, 애니메이션 최적화, Provider 상태 관리, 서버 통신 최적화, 로컬/서버 데이터 통합, 검색 입력 처리 최적화를 통해\n화면 번쩍임 현상을 완전히 제거하고 부드러운 사용자 경험을 구현했습니다.',
    )
    String thirdSectionDescription,
  }) = _GsShopState;
}
