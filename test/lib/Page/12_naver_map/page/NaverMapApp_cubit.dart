import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_overlay.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_service.dart';
import 'package:my_dream/Page/12_naver_map/page/widget/market_widget.dart';
import 'package:my_dream/coreService/core/service/location_service.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_data.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@injectable
class NaverMapCubit extends Cubit<NaverMapState> {
  final LocationService _locationService;
  final NaverMapService _naverMapService;
  final NaverMapOverlayService _overlayService;

  NaverMapCubit(
      this._naverMapService, this._locationService, this._overlayService)
      : super(NaverMapState(panelController: PanelController())) {
    // 상태 변경 콜백 설정
    _overlayService.onVisibilityChanged = (bool visible) {
      if (visible) {
        startCompassListener();
      } else {
        stopCompassListener();
      }
    };
  }

  // 네이버 맵 초기화
  Future<void> onMapReady(
      NaverMapController controller, BuildContext context) async {
    emit(state.copyWith(mapController: controller));
    await _getNaverMapData();
    await _getNaverMapCategory();
    if (context.mounted) {
      await _addMarkers(context);
    }
    await initialMapSetting();
    emit(state.copyWith(screenState: ScreenState.init));
    await naverMapInitAnimation();
    await initializeCurrentLocation();
    emit(state.copyWith(screenState: ScreenState.loaded));
  }

  // 네이버 맵 데이터 가져오기
  Future<void> _getNaverMapData() async {
    final naverMapData = await _naverMapService.getAllNaverMapData();
    emit(state.copyWith(naverMapData: naverMapData));
  }

  //네이버 맵 카테고리 가져오기
  Future<void> _getNaverMapCategory() async {
    final naverMapCategory = await _naverMapService.getAllNaverMapCategory();
    emit(state.copyWith(naverMapCategory: naverMapCategory));
  }

  // 마커 생성
  dynamic _createMarker(
    NaverMapDataContent data, {
    bool isSelected = false,
  }) {
    if (isSelected) {
      // 선택된 마커는 일반 NMarker 사용
      return NMarker(
        id: data.marketId.toString(),
        position: NLatLng(data.locationX!, data.locationY!),
        icon: state.selectedMarkerIcon!,
        size: Size(42.sw, 49.sh),
      )..setOnTapListener((_) {
          updateSelectedMarkerIcon(
            NLatLng(data.locationX!, data.locationY!),
            data,
          );
        });
    }

    // 일반 마커는 클러스터링 가능한 마커 사용
    return NClusterableMarker(
      id: data.marketId.toString(),
      position: NLatLng(data.locationX!, data.locationY!),
      icon: state.markerIcons[data.majorCategory]!,
      size: Size(27.sw, 27.sh),
    )..setOnTapListener((_) async {
        await calculateDistance(data);
        updateSelectedMarkerIcon(
          NLatLng(data.locationX!, data.locationY!),
          data,
        );
      });
  }

  // 마커 추가 메서드
  Future<void> _addMarkers(BuildContext context) async {
    if (state.naverMapData.isEmpty || state.mapController == null) return;

    // 1. 먼저 마커 아이콘 생성 (타입별로 한 번만)
    const selectedMarkerIcon = NOverlayImage.fromAssetImage(
      'assets/images/choose_marker.png',
    );

    final iconCache = <String, NOverlayImage>{};
    for (final type in state.naverMapCategory) {
      iconCache[type.category!] = await NOverlayImage.fromWidget(
        widget: SingleMarkerIconWidget(type: type.category!),
        size: Size(27.sh, 27.sw),
        context: context,
      );
    }

    // state에 아이콘 저장
    emit(state.copyWith(
        markerIcons: iconCache, selectedMarkerIcon: selectedMarkerIcon));

    // 2. 모든 마커를 Set으로 생성
    final Set<NAddableOverlay<NOverlay<void>>> markers = state.naverMapData
        .map((data) => _createMarker(data) as NAddableOverlay<NOverlay<void>>)
        .toSet();

    // 3. 한 번에 모든 마커 추가
    await state.mapController?.addOverlayAll(markers);
  }

