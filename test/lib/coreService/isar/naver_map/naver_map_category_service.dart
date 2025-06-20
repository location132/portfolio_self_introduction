import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:my_dream/coreService/isar/isar_init_service.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';

@singleton
class NaverMapCategoryService {
  final IsarInitService _isarInitService;

  NaverMapCategoryService(this._isarInitService);

  // 네이머 맵 카테고리 조회
  Future<List<NaverMapCategoryContent>> getAllNaverMapCategory() async {
    final db = await _isarInitService.isar;
    final data = await db.naverMapCategorys.where().findAll();
    return data.first.categories!;
  }

  //카테고리 추출 후 저장하기
  Future<void> saveNaverMapCategory(
      List<NaverMapDataContent> categories) async {
    final db = await _isarInitService.isar;

    // String 리스트를 NaverMapCategoryContent 객체 리스트로 변환
    final uniqueCategories = categories
        .map((category) => category.majorCategory)
        .where((category) => category != null)
        .toSet()
        .map((categoryName) => NaverMapCategoryContent(category: categoryName))
        .toList();

    await db.writeTxn(() async {
      await db.naverMapCategorys.clear();
      await db.naverMapCategorys
          .put(NaverMapCategory(categories: uniqueCategories));
    });
  }
}
