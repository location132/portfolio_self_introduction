import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:my_dream/coreService/isar/isar_init_service.dart';

import 'data/naver_map_version.dart';

@singleton
class NaverMapVersionService {
  final IsarInitService _isarInitService;

  NaverMapVersionService(this._isarInitService);

  // isar에 저장된 네이버 맵 버전 조회
  Future<NaverMapVersion?> getNaverMapVersionWithIsar() async {
    final db = await _isarInitService.isar;
    var version = await db.naverMapVersions.where().findFirst();

    if (version?.ifsaiVersion == null) {
      // 버전이 null이거나 비어있을 때
      final newVersion = NaverMapVersion(ifsaiVersion: "0.0.9");
      await db.writeTxn(() async {
        await db.naverMapVersions.clear();
        await db.naverMapVersions.put(newVersion);
      });
      version = newVersion;
    }

    return version;
  }

  // isar에 네이버 맵 버전 저장
  Future<void> saveNaverMapVersion(String dioVersion) async {
    final db = await _isarInitService.isar;
    final version = await getNaverMapVersionWithIsar();

    final newVersion = NaverMapVersion(
      ifsaiVersion: version!.ifsaiVersion,
      ifsaiServerMapVersion: dioVersion,
    );

    await db.writeTxn(() async {
      await db.naverMapVersions.clear();
      await db.naverMapVersions.put(newVersion);
    });
  }
}
