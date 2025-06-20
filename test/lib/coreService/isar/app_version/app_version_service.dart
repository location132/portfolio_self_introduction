import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:my_dream/coreService/isar/isar_init_service.dart';

import 'data/version.dart';

@singleton
class AppVersionService {
  final IsarInitService _isarInitService;

  AppVersionService(this._isarInitService);

  Future<AppVersion?> getAppVersionWithIsar() async {
    final db = await _isarInitService.isar;
    final version = await db.appVersions.where().findFirst();
    if (version == null) {
      await db.writeTxn(() async {
        await db.appVersions.clear();
        //============================================================
        // ⚠️ 주의! 앱 업데이트 시 버전을 반드시 올려주세요!
        //============================================================
        await db.appVersions.put(AppVersion(version: "1.0.0"));
      });
      return await db.appVersions.where().findFirst();
    }
    return version;
  }
}
