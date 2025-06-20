import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';

class NaverMapWidget extends StatefulWidget {
  const NaverMapWidget({super.key});

  @override
  State<NaverMapWidget> createState() => _NaverMapWidgetState();
}

class _NaverMapWidgetState extends State<NaverMapWidget> {
  NOverlayImage? clusterIcon;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NOverlayImage.fromWidget(
              widget: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                      color: Color(0xff6fbf8a), shape: BoxShape.circle)),
              size: const Size(44, 44),
              context: context)
          .then((value) {
        clusterIcon = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaverMapCubit, NaverMapState>(
      builder: (context, state) {
        final cubit = context.read<NaverMapCubit>();
        return NaverMap(
          onMapReady: (controller) {
            context.read<NaverMapCubit>().onMapReady(controller, context);
          },
          onMapTapped: (NPoint point, NLatLng latLng) {
            cubit.resetMarkers();
            cubit.updatePanelState(BottomSheetState.closed);
          },
          options: NaverMapViewOptions(
            buildingHeight: 1.0,
            symbolScale: 0.6,
            mapType: NMapType.basic,
            indoorEnable: false, // 실내지도 비활성화

            rotationGesturesEnable: state.screenState == ScreenState.loaded,
            scrollGesturesEnable: state.screenState == ScreenState.loaded,
            tiltGesturesEnable: state.screenState == ScreenState.loaded,
            zoomGesturesEnable: state.screenState == ScreenState.loaded,
            stopGesturesEnable: state.screenState == ScreenState.loaded,
          ),

          // //클로스터링 옵션
          clusterOptions: NaverMapClusteringOptions(
            enableZoomRange: const NInclusiveRange(0, 20),
            clusterMarkerBuilder: (info, marker) {
              marker
                ..setIcon(clusterIcon!)
                ..setCaption(
                  NOverlayCaption(
                    text: '+ ${info.size}',
                    textSize: 28,
                    color: Colors.white,
                    haloColor: Colors.transparent,
                  ),
                );
            },
            mergeStrategy: const NClusterMergeStrategy(
              maxMergeableScreenDistance: 75,
              willMergedScreenDistance: {
                NInclusiveRange(10, 11): 80,
                NInclusiveRange(12, 14): 40,
              },
            ),
          ),
        );
      },
    );
  }
}
