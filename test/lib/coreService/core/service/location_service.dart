import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_overlay.dart';
import 'package:my_dream/coreService/Dialog/locationPermissionDialog.dart';
import 'package:my_dream/model/location.dart';

@singleton
class LocationService {
  LocationService();

  // 1. 위치 권한 확인 함수
  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        // 처음 거부된 상태면 다시 요청
        permission = await Geolocator.requestPermission();
        return permission;

      case LocationPermission.deniedForever:
        // 영구 거부된 상태면 설정으로 이동하도록 유도
        return LocationPermission.deniedForever;

      case LocationPermission.whileInUse:
      case LocationPermission.always:
        // 이미 권한이 있는 경우
        return permission;

      case LocationPermission.unableToDetermine:
        // 권한 확인 불가능한 경우 (웹)
        return LocationPermission.denied;
    }
  }

  //gps 서비스 확인
  Future<bool> checkGpsService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      final overlayContext = NaverMapOverlayService().overlayContext;
      if (overlayContext != null && overlayContext.mounted) {
        // 별도의 다이얼로그 위젯을 호출
        showLocationPermissionDialog(
          overlayContext,
          () async {
            checkGpsService();
          },
          'GPS 서비스가 비활성화되어 있습니다.\nGPS를 활성화해주세요.',
          true,
        );
      }
    }

    return serviceEnabled;
  }

  // 사용자 위치 가져오기
  Future<LocationModel> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 5),
      ),
    );

    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  // 2. 위치 권한 확인 후 다이얼로그 호출
  Future<bool> showDialogWithLocationPermission(BuildContext context) async {
    final completer = Completer<bool>();

    showLocationPermissionDialog(
      //오버레이 컨텍스트가 널이 아님을 자신 => 미래의 나야 이거 네이버 맵 전용으로 일단 만들었어
      context,
      () async {
        final permission = await checkLocationPermission();
        // LocationPermission 결과에 따라 bool 값으로 완료 여부를 전달
        completer.complete(permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always);
      },
      '매장과 현재 위치 사이의 거리를 계산하여\n더 나은 서비스를 제공하기 위해서\n위치기반 서비스 이용약관에 동의해주세요:)',
      false,
    );

    return completer.future;
  }
}
