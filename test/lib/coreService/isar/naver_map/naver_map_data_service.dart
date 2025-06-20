import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_version.dart';
import 'package:my_dream/coreService/isar/naver_map/naver_map_category_service.dart';

import '../isar_init_service.dart';
import 'data/naver_map_data.dart';
import 'naver_map_version_service.dart';

@singleton
class NaverMapDataService {
  final IsarInitService _isarInitService;
  final NaverMapVersionService _naverMapVersionService;
  final NaverMapCategoryService _naverMapCategoryService;

  NaverMapDataService(this._isarInitService, this._naverMapVersionService,
      this._naverMapCategoryService);

  // 네이버 맵 조회
  Future<List<NaverMapDataContent>> getAllNaverMapData() async {
    try {
      final db = await _isarInitService.isar;
      final data = await db.naverMapDatas.where().findAll();
      return data.first.naverMapData!;
    } catch (e) {
      return [];
    }
  }

  //네이버 맵 저장하기
  Future<void> saveNaverMapData(List<NaverMapDataContent> response) async {
    final db = await _isarInitService.isar;

    NaverMapVersion? version =
        await _naverMapVersionService.getNaverMapVersionWithIsar();
    String? serverVersion = version?.ifsaiServerMapVersion;

    final newVersion = NaverMapVersion(
      ifsaiVersion: serverVersion,
      ifsaiServerMapVersion: version!.ifsaiServerMapVersion,
    );

    await _naverMapCategoryService.saveNaverMapCategory(response);

    await db.writeTxn(() async {
      await db.naverMapDatas.clear();
      await db.naverMapVersions.clear();

      await db.naverMapDatas.put(NaverMapData(naverMapData: response));
      await db.naverMapVersions.put(newVersion);
    });
  }
}
