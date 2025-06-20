import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';
import 'package:my_dream/coreService/isar/naver_map/naver_map_category_service.dart';
import 'package:my_dream/coreService/isar/naver_map/naver_map_data_service.dart';

@singleton
class NaverMapLocalSource {
  final NaverMapDataService _naverMapDataService;
  final NaverMapCategoryService _naverMapCategoryService;

  NaverMapLocalSource(this._naverMapDataService, this._naverMapCategoryService);

  // 네이버 맵 데이터 전체 조회
  Future<List<NaverMapDataContent>> getAllNaverMapData() async {
    try {
      return await _naverMapDataService.getAllNaverMapData();
    } catch (e) {
      rethrow;
    }
  }

  // 네이버 맵 데이터 저장
  Future<void> saveNaverMapData(List<NaverMapDataContent> response) async {
    return await _naverMapDataService.saveNaverMapData(response);
  }

  // 네이버 맵 카테고리 전체 조회
  Future<List<NaverMapCategoryContent>> getAllNaverMapCategory() async {
    return await _naverMapCategoryService.getAllNaverMapCategory();
  }
}
