import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_dream/Page/8_detail_store/8.1_detail_store_title.dart';
import 'package:my_dream/Page/8_detail_store/8.2_detail_store_notice.dart';
import 'package:my_dream/Page/8_detail_store/8.3_detail_store_event.dart';
import 'package:my_dream/Page/8_detail_store/8.4.1_detail_store_appbarcategory_Icon.dart';
import 'package:my_dream/Page/8_detail_store/8.4_detail_store_appbarcategory.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/store_components/store_menu_category.dart';
import 'package:my_dream/Page/8_detail_store/8.6_detail_coupons.dart';
import 'package:my_dream/Page/8_detail_store/detail_store_dio/detail_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/store_components/store_info_summary.dart';
import 'package:provider/provider.dart';

class StoreDetail extends StatefulWidget {
  const StoreDetail({super.key});

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {};

  Map<String, dynamic> detailStoreInformation = {};
  Map<String, dynamic> detailStoreMenu = {};
  Map<String, dynamic> couponsData = {};

  //-------앱바 애니메이션 -------
  bool _isAppIconsColor = false;
  bool _isAnimationOpacityCategoryBar = false;
  //------- 로딩 완료 ---------
  int _finishCount = 0;
  bool _isScreenLodeFinish = false;
  int couponCount = -1;
  //-------쿠폰 모달창 다시 나오게 하기 (로그인 이후)-----------//

  late final int marketId;
  late final bool myPage;

  final GlobalKey _menuCategoryKey = GlobalKey();

  void _scrollListener() {
    //앱바 아이콘
    final bool appBarIcon = _scrollController.offset >= 220;
    if (_isAppIconsColor != appBarIcon) {
      setState(() {
        _isAppIconsColor = appBarIcon;
      });
    }

    //--------- 메뉴 카테고리 ----------//
    final RenderBox? renderBox =
        _menuCategoryKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final bool shouldShowCategory =
          position.dy <= MediaQuery.of(context).padding.top + 130.sh;

      if (shouldShowCategory != _isAnimationOpacityCategoryBar) {
        setState(() {
          _isAnimationOpacityCategoryBar = shouldShowCategory;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 매개변수로 전달 받는 값
      final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
      marketId = arguments['marketId'] as int;
      myPage = arguments.containsKey('isFavorite')
          ? arguments['isFavorite'] as bool
          : false;
      // 전달 받는 값 끝

      // 데이터 로드 페이지 새로고침 또는 기존 정보 받아오기
      final resetPage = Provider.of<ResetStorePage>(context, listen: F);
      if (resetPage.shouldRefreshFavorite(marketId) &&
          resetPage.shouldRefreshCouponse(marketId)) {
        // 좋아요, 쿠폰이 변경되었을 때 둘다 새로고침
        loadStore(marketId, cacheMemory: 1);
        loadMenu(marketId);
        loadCoupons(marketId, cacheMemory: 1);
      } else if (resetPage.shouldRefreshCouponse(marketId)) {
        // 쿠폰이 변경되었을 때만 새로고침
        loadStore(marketId);
        loadMenu(marketId);
        loadCoupons(marketId, cacheMemory: 1);
      } else if (resetPage.shouldRefreshFavorite(marketId)) {
        // 좋아요가 변경되었을 때만 새로고침
        loadStore(marketId, cacheMemory: 1);
        loadMenu(marketId);
        loadCoupons(marketId);
      } else {
        loadStore(marketId);
        loadMenu(marketId);
        loadCoupons(marketId);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.addListener(_scrollListener);
      });
    });
  }

  void isScreenLoadFinish() async {
    _finishCount++;
    if (_finishCount == 3) {
      final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
      pageRoutesStatus.setRetryStoreDetail(false);

      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        _isScreenLodeFinish = true;
        _finishCount = 0; // 다시 초기화
      });
      _animationController.forward();
    }
  }

