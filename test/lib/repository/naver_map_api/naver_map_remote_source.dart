import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/12_naver_map/dio/naver_map_dio.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';

@singleton
class NaverMapRemoteSource {
  final NaverMapDio _naverMapDio;
  NaverMapRemoteSource(this._naverMapDio);

  Future<List<NaverMapDataContent>> getNaverMapDataWithDio(
      {required int page, required int size}) async {
    final response = await _naverMapDio.getNaverMapData(page: page, size: size);

    return response.toNaverMapData().naverMapData!;
  }
}
