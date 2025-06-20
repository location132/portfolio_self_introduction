import 'package:injectable/injectable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';
import 'package:my_dream/repository/naver_map_api/naver_map_remote_repository.dart';

@singleton
class NaverMapService {
  final NaverMapRemoteRepository _naverMapRemoteRepository;

  NaverMapService(this._naverMapRemoteRepository);

  //--------------------------------
  // isar에서 데이터 조회 정의         //
  //--------------------------------

  // 네이버 맵 데이터 조회
  Future<List<NaverMapDataContent>> getAllNaverMapData() async {
    final localData = await _naverMapRemoteRepository.getNaverMapDataWithIsar();
    return localData;
  }

  // 네이버 맵 카테고리 조회
  Future<List<NaverMapCategoryContent>> getAllNaverMapCategory() async {
    final localCategory =
        await _naverMapRemoteRepository.getNaverMapCategoryWithIsar();
    return localCategory;
  }

  //--------------------------------
  // 네이버 맵 화면 이동 애니메이션 정의   //
  //--------------------------------

  // 초기 지도 설정
  Future<void> initialMapSetting(NaverMapController controller) async {
    await controller.updateCamera(
      NCameraUpdate.withParams(
        zoom: 15.77,
        tilt: 59.9,
        bearing: 125.8,
        target: const NLatLng(36.94965229849843, 127.90843762544843),
      )..setAnimation(duration: const Duration(milliseconds: 0)),
    );
  }

  // 네이버맵 초기 애니메이션
  Future<void> playInitialAnimation(NaverMapController controller) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // 학교 회전
    await controller.updateCamera(
      NCameraUpdate.withParams(
        zoom: 15.77,
        tilt: 59.9,
        bearing: 310,
        target: const NLatLng(36.94965229849843, 127.90843762544843),
      )..setAnimation(
          animation: NCameraAnimation.fly,
          duration: const Duration(milliseconds: 2000)),
    );

    // 그 다음 줌 아웃
    await controller.updateCamera(
      NCameraUpdate.withParams(
        zoom: 12.3,
        bearing: 0,
        tilt: 0,
        target: const NLatLng(36.971336282566874, 127.91767020963579),
      )..setAnimation(duration: const Duration(milliseconds: 2500)),
    );
  }

  //-------------------------------------------
  // 사용자의 위치와 클릭한 마커와의 위치 거리 계산      //
  //-------------------------------------------

  // 사용자의 위치와 클릭한 마커와의 위치 거리 계산
  double calculateDistance(NLatLng userLocation, NLatLng markerLocation) {
    if (userLocation.latitude == 0 || userLocation.longitude == 0) {
      return 0.0;
    } else {
      return userLocation.distanceTo(markerLocation);
    }
  }
}