// 마켓 정보 상단 정보
  void loadStore(int marketId, {int cacheMemory = 0}) async {
    if (cacheMemory == 1) {
      detailStoreInformation = await detailStoreDio(marketId, cacheMemory: 1);
      Provider.of<ResetStorePage>(context, listen: false)
          .toggleFavorite(marketId, false);
    } else {
      detailStoreInformation = await detailStoreDio(marketId);
    }

    if (detailStoreInformation['closeDays'].toString() == 'null') {
      detailStoreInformation['closeDays'] = '휴무일 없음';
    }
    isScreenLoadFinish();
  }

  // 메뉴 상세정보
  void loadMenu(int marketId, {int cacheMemory = 0}) async {
    if (cacheMemory == 1) {
      detailStoreMenu = await detailStoreMenuDio(marketId, cacheMemory: 1);
      Provider.of<ResetStorePage>(context, listen: false)
          .toggleCouponse(marketId, false);
    } else {
      detailStoreMenu = await detailStoreMenuDio(marketId);
    }
    _initializeCategoryKeys();
    isScreenLoadFinish();
  }

  //쿠폰 정보 같이 받아오기
  void loadCoupons(int marketId, {int cacheMemory = 0}) async {
    if (cacheMemory == 1) {
      couponsData = await loadCouponsData(marketId, cacheMemory: 1);
    } else {
      couponsData = await loadCouponsData(marketId);
    }
    couponCount = marketId;
    isScreenLoadFinish();
  }

  void _initializeCategoryKeys() {
    for (var category in detailStoreMenu['menuCategories']) {
      _categoryKeys[category['classification']] = GlobalKey();
    }
  }

  // 쿠폰 다운로드 페이지 이동
  void handleCouponsDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return DetailCoupons(
            couponsData: couponsData,
            severResult: couponCount,
            loadCoupons: loadCoupons);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageRoutesStatus =
        Provider.of<PageRoutes>(context).isRetryStoreDetail;
    if (pageRoutesStatus && marketId != 0) {
      setState(() {
        _isScreenLodeFinish = false;
      });
      loadStore(marketId, cacheMemory: 1);
      loadMenu(marketId, cacheMemory: 1);
      loadCoupons(marketId, cacheMemory: 1);
    }
    return Scaffold(
      body: _isScreenLodeFinish
          ? FadeTransition(
              opacity: _opacityAnimation,
              child: Stack(
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFFDFDFD),
                        surfaceTintColor: const Color(0xFFFDFDFD),
                        elevation: 0,
                        pinned: true,
                        stretch: true,
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                        expandedHeight: 300,
                        flexibleSpace: FlexibleSpaceBar(
                          stretchModes: const [StretchMode.zoomBackground],
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: detailStoreInformation['marketImg']
                                    .toString(),
                                fit: BoxFit.cover,
                                memCacheHeight: (300 *
                                        MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                                placeholder: (context, url) =>
                                    const Center(child: SizedBox()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                height: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: const Alignment(-0.00, -1.00),
                                      end: const Alignment(0, 1),
                                      colors: [
                                        Colors.black
                                            .withOpacity(0.800000011920929),
                                        Colors.black.withOpacity(0)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            //타이틀
                            DetailStoreTitle(
                              detailStoreInformation: detailStoreInformation,
                              handleCouponsDialog: handleCouponsDialog,
                              marketId: marketId,
                              myPage: myPage,
                            ),
                            // 매장 정보
                            const SizedBox(height: 19.5),
                            const Divider(
                              height: 2,
                              color: Color(0xfff5f5f5),
                            ),
                            const SizedBox(height: 19.5),
                            StoreInfoSummary(
                                detailStoreInformation: detailStoreInformation),
                            const SizedBox(height: 19.5),
                            const Divider(
                              height: 2,
                              color: Color(0xfff5f5f5),
                            ),
                            const SizedBox(height: 19.5),
                            // 공지사항 내용
                            DetailStoreNotice(
                              detailStoreInformation: detailStoreInformation,
                            ),
                            const SizedBox(height: 10),
                            // // 이벤트 내용
                            DetailStoreEvent(
                                detailStoreInformation: detailStoreInformation),
                            const SizedBox(height: 40),
                            // 메뉴 카테고리
                            StoreMenuCategory(
                              key: _menuCategoryKey,
                              detailStoreMenu: detailStoreMenu,
                              categoryKeys: _categoryKeys,
                              marketId: marketId,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 앱바 뒤로가기
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        DetailStoreAppbarcategoryIcon(
                          isAppIconsColor: _isAppIconsColor,
                          detailStoreInformation: detailStoreInformation,
                        ),
                        IgnorePointer(
                          ignoring: !_isAnimationOpacityCategoryBar,
                          child: AnimatedOpacity(
                            opacity: _isAnimationOpacityCategoryBar ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 420),
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  DetailStoreAppbarcategory(
                                    detailStoreMenu: detailStoreMenu,
                                    categoryKeys: _categoryKeys,
                                    scrollController: _scrollController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //--------------------
                ],
              ),
            )
          : LodingGifIfsai(isLoadingFinish: _isScreenLodeFinish),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.removeListener(_scrollListener); // 리스너 제거
    _scrollController.dispose();
    super.dispose();
  }
}
