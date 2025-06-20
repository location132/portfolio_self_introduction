import 'package:flutter/material.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';
import 'package:my_dream/Page/12_naver_map/page/bottom_sheet/bottom_panel.dart';
import 'package:my_dream/Page/12_naver_map/page/widget/naver_map_widget.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/core/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/bottom_navigation.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/Page/12_naver_map/page/widget/search_category_section.dart';
import 'package:my_dream/Page/12_naver_map/page/widget/current_location_button.dart';

class NaverMapAppPage extends StatelessWidget {
  const NaverMapAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<NaverMapCubit>(),
      child: const _NaverMapAppView(),
    );
  }
}

class _NaverMapAppView extends StatefulWidget {
  const _NaverMapAppView();

  @override
  State<_NaverMapAppView> createState() => _NaverMapAppViewState();
}

class _NaverMapAppViewState extends State<_NaverMapAppView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaverMapCubit, NaverMapState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              AnimatedOpacity(
                opacity: state.screenState == ScreenState.loading ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    const CustomAppBar(
                      title: '내 주변 매장',
                      backButton: true,
                      isNaverMap: true,
                    ),
                    const Expanded(
                      child: NaverMapWidget(),
                    ),
                    const BottomNavigation(),
                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),

              // 2. 로딩 화면 (로딩 중일 때만 표시)
              if (state.screenState == ScreenState.loading) ...[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: const LodingGifIfsai(isLoadingFinish: false),
                ),
              ],

              // 3. 나머지 UI 요소들 (로딩이 끝났을 때만 표시)
              IgnorePointer(
                ignoring: state.screenState != ScreenState.loaded,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 85,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity:
                            state.screenState != ScreenState.loaded ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 420),
                        child: SearchCategorySection(
                          onEnter: (value) {
                            context
                                .read<NaverMapCubit>()
                                .updateSearchValue(value, context);
                          },
                          onTap: () {
                            context
                                .read<NaverMapCubit>()
                                .updatePanelState(BottomSheetState.closed);
                          },
                          isNaverMap: true,
                          textBarText: '주변 매장을 검색해보세요',
                          naverMapCategory: state.naverMapCategory,
                          selectedCategory: state.selectedCategory,
                          onCategorySelected: (category) {
                            context
                                .read<NaverMapCubit>()
                                .updateSelectedCategory(category, context);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 70 + MediaQuery.of(context).padding.bottom,
                      child: AnimatedOpacity(
                        opacity:
                            state.screenState != ScreenState.loaded ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 420),
                        child: const CurrentLocationButton(),
                      ),
                    ),
                  ],
                ),
              ),
              // 바텀 패널 시트
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (state.panelState == BottomSheetState.half) ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child:
                            //TODO: gcp 업로드 후 이미지 표시
                            AnimatedOpacity(
                          opacity: state.isPanelImage ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 320),
                          child: Container(
                            height: 80,
                            width: 80,
                            color: Colors.grey,
                            child: const Center(child: Text('사진')),
                          ),
                        ),
                      ),
                    )
                  ],
                  SizedBox(height: 11.sh),
                  const SlidingPanel(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
