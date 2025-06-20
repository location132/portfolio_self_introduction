import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/model/ifsai.dart';
import 'package:my_dream/repository/naver_map_api/naver_map_remote_repository.dart';
import 'package:my_dream/repository/start_api/start_remote_repository.dart';

@singleton
class StartRemoteService {
  final StartRemoteRepository _startRepository;
  final NaverMapRemoteRepository _naverRepository;

  StartRemoteService(this._startRepository, this._naverRepository);

  // 서버 연결확인과 버전 체크(앱 버전, 네이버)
  Future<Ifsai> serverConnectionWithDio() async {
    final currentVersion = await _startRepository.checkConnectionWithDio();
    return currentVersion;
  }

  // 서버와 네이버 맵 버전 비교
  Future<void> getNaverMapVersionWithIsar(Ifsai mapVersion) async {
    await _startRepository.saveNaverMapVersion(mapVersion.marketDataVersion!);
    final naverMapVersion = await _startRepository.getNaverMapVersionWithIsar();

    // 서버 버전이 더 크면 업데이트 필요
    if (compareVersions(naverMapVersion!.ifsaiServerMapVersion!,
            naverMapVersion.ifsaiVersion!) >
        0) {
      startNaverMapUpdate();
    } else {
      return;
    }
  }

  // 서버와 앱 버전 비교
  Future<bool> getVersionWithIsar(Ifsai appVersion) async {
    final ifsaiVersion = await _startRepository.getAppVersionWithIsar();
    return compareVersions(ifsaiVersion!.version, appVersion.appVersion!) < 0;
  }

  // 네이버 맵 버전 업데이트 시작
  Future<void> startNaverMapUpdate() async {
    _naverRepository.getNaverMapDataWithDio(page: 0, size: 1000);
    return;
  }
}
