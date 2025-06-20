import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/isar/app_version/data/version.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_version.dart';
import 'package:my_dream/model/ifsai.dart';
import 'package:my_dream/repository/start_api/start_remote_local.dart';
import 'package:my_dream/repository/start_api/start_reomte_source.dart';

@singleton
class StartRemoteRepository {
  final StartRemoteSource _source;
  final StartRemoteLocal _local;

  StartRemoteRepository(this._source, this._local);
  /*----------------- 서버 관련 메서드 ----------------- */
  /*-------------------------------------------------- */

  // 서버 연결확인과 버전 체크(앱 버전, 네이버)
  Future<Ifsai> checkConnectionWithDio() async {
    return await _source.checkConnectionWithDio();
  }

  /*----------------- isar 관련 메서드 ----------------- */
  /*-------------------------------------------------- */

  // isar에 저장된 APP 버전 조회
  Future<AppVersion?> getAppVersionWithIsar() async {
    final version = await _local.getAppVersionWithIsar();
    return version;
  }

  // isar에 저장된 NaverMap 버전 조회
  Future<NaverMapVersion?> getNaverMapVersionWithIsar() async {
    final version = await _local.getNaverMapVersionWithIsar();
    return version;
  }

  // isar에 NaverMap 버전 저장
  Future<void> saveNaverMapVersion(String mapVersion) async {
    await _local.saveNaverMapVersion(mapVersion);
  }
  /*-------------------------------------------------- */
  /*-------------------------------------------------- */
}
