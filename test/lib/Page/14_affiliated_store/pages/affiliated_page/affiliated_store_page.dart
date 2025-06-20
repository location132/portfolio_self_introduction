import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_cubit.dart';
import 'package:my_dream/Page/14_affiliated_store/pages/affiliated_page/affiliated_store_state.dart';
import 'package:my_dream/Page/14_affiliated_store/pages/affiliated_page/widgets/store_container.dart';
import 'package:my_dream/Page/4_main_page/4.2_main_adBanner.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/core/di/injector.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/core/utils/scroll_controller_mixin.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/mypage_filter_button.dart';
import 'package:my_dream/coreService/widget/searchbar.dart';

class AffiliatedStorePage extends StatelessWidget {
  const AffiliatedStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AffiliatedStoreCubit>(),
      child: const AffiliatedStoreView(),
    );
  }
}

class AffiliatedStoreView extends StatefulWidget {
  const AffiliatedStoreView({super.key});

  @override
  State<AffiliatedStoreView> createState() => _AffiliatedStoreViewState();
}

class _AffiliatedStoreViewState extends State<AffiliatedStoreView>
    with ScrollControllerMixin {
  // 무한 스크롤링
  @override
  void onLoadMore() {
    context.read<AffiliatedStoreCubit>().loadMoreStores();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AffiliatedStoreCubit, AffiliatedStoreState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: state.screenState == ScreenState.loaded ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 420),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sw),
                        child: Column(
                          children: [
                            const CustomAppBar(title: '제휴'),
                            const Searchbar(textEditing: '원하는 혜택을 검색해보세요.'),
                            SizedBox(height: 15.sh),
                            MypageFilterButton(
                                selectedFilter: state.selectedFilter,
                                categoryType: 3),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.sh),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.sw),
                                child: Column(
                                  children: [
                                    SizedBox(height: 8.sh),
                                    const MainAddBannerScreen(
                                        bannerHeight: 120),
                                    SizedBox(height: 15.sh),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.stores.length,
                                itemBuilder: (context, index) {
                                  bool lastIndex =
                                      index == state.stores.length - 1;
                                  return StoreContainer(
                                    store: state.stores[index],
                                    lastIndex: lastIndex,
                                  );
                                },
                              ),
                              if (state.isLoadingMore)
                                const LodingGifIfsaiSmall(
                                  isLoadingFinish: false,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: state.screenState == ScreenState.loading ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 420),
                  child: IgnorePointer(
                    ignoring: state.screenState == ScreenState.loaded,
                    child: LodingGifIfsai(
                      isLoadingFinish: state.screenState == ScreenState.loading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
