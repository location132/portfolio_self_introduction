// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'NaverMapApp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NaverMapState {
  NaverMapController? get mapController => throw _privateConstructorUsedError;
  List<NClusterableMarker> get markers => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  Map<String, NOverlayImage> get markerIcons =>
      throw _privateConstructorUsedError;
  NOverlayImage? get selectedMarkerIcon =>
      throw _privateConstructorUsedError; //네이버 맵 데이터와 카테고리
  List<NaverMapDataContent> get naverMapData =>
      throw _privateConstructorUsedError;
  List<NaverMapCategoryContent> get naverMapCategory =>
      throw _privateConstructorUsedError;
  String get searchValue => throw _privateConstructorUsedError;
  NaverMapDataContent? get selectedMarkerData =>
      throw _privateConstructorUsedError; //로딩 상태
  ScreenState get screenState => throw _privateConstructorUsedError; // 현재 위치
  LocationPermissionState get locationPermissionState =>
      throw _privateConstructorUsedError;
  LocationModel get currentLocation => throw _privateConstructorUsedError;
  StreamSubscription<dynamic>? get compassSubscription =>
      throw _privateConstructorUsedError;
  String get distance => throw _privateConstructorUsedError;
  bool get myLocation => throw _privateConstructorUsedError; //바텀 시트
  PanelController? get panelController => throw _privateConstructorUsedError;
  bool get isPanelImage => throw _privateConstructorUsedError;
  BottomSheetState get panelState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NaverMapStateCopyWith<NaverMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaverMapStateCopyWith<$Res> {
  factory $NaverMapStateCopyWith(
          NaverMapState value, $Res Function(NaverMapState) then) =
      _$NaverMapStateCopyWithImpl<$Res, NaverMapState>;
  @useResult
  $Res call(
      {NaverMapController? mapController,
      List<NClusterableMarker> markers,
      String selectedCategory,
      Map<String, NOverlayImage> markerIcons,
      NOverlayImage? selectedMarkerIcon,
      List<NaverMapDataContent> naverMapData,
      List<NaverMapCategoryContent> naverMapCategory,
      String searchValue,
      NaverMapDataContent? selectedMarkerData,
      ScreenState screenState,
      LocationPermissionState locationPermissionState,
      LocationModel currentLocation,
      StreamSubscription<dynamic>? compassSubscription,
      String distance,
      bool myLocation,
      PanelController? panelController,
      bool isPanelImage,
      BottomSheetState panelState});

  $LocationModelCopyWith<$Res> get currentLocation;
}

