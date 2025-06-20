import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/isar/app_version/app_version_service.dart';
import 'package:my_dream/coreService/isar/app_version/data/version.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_version.dart';
import 'package:my_dream/coreService/isar/naver_map/naver_map_version_service.dart';

@singleton
class StartRemoteLocal {
  final AppVersionService _isarAppVersion;
  final NaverMapVersionService _isarNaverMapVersion;

  StartRemoteLocal(this._isarAppVersion, this._isarNaverMapVersion);

  // isar에 저장된 APP 버전 조회
  Future<AppVersion?> getAppVersionWithIsar() async {
    final version = await _isarAppVersion.getAppVersionWithIsar();
    return version;
  }

  // isar에 저장된 NaverMap 버전 조회
  Future<NaverMapVersion?> getNaverMapVersionWithIsar() async {
    final version = await _isarNaverMapVersion.getNaverMapVersionWithIsar();

    return version;
  }

  // isar에 NaverMap 버전 저장
  Future<void> saveNaverMapVersion(String mapVersion) async {
    await _isarNaverMapVersion.saveNaverMapVersion(mapVersion);
  }
}