  //초기 지도 설정
  Future<void> initialMapSetting() async {
    if (state.mapController != null) {
      await _naverMapService.initialMapSetting(state.mapController!);
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  // 네이버맵 애니메이션
  Future<void> naverMapInitAnimation() async {
    if (state.mapController != null) {
      await _naverMapService.playInitialAnimation(state.mapController!);
    }
  }

  // 카테고리 선택
  void updateSelectedCategory(String category, BuildContext context) async {
    emit(state.copyWith(selectedCategory: category));
    updatePanelState(BottomSheetState.closed);
    await state.mapController?.clearOverlays();

    final filteredData = category == '전체'
        ? state.naverMapData
        : state.naverMapData
            .where((data) => data.majorCategory == category)
            .toList();

    final Set<NAddableOverlay<NOverlay<void>>> markers = filteredData
        .map((data) => _createMarker(data) as NAddableOverlay<NOverlay<void>>)
        .toSet();

    await state.mapController?.addOverlayAll(markers);
    if (state.searchValue.isNotEmpty && context.mounted) {
      print('실행');
      updateSearchValue(state.searchValue, context);
    }
  }

  // 마커 클릭 시, 마커 아이콘 변경
  void updateSelectedMarkerIcon(
      NLatLng latLng, NaverMapDataContent clickedData) async {
    try {
      if (state.selectedMarkerData != null) {
        await resetMarkers();
      }
      // 기존 클러스터러블 마커 삭제
      await state.mapController?.deleteOverlay(NOverlayInfo(
          id: clickedData.marketId.toString(),
          type: NOverlayType.clusterableMarker));

      // 선택된 마커를 일반 NMarker로 생성
      final updatedMarkers = _createMarker(clickedData, isSelected: true);
      await state.mapController?.addOverlay(updatedMarkers);
      emit(state.copyWith(selectedMarkerData: clickedData));

      updatePanelState(BottomSheetState.half);
      state.mapController?.updateCamera(
        NCameraUpdate.withParams(
          target: latLng,
        )..setAnimation(duration: const Duration(milliseconds: 420)),
      );
    } catch (e) {
      debugPrint('마커 업데이트 중 에러 발생: $e');
    }
  }

  //--------------------------------
  //        위치 관련 함수 정의        //
  //--------------------------------

  // 0. gps와 위치 권환 확인
  Future<void> locationAuthority() async {
    final gpsService = await _locationService.checkGpsService();
    if (gpsService) {
      // GPS 활성화 상태
      final permission = await _locationService.checkLocationPermission();

      // LocationPermission을 LocationPermissionState로 변환
      switch (permission) {
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          emit(state.copyWith(
              locationPermissionState: LocationPermissionState.granted));
          break;

        case LocationPermission.denied:
        case LocationPermission.deniedForever:
          emit(state.copyWith(
              locationPermissionState: LocationPermissionState.denied));
          break;

        case LocationPermission.unableToDetermine:
          emit(state.copyWith(
              locationPermissionState: LocationPermissionState.notDetermined));
          break;
      }
    } else {
      // GPS 비활성화 상태
      emit(state.copyWith(
          locationPermissionState: LocationPermissionState.gpsDisabled));
    }
  }

  // 1. 초기 위치 설정만 하는 함수 (맵 로드 시 호출)
  Future<void> initializeCurrentLocation() async {
    await locationAuthority();

    if (state.locationPermissionState == LocationPermissionState.granted &&
        !state.myLocation) {
      emit(
        state.copyWith(
          currentLocation: await _locationService.getCurrentLocation(),
          locationPermissionState: LocationPermissionState.granted,
        ),
      );

      // 현재 위치 오버레이만 설정
      state.mapController?.getLocationOverlay()
        ?..setPosition(NLatLng(
          state.currentLocation.latitude,
          state.currentLocation.longitude,
        ))
        ..setIcon(
            const NOverlayImage.fromAssetImage('assets/location_icon.png'))
        ..setIconSize(Size(30.sw, 30.sw))
        ..setCircleRadius(0)
        ..setSubIcon(
            const NOverlayImage.fromAssetImage('assets/location_icon2.png'))
        ..setSubIconSize(Size(36.sw, 36.sw))
        ..setSubAnchor(const NPoint(0.5, 2.5))
        ..setIsVisible(true);

      startCompassListener();

      emit(state.copyWith(myLocation: true));
    } else {
      emit(state.copyWith(myLocation: false));
    }
  }

  // 2. 현재 위치로 카메라 이동하는 함수 (버튼 클릭 시 호출)
  Future<void> moveToCurrentLocation(BuildContext context) async {
    await locationAuthority();
    if (state.locationPermissionState == LocationPermissionState.granted) {
      emit(
        state.copyWith(
          currentLocation: await _locationService.getCurrentLocation(),
          locationPermissionState: LocationPermissionState.granted,
        ),
      );
      // 내위치 이동 애니메이션
      await state.mapController?.updateCamera(
        NCameraUpdate.withParams(
          target: NLatLng(
            state.currentLocation.latitude,
            state.currentLocation.longitude,
          ),
          zoom: 14,
        )..setAnimation(duration: const Duration(milliseconds: 1200)),
      );
    } else {
      if (context.mounted) {
        if (await _locationService.showDialogWithLocationPermission(context)) {
          await locationAuthority();
          if (state.locationPermissionState ==
              LocationPermissionState.granted) {
            await initializeCurrentLocation();
            if (context.mounted) {
              await moveToCurrentLocation(context);
            }
          }
        }
      }
    }
  }

  // 나침반 센서 리스너 시작
  void startCompassListener() {
    emit(state.copyWith(
        compassSubscription: FlutterCompass.events?.listen((event) {
      if (event.heading != null) {
        state.mapController?.getLocationOverlay()
          ?..setBearing(event.heading!) // 나침반 각도 적용
          ..setIsVisible(true);
      }
    })));
  }

  // 나침반 센서 리스너 종료
  void stopCompassListener() {
    state.compassSubscription?.cancel();
    emit(state.copyWith(compassSubscription: null));
  }

  // 거리 계산
  Future<void> calculateDistance(NaverMapDataContent data) async {
    try {
      emit(state.copyWith(
        currentLocation: await _locationService.getCurrentLocation(),
        distance: formatDistance(_naverMapService.calculateDistance(
          NLatLng(
              state.currentLocation.latitude, state.currentLocation.longitude),
          NLatLng(data.locationX!, data.locationY!),
        )),
      ));
    } catch (e) {
      emit(state.copyWith(
        distance: formatDistance(0.0),
        locationPermissionState: LocationPermissionState.denied,
      ));
    }
  }

  // 거리 업데이트
  Future<void> updateDistance(BuildContext context) async {
    await locationAuthority();
    if (state.locationPermissionState == LocationPermissionState.granted) {
      await calculateDistance(state.selectedMarkerData!);
    } else {
      if (context.mounted) {
        if (await _locationService.showDialogWithLocationPermission(context)) {
          await locationAuthority();
          if (state.locationPermissionState ==
              LocationPermissionState.granted) {
            await initializeCurrentLocation();
            if (context.mounted) {
              await updateDistance(context);
            }
          }
        }
      }
    }
  }

  //----------------------------------
  // 마커 클릭 시 바텀 시트에 관련한 함수 정의//
  //----------------------------------

  //패널 상태 변경
  Future<void> updatePanelState(BottomSheetState newState) async {
    state.panelController?.animatePanelToPosition(
      newState.position,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
    emit(state.copyWith(panelState: newState));
    if (newState == BottomSheetState.closed) {
      emit(state.copyWith(isPanelImage: false));
      await resetMarkers();
    } else if (newState == BottomSheetState.half) {
      Future.delayed(const Duration(milliseconds: 300), () {
        emit(state.copyWith(isPanelImage: true));
      });
    }
  }

  // 패널 축소
  void panelReduction(double position) {
    if (position > 0.22 && position < 0.23) {
      updatePanelState(BottomSheetState.half);
    }
  }

  // 패널 확장
  void panelExpansion(double position) {
    if (position > 0.6) {
      updatePanelState(BottomSheetState.expanded);
    }
  }

  // 마커 초기화 (모든 마커를 기본 상태로)
  Future<void> resetMarkers() async {
    if (state.selectedMarkerData != null) {
      try {
        // 1. 선택된 마커 삭제 (일반 NMarker 타입으로 삭제)
        await state.mapController?.deleteOverlay(NOverlayInfo(
          id: state.selectedMarkerData!.marketId.toString(),
          type: NOverlayType.marker, // clusterableMarker에서 marker로 변경
        ));

        // 2. 원래 마커로 다시 추가
        final originalMarker =
            _createMarker(state.selectedMarkerData!, isSelected: false);
        await state.mapController?.addOverlay(originalMarker);

        // 3. 선택된 마커 데이터 초기화
        emit(state.copyWith(selectedMarkerData: null));
      } catch (e) {
        debugPrint('마커 리셋 중 에러 발생: $e');
        emit(state.copyWith(selectedMarkerData: null));
      }
    }
  }

  //------------------------
  // 사용자 검색 관련 함수 정의 //
  //------------------------

  // 검색 카테고리 업데이트
  void updateSearchValue(String value, BuildContext context) {
    emit(state.copyWith(searchValue: value));

    if (value.isEmpty) {
      // 검색어가 비어있으면 모든 마커 표시
      updateSelectedCategory(state.selectedCategory, context);
      return;
    }

    final searchLower = value.toLowerCase();

    // 검색어와 일치하는 카테고리가 있는지 확인
    final matchingCategory = state.naverMapCategory.firstWhere(
      (category) =>
          category.category?.toLowerCase().contains(searchLower) ?? false,
      orElse: () => NaverMapCategoryContent(),
    );

    // 일치하는 카테고리가 있고, 현재 선택된 카테고리와 다르다면 카테고리 변경
    if (matchingCategory.category != null &&
        matchingCategory.category != state.selectedCategory) {
      updateSelectedCategory(matchingCategory.category!, context);
      return;
    }

    // 현재 선택된 카테고리에서 검색어로 필터링
    final filteredData = state.naverMapData.where((data) {
      if (state.selectedCategory != '전체' &&
          data.majorCategory != state.selectedCategory) {
        return false;
      }

      // 모든 검색 가능한 필드에서 검색
      return (data.mainCategory?.toLowerCase().contains(searchLower) ??
              false) ||
          (data.majorCategory?.toLowerCase().contains(searchLower) ?? false) ||
          (data.marketName?.toLowerCase().contains(searchLower) ?? false) ||
          (data.marketDescription?.toLowerCase().contains(searchLower) ??
              false) ||
          (data.detailAddress?.toLowerCase().contains(searchLower) ?? false) ||
          (data.eventMessage?.toLowerCase().contains(searchLower) ?? false);
    }).toList();

    // 기존 마커 삭제 후 필터링된 마커만 표시
    state.mapController?.clearOverlays().then((_) {
      final Set<NAddableOverlay<NOverlay<void>>> markers = filteredData
          .map((data) => _createMarker(data) as NAddableOverlay<NOverlay<void>>)
          .toSet();

      state.mapController?.addOverlayAll(markers);
    });
  }
}
