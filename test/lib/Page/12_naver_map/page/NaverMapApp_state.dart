import 'dart:async';

import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_dream/coreService/isar/naver_map/data/naver_map_category.dart';
import 'package:my_dream/model/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../coreService/isar/naver_map/data/naver_map_data.dart';

part 'NaverMapApp_state.freezed.dart';

@freezed
class NaverMapState with _$NaverMapState {
  const factory NaverMapState({
    NaverMapController? mapController,
    @Default([]) List<NClusterableMarker> markers,
    @Default('전체') String selectedCategory,
    @Default({}) Map<String, NOverlayImage> markerIcons,
    NOverlayImage? selectedMarkerIcon,

    //네이버 맵 데이터와 카테고리
    @Default([]) List<NaverMapDataContent> naverMapData,
    @Default([]) List<NaverMapCategoryContent> naverMapCategory,
    @Default('') String searchValue,
    NaverMapDataContent? selectedMarkerData,
    //로딩 상태
    @Default(ScreenState.loading) ScreenState screenState,

    // 현재 위치
    @Default(LocationPermissionState.notDetermined)
    LocationPermissionState locationPermissionState,
    @Default(LocationModel(latitude: 0, longitude: 0))
    LocationModel currentLocation,
    StreamSubscription? compassSubscription,
    @Default('') String distance,
    @Default(false) bool myLocation,

    //바텀 시트
    PanelController? panelController,
    @Default(false) bool isPanelImage,
    @Default(BottomSheetState.closed) BottomSheetState panelState,
  }) = _NaverMapState;
}

enum ScreenState {
  init,
  loading,
  loaded,
}

// 패널 상태 정의
enum BottomSheetState {
  closed(0),
  half(0.223),
  expanded(1);

  final double position;
  const BottomSheetState(this.position);
}

// 위치 권한 상태 정의
enum LocationPermissionState {
  granted, // 권한 허용
  denied, // 권한 거부
  notDetermined, // 권한 미결정
  gpsDisabled, // gps 비활성화
}