/// @nodoc
class _$NaverMapStateCopyWithImpl<$Res, $Val extends NaverMapState>
    implements $NaverMapStateCopyWith<$Res> {
  _$NaverMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapController = freezed,
    Object? markers = null,
    Object? selectedCategory = null,
    Object? markerIcons = null,
    Object? selectedMarkerIcon = freezed,
    Object? naverMapData = null,
    Object? naverMapCategory = null,
    Object? searchValue = null,
    Object? selectedMarkerData = freezed,
    Object? screenState = null,
    Object? locationPermissionState = null,
    Object? currentLocation = null,
    Object? compassSubscription = freezed,
    Object? distance = null,
    Object? myLocation = null,
    Object? panelController = freezed,
    Object? isPanelImage = null,
    Object? panelState = null,
  }) {
    return _then(_value.copyWith(
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<NClusterableMarker>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      markerIcons: null == markerIcons
          ? _value.markerIcons
          : markerIcons // ignore: cast_nullable_to_non_nullable
              as Map<String, NOverlayImage>,
      selectedMarkerIcon: freezed == selectedMarkerIcon
          ? _value.selectedMarkerIcon
          : selectedMarkerIcon // ignore: cast_nullable_to_non_nullable
              as NOverlayImage?,
      naverMapData: null == naverMapData
          ? _value.naverMapData
          : naverMapData // ignore: cast_nullable_to_non_nullable
              as List<NaverMapDataContent>,
      naverMapCategory: null == naverMapCategory
          ? _value.naverMapCategory
          : naverMapCategory // ignore: cast_nullable_to_non_nullable
              as List<NaverMapCategoryContent>,
      searchValue: null == searchValue
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as String,
      selectedMarkerData: freezed == selectedMarkerData
          ? _value.selectedMarkerData
          : selectedMarkerData // ignore: cast_nullable_to_non_nullable
              as NaverMapDataContent?,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      locationPermissionState: null == locationPermissionState
          ? _value.locationPermissionState
          : locationPermissionState // ignore: cast_nullable_to_non_nullable
              as LocationPermissionState,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      compassSubscription: freezed == compassSubscription
          ? _value.compassSubscription
          : compassSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      myLocation: null == myLocation
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      panelController: freezed == panelController
          ? _value.panelController
          : panelController // ignore: cast_nullable_to_non_nullable
              as PanelController?,
      isPanelImage: null == isPanelImage
          ? _value.isPanelImage
          : isPanelImage // ignore: cast_nullable_to_non_nullable
              as bool,
      panelState: null == panelState
          ? _value.panelState
          : panelState // ignore: cast_nullable_to_non_nullable
              as BottomSheetState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res> get currentLocation {
    return $LocationModelCopyWith<$Res>(_value.currentLocation, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NaverMapStateImplCopyWith<$Res>
    implements $NaverMapStateCopyWith<$Res> {
  factory _$$NaverMapStateImplCopyWith(
          _$NaverMapStateImpl value, $Res Function(_$NaverMapStateImpl) then) =
      __$$NaverMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NaverMapController? mapController,
      List<NClusterableMarker> markers,
      String selectedCategory,
      Map<String, NOverlayImage> markerIcons,
      NOverlayImage? selectedMarkerIcon,
      List<NaverMapDataContent> naverMapData,
      List<NaverMapCategoryContent> naverMapCategory,
      String searchValue,
      NaverMapDataContent? selectedMarkerData,
      ScreenState screenState,
      LocationPermissionState locationPermissionState,
      LocationModel currentLocation,
      StreamSubscription<dynamic>? compassSubscription,
      String distance,
      bool myLocation,
      PanelController? panelController,
      bool isPanelImage,
      BottomSheetState panelState});

  @override
  $LocationModelCopyWith<$Res> get currentLocation;
}

/// @nodoc
class __$$NaverMapStateImplCopyWithImpl<$Res>
    extends _$NaverMapStateCopyWithImpl<$Res, _$NaverMapStateImpl>
    implements _$$NaverMapStateImplCopyWith<$Res> {
  __$$NaverMapStateImplCopyWithImpl(
      _$NaverMapStateImpl _value, $Res Function(_$NaverMapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapController = freezed,
    Object? markers = null,
    Object? selectedCategory = null,
    Object? markerIcons = null,
    Object? selectedMarkerIcon = freezed,
    Object? naverMapData = null,
    Object? naverMapCategory = null,
    Object? searchValue = null,
    Object? selectedMarkerData = freezed,
    Object? screenState = null,
    Object? locationPermissionState = null,
    Object? currentLocation = null,
    Object? compassSubscription = freezed,
    Object? distance = null,
    Object? myLocation = null,
    Object? panelController = freezed,
    Object? isPanelImage = null,
    Object? panelState = null,
  }) {
    return _then(_$NaverMapStateImpl(
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as NaverMapController?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<NClusterableMarker>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      markerIcons: null == markerIcons
          ? _value._markerIcons
          : markerIcons // ignore: cast_nullable_to_non_nullable
              as Map<String, NOverlayImage>,
      selectedMarkerIcon: freezed == selectedMarkerIcon
          ? _value.selectedMarkerIcon
          : selectedMarkerIcon // ignore: cast_nullable_to_non_nullable
              as NOverlayImage?,
      naverMapData: null == naverMapData
          ? _value._naverMapData
          : naverMapData // ignore: cast_nullable_to_non_nullable
              as List<NaverMapDataContent>,
      naverMapCategory: null == naverMapCategory
          ? _value._naverMapCategory
          : naverMapCategory // ignore: cast_nullable_to_non_nullable
              as List<NaverMapCategoryContent>,
      searchValue: null == searchValue
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as String,
      selectedMarkerData: freezed == selectedMarkerData
          ? _value.selectedMarkerData
          : selectedMarkerData // ignore: cast_nullable_to_non_nullable
              as NaverMapDataContent?,
      screenState: null == screenState
          ? _value.screenState
          : screenState // ignore: cast_nullable_to_non_nullable
              as ScreenState,
      locationPermissionState: null == locationPermissionState
          ? _value.locationPermissionState
          : locationPermissionState // ignore: cast_nullable_to_non_nullable
              as LocationPermissionState,
      currentLocation: null == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      compassSubscription: freezed == compassSubscription
          ? _value.compassSubscription
          : compassSubscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String,
      myLocation: null == myLocation
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      panelController: freezed == panelController
          ? _value.panelController
          : panelController // ignore: cast_nullable_to_non_nullable
              as PanelController?,
      isPanelImage: null == isPanelImage
          ? _value.isPanelImage
          : isPanelImage // ignore: cast_nullable_to_non_nullable
              as bool,
      panelState: null == panelState
          ? _value.panelState
          : panelState // ignore: cast_nullable_to_non_nullable
              as BottomSheetState,
    ));
  }
}

/// @nodoc

class _$NaverMapStateImpl implements _NaverMapState {
  const _$NaverMapStateImpl(
      {this.mapController,
      final List<NClusterableMarker> markers = const [],
      this.selectedCategory = '전체',
      final Map<String, NOverlayImage> markerIcons = const {},
      this.selectedMarkerIcon,
      final List<NaverMapDataContent> naverMapData = const [],
      final List<NaverMapCategoryContent> naverMapCategory = const [],
      this.searchValue = '',
      this.selectedMarkerData,
      this.screenState = ScreenState.loading,
      this.locationPermissionState = LocationPermissionState.notDetermined,
      this.currentLocation = const LocationModel(latitude: 0, longitude: 0),
      this.compassSubscription,
      this.distance = '',
      this.myLocation = false,
      this.panelController,
      this.isPanelImage = false,
      this.panelState = BottomSheetState.closed})
      : _markers = markers,
        _markerIcons = markerIcons,
        _naverMapData = naverMapData,
        _naverMapCategory = naverMapCategory;

  @override
  final NaverMapController? mapController;
  final List<NClusterableMarker> _markers;
  @override
  @JsonKey()
  List<NClusterableMarker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  @JsonKey()
  final String selectedCategory;
  final Map<String, NOverlayImage> _markerIcons;
  @override
  @JsonKey()
  Map<String, NOverlayImage> get markerIcons {
    if (_markerIcons is EqualUnmodifiableMapView) return _markerIcons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_markerIcons);
  }

  @override
  final NOverlayImage? selectedMarkerIcon;
//네이버 맵 데이터와 카테고리
  final List<NaverMapDataContent> _naverMapData;
//네이버 맵 데이터와 카테고리
  @override
  @JsonKey()
  List<NaverMapDataContent> get naverMapData {
    if (_naverMapData is EqualUnmodifiableListView) return _naverMapData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_naverMapData);
  }

  final List<NaverMapCategoryContent> _naverMapCategory;
  @override
  @JsonKey()
  List<NaverMapCategoryContent> get naverMapCategory {
    if (_naverMapCategory is EqualUnmodifiableListView)
      return _naverMapCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_naverMapCategory);
  }

  @override
  @JsonKey()
  final String searchValue;
  @override
  final NaverMapDataContent? selectedMarkerData;
//로딩 상태
  @override
  @JsonKey()
  final ScreenState screenState;
// 현재 위치
  @override
  @JsonKey()
  final LocationPermissionState locationPermissionState;
  @override
  @JsonKey()
  final LocationModel currentLocation;
  @override
  final StreamSubscription<dynamic>? compassSubscription;
  @override
  @JsonKey()
  final String distance;
  @override
  @JsonKey()
  final bool myLocation;
//바텀 시트
  @override
  final PanelController? panelController;
  @override
  @JsonKey()
  final bool isPanelImage;
  @override
  @JsonKey()
  final BottomSheetState panelState;

  @override
  String toString() {
    return 'NaverMapState(mapController: $mapController, markers: $markers, selectedCategory: $selectedCategory, markerIcons: $markerIcons, selectedMarkerIcon: $selectedMarkerIcon, naverMapData: $naverMapData, naverMapCategory: $naverMapCategory, searchValue: $searchValue, selectedMarkerData: $selectedMarkerData, screenState: $screenState, locationPermissionState: $locationPermissionState, currentLocation: $currentLocation, compassSubscription: $compassSubscription, distance: $distance, myLocation: $myLocation, panelController: $panelController, isPanelImage: $isPanelImage, panelState: $panelState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NaverMapStateImpl &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._markerIcons, _markerIcons) &&
            (identical(other.selectedMarkerIcon, selectedMarkerIcon) ||
                other.selectedMarkerIcon == selectedMarkerIcon) &&
            const DeepCollectionEquality()
                .equals(other._naverMapData, _naverMapData) &&
            const DeepCollectionEquality()
                .equals(other._naverMapCategory, _naverMapCategory) &&
            (identical(other.searchValue, searchValue) ||
                other.searchValue == searchValue) &&
            (identical(other.selectedMarkerData, selectedMarkerData) ||
                other.selectedMarkerData == selectedMarkerData) &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState) &&
            (identical(
                    other.locationPermissionState, locationPermissionState) ||
                other.locationPermissionState == locationPermissionState) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.compassSubscription, compassSubscription) ||
                other.compassSubscription == compassSubscription) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.myLocation, myLocation) ||
                other.myLocation == myLocation) &&
            (identical(other.panelController, panelController) ||
                other.panelController == panelController) &&
            (identical(other.isPanelImage, isPanelImage) ||
                other.isPanelImage == isPanelImage) &&
            (identical(other.panelState, panelState) ||
                other.panelState == panelState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mapController,
      const DeepCollectionEquality().hash(_markers),
      selectedCategory,
      const DeepCollectionEquality().hash(_markerIcons),
      selectedMarkerIcon,
      const DeepCollectionEquality().hash(_naverMapData),
      const DeepCollectionEquality().hash(_naverMapCategory),
      searchValue,
      selectedMarkerData,
      screenState,
      locationPermissionState,
      currentLocation,
      compassSubscription,
      distance,
      myLocation,
      panelController,
      isPanelImage,
      panelState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NaverMapStateImplCopyWith<_$NaverMapStateImpl> get copyWith =>
      __$$NaverMapStateImplCopyWithImpl<_$NaverMapStateImpl>(this, _$identity);
}

