import 'package:injectable/injectable.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';
import 'package:my_dream/repository/naver_map_api/naver_map_local_source.dart';
import 'package:my_dream/repository/naver_map_api/naver_map_remote_source.dart';

@singleton
class NaverMapRemoteRepository {
  final NaverMapRemoteSource _naverMapRemoteSource;
  final NaverMapLocalSource _naverMapLocalSource;
  NaverMapRemoteRepository(
      this._naverMapRemoteSource, this._naverMapLocalSource);

  // 서버에서 네이버 맵 데이터 가져오기
  Future<void> getNaverMapDataWithDio(
      {required int page, required int size}) async {
    final List<NaverMapDataContent> response = await _naverMapRemoteSource
        .getNaverMapDataWithDio(page: page, size: size);
    await _naverMapLocalSource.saveNaverMapData(response);
  }

  //isar에서 네이버 맵 데이터 가져오기
  Future<List<NaverMapDataContent>> getNaverMapDataWithIsar() async {
    return await _naverMapLocalSource.getAllNaverMapData();
  }

  //isar에서 네이버 맵 카테고리 가져오기
  Future<List<NaverMapCategoryContent>> getNaverMapCategoryWithIsar() async {
    return await _naverMapLocalSource.getAllNaverMapCategory();
  }
}