abstract class _NaverMapState implements NaverMapState {
  const factory _NaverMapState(
      {final NaverMapController? mapController,
      final List<NClusterableMarker> markers,
      final String selectedCategory,
      final Map<String, NOverlayImage> markerIcons,
      final NOverlayImage? selectedMarkerIcon,
      final List<NaverMapDataContent> naverMapData,
      final List<NaverMapCategoryContent> naverMapCategory,
      final String searchValue,
      final NaverMapDataContent? selectedMarkerData,
      final ScreenState screenState,
      final LocationPermissionState locationPermissionState,
      final LocationModel currentLocation,
      final StreamSubscription<dynamic>? compassSubscription,
      final String distance,
      final bool myLocation,
      final PanelController? panelController,
      final bool isPanelImage,
      final BottomSheetState panelState}) = _$NaverMapStateImpl;

  @override
  NaverMapController? get mapController;
  @override
  List<NClusterableMarker> get markers;
  @override
  String get selectedCategory;
  @override
  Map<String, NOverlayImage> get markerIcons;
  @override
  NOverlayImage? get selectedMarkerIcon;
  @override //네이버 맵 데이터와 카테고리
  List<NaverMapDataContent> get naverMapData;
  @override
  List<NaverMapCategoryContent> get naverMapCategory;
  @override
  String get searchValue;
  @override
  NaverMapDataContent? get selectedMarkerData;
  @override //로딩 상태
  ScreenState get screenState;
  @override // 현재 위치
  LocationPermissionState get locationPermissionState;
  @override
  LocationModel get currentLocation;
  @override
  StreamSubscription<dynamic>? get compassSubscription;
  @override
  String get distance;
  @override
  bool get myLocation;
  @override //바텀 시트
  PanelController? get panelController;
  @override
  bool get isPanelImage;
  @override
  BottomSheetState get panelState;
  @override
  @JsonKey(ignore: true)
  _$$NaverMapStateImplCopyWith<_$NaverMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
