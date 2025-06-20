import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_dream/Page/2_login_page/login_dio/login_dio.dart';
import 'package:my_dream/Page/4_main_page/4.0_main_page.dart';
import 'package:my_dream/Page/5_search_page/search_dio/search_screen_dio.dart';
import 'package:my_dream/Page/6_search_results_page/6_search_results_screen.dart';
import 'package:my_dream/Page/5_search_page/5.1.1_searcscreen.dart';
import 'package:my_dream/Page/4_main_page/4.1_main_logo_searchbar.dart';
import 'package:my_dream/coreService/Shimmer_loading/main_shimmer.dart';
import 'package:my_dream/coreService/core/dio/dio_interceptor_cache.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//스크롤 감지 ---
  final ScrollController _scrollController = ScrollController();
  double _lastScrollPosition = 0;
  DateTime _lastScrollTime = DateTime.now();

  bool _isSearchBarMove = false; // 서치바 (aniContaninal)
  bool _isSearchBarAni = false; // 서치바 (opacity)
  bool _isFirstSearchbarEntry = true; // 서치바 애니메이션 최초 1회 감지

  bool _isLogoMove = false; // 로고 (aniContaninal)
  bool _isLogoAni = false; // 로고 (opacity)
  bool _isFirstLogoEntry = true; // 로고 애니메이션 최초 1회 감지
  bool _jumpScreen = false; // 화면 제일 위로 올리기

// --------- 쉬머 효과
  bool _isLoadFinish = false;
  int _finishCount = 0;
  bool _isScreenChange = true;

// 검색 dio
  List<Map<String, dynamic>> searchDio = [];
//

  OverlayEntry? _overlayEntry;

  DateTime? _lastSearchBarAppearance;

  // void serverConnection() async {
  //   bool result = await connectionServer();
  //   if (!result && mounted) {
  //     handleLoginResult(context);
  //   }
  // }

  void _scrollListener() {
    final searchModelStatus =
        Provider.of<SearchBarModel>(context, listen: false);

    if (!searchModelStatus.isSearchResultsScreen) {
      final now = DateTime.now();
      final scrollDelta = _scrollController.offset - _lastScrollPosition;
      final timeDelta = now.difference(_lastScrollTime).inMilliseconds;

      // 스크롤 속도 계산 (픽셀/밀리초)
      final scrollSpeed = timeDelta > 0 ? scrollDelta.abs() / timeDelta : 0;

      // 서치바가 나타난 후 1초가 지났는지 확인
      bool canHideSearchBar = _lastSearchBarAppearance == null ||
          now.difference(_lastSearchBarAppearance!).inMilliseconds >= 700;

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // 서치바 없어지는 애니메이션
        if (_scrollController.offset > 10 &&
            _isFirstSearchbarEntry &&
            canHideSearchBar &&
            !searchModelStatus.isSearchScreen) {
          upScreenSearchBar();
        }
        // 로고 없어지는 애니메이션
        if (_scrollController.offset > 30 &&
            _isFirstLogoEntry &&
            canHideSearchBar &&
            !searchModelStatus.isSearchScreen) {
          upScreenLogo();
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // 서치바 다시 나타나는 애니메이션
        if (!_isFirstSearchbarEntry &&
            (scrollSpeed > 1.3 || _scrollController.offset < 30)) {
          downScreenSearchBar();
        }
      }

      _lastScrollPosition = _scrollController.offset;
      _lastScrollTime = now;
    }
  }

  @override
  void initState() {
    super.initState();
    // serverConnection();
    _initializeApp();
  }

  // 위치 권한 체크
  // TODO: 위치권한 코어 서비스 파일로 리펙터링
  Future<void> _initializeApp() async {
    // await checkLocationPermission();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.addListener(_scrollListener);
        getDioSearchValue();
      });
    }
  }

  void getDioSearchValue() async {
    final loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;

    final searchScreenStatus =
        Provider.of<SearchScreenModel>(context, listen: false);
    if (loginStatus) {
      // 검색 히스토리 불러오기
      searchDio = await recentSearch();
      searchScreenStatus.setStartSearch(searchDio);
      //인기검색어 불러오기
      searchDio = await popularSearches();
      searchScreenStatus.setPopularSearches(searchDio);
      _incrementFinishCount();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener); // 리스너 제거
    _scrollController.dispose();
    super.dispose();
  }

//사용자가 화면을 아래로 스크롤 시, 로고 애니메이션
  void upScreenLogo() {
    setState(() {
      // 제어 장치
      _isFirstLogoEntry = false;
      _isLogoMove = true;
      _isLogoAni = true;
      _jumpScreen = true;
    });
  }

//사용자가 화면을 아래로 스크롤 시, 서치바 애니메이션
  void upScreenSearchBar() {
    setState(() {
      // 제어 장치
      _isFirstSearchbarEntry = false;
      _isSearchBarMove = true;
      _isSearchBarAni = true;
    });
  }

  // 사용자가 화면을 위로 스크롤 시, 서치바 나오기
  void downScreenSearchBar() {
    setState(() {
      _isSearchBarMove = false;
      _isSearchBarAni = false;
      _isLogoMove = false;
      _isLogoAni = false;
      _jumpScreen = false;

      _isFirstSearchbarEntry = true;
      _isFirstLogoEntry = true;
      _lastSearchBarAppearance = DateTime.now();
    });
  }

  // 화면 제일 위로 올리기
  void _jumpToTop() {
    setState(() {
      _jumpScreen = false;
    });
    downScreenSearchBar();
    _scrollController.jumpTo(0); // 즉시 최상단으로 스크롤
  }

// -----------검색 창 화면 나오기 --------------------------
  void toggleSearchScreen(bool isSearchScreen) {
    final searchModel = Provider.of<SearchBarModel>(context, listen: false);

    if (isSearchScreen) {
      downScreenSearchBar();
      searchModel.setSearchScreenStaus(true);
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return MainSearcscreen(onClose: _removeOverlayEntry);
        },
      );
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

// 뒤로가기 아이콘 검색창 닫기
  void _isIconButton({int retry = 0}) async {
    final searchModelStatus =
        Provider.of<SearchBarModel>(context, listen: false);
    final searchScreenStatus =
        Provider.of<SearchScreenModel>(context, listen: false);

    if (searchModelStatus.isresultSearchAni) {
      if (searchModelStatus.isSearchScreen) {
        _closeSearchScreen();
        //인기검색어 불러오기
        searchDio = await popularSearches();
        searchScreenStatus.setPopularSearches(searchDio);
      } else if (searchModelStatus.isSearchResultsScreen &&
          !searchModelStatus.isSearchScreen) {
        searchModelStatus.setSearchResultsScreen(false);
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 410));
      if (searchModelStatus.isresultSearchAni) {
        if (searchModelStatus.isSearchScreen) {
          _closeSearchScreen();
        } else if (searchModelStatus.isSearchResultsScreen &&
            !searchModelStatus.isSearchScreen) {
          searchModelStatus.setSearchResultsScreen(false);
        }
      } else {
        if (retry == 0) {
          return _isIconButton(retry: 1);
        }
      }
    }
  }

// 검색창 닫기
  void _closeSearchScreen() {
    final searchModel = Provider.of<SearchBarModel>(context, listen: false);
    searchModel.setSearchScreenStaus(false);
    searchModel.setFirstTabStatus(true);
  }

  void _removeOverlayEntry() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

// 쉬머효과 메인 로딩 완료
  void _isMainLoadingComplete() async {
    setState(() {
      _isLoadFinish = true;
    });
  }

  void _incrementFinishCount() {
    final loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;

    int finishRequired = loginStatus ? 2 : 1;

    setState(() {
      _finishCount++;
      if (_finishCount == finishRequired) {
        _isMainLoadingComplete();
      }
    });
  }

  void toggleLoadAndScreenChange() {
    setState(() {
      _isLoadFinish = !_isLoadFinish;
      _isScreenChange = !_isScreenChange;
    });
  }

  //-----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final searchModelStatus = Provider.of<SearchBarModel>(context);

    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Center(
                child: Stack(
                  children: [
                    IgnorePointer(
                      ignoring: !_isLoadFinish,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 420),
                        opacity: _isLoadFinish ? 1.0 : 0.0,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 360),
                                  margin: EdgeInsets.only(
                                      top: _isFirstSearchbarEntry
                                          ? screenHeight * 0.125
                                          : _isFirstLogoEntry
                                              ? screenHeight * 0.04
                                              : screenHeight * 0.0),
                                  child: const SizedBox(),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    child: IgnorePointer(
                                      ignoring: searchModelStatus
                                          .isSearchResultsScreen, // 검색 결과 화면이 활성화되면 메인 화면의 입력을 무시
                                      child: AnimatedOpacity(
                                        opacity: searchModelStatus
                                                .isSearchResultsScreen
                                            ? 0
                                            : 1,
                                        duration:
                                            const Duration(milliseconds: 450),
                                        child:
                                            // 메인화면 페이지
                                            MainPage(
                                          onLoadingComplete:
                                              (bool isLoadingComplete) {
                                            _incrementFinishCount();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // 검색 결과 화면으로 전환
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: IgnorePointer(
                                ignoring: !searchModelStatus
                                    .isSearchResultsScreen, // 검색 결과 화면이 활성화되면 메인 화면의 입력을 무시
                                child: AnimatedOpacity(
                                  opacity:
                                      searchModelStatus.isSearchResultsScreen
                                          ? 1
                                          : 0,
                                  duration: const Duration(milliseconds: 450),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: _isFirstSearchbarEntry
                                                ? screenHeight * 0.125
                                                : _isFirstLogoEntry
                                                    ? screenHeight * 0.04
                                                    : screenHeight * 0.0),
                                        child: const SizedBox(),
                                      ),
                                      Visibility(
                                        visible: searchModelStatus
                                            .isSearchResultsScreen,
                                        maintainState: searchModelStatus
                                            .isSearchResultsScreen,
                                        child: const SearchResultsScreen(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // 로고와 검색창 시작
                            Positioned(
                              top: -20,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.041,
                                    right: screenWidth * 0.041),
                                child: Column(
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 360),
                                      margin: EdgeInsets.only(
                                          top: _isLogoMove ? 0 : 20),
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 210),
                                        opacity: _isLogoAni ? 0.0 : 1.0,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: AnimatedOpacity(
                                                opacity: searchModelStatus
                                                            .isSearchScreen ||
                                                        searchModelStatus
                                                            .isSearchResultsScreen
                                                    ? 1
                                                    : 0,
                                                duration: const Duration(
                                                    milliseconds: 210),
                                                child: IgnorePointer(
                                                  ignoring: !(searchModelStatus
                                                          .isSearchScreen ||
                                                      searchModelStatus
                                                          .isSearchResultsScreen),
                                                  child: SizedBox(
                                                    height: 24,
                                                    width: 24,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons
                                                              .arrow_back_ios_rounded,
                                                          size: 24),
                                                      onPressed: () {
                                                        _isIconButton();
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        splashFactory: NoSplash
                                                            .splashFactory,
                                                      ),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: screenWidth * 0.295),
                                            IgnorePointer(
                                              ignoring: _isLogoAni,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {
                                                  searchModelStatus
                                                      .setSearchResultsScreen(
                                                          false);
                                                },
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 25,
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await clearAllMemoryCache(); //캐시 초기화
                                                        ifsaiLogout(); // 토큰 삭제
                                                        if (mounted) {
                                                          Provider.of<SearchBarModel>(
                                                                  context,
                                                                  listen: false)
                                                              .setFirstTabStatus(
                                                                  true);

                                                          final loginModelStatus =
                                                              Provider.of<
                                                                      LoginModel>(
                                                                  context,
                                                                  listen:
                                                                      false);
                                                          final joinModelStatus =
                                                              Provider.of<
                                                                      JoinModel>(
                                                                  context,
                                                                  listen:
                                                                      false);

                                                          loginModelStatus
                                                              .setloginStatus(
                                                                  false);
                                                          loginModelStatus
                                                              .setBasketCount(
                                                                  0);
                                                          joinModelStatus
                                                              .setIsFirstClickSNSLogin(
                                                                  true);
                                                          loginModelStatus
                                                              .setOnProfileImageReceived(
                                                                  '');
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/StartPage');
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/ifSaiLogo.png',
                                                        width: 70,
                                                        cacheWidth: (70 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .devicePixelRatio)
                                                            .round(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            ////------------------------
                            Positioned(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: screenWidth * 0.041,
                                  right: screenWidth * 0.041,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: screenHeight * 0.035),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 210),
                                      margin: EdgeInsets.only(
                                          top: _isSearchBarMove ? 0 : 20),
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 210),
                                        opacity: _isSearchBarAni ? 0.0 : 1.0,
                                        child: IgnorePointer(
                                          ignoring: _isSearchBarAni,
                                          child: MainSearchBarScreen(
                                              searchScreen: toggleSearchScreen),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //-------------------------
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: BottomNavigation(
                                toggleLoadAndScreenChange:
                                    toggleLoadAndScreenChange,
                              ),
                            ),
                            Positioned(
                              right: 20,
                              bottom: 70,
                              child: Visibility(
                                visible: _isScreenChange,
                                child: IgnorePointer(
                                  ignoring: !_jumpScreen,
                                  child: AnimatedOpacity(
                                    opacity: _jumpScreen ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 400),
                                    child: FloatingActionButton(
                                      heroTag: "fab2",
                                      onPressed: _jumpToTop,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      shape: const CircleBorder(),
                                      child: const Icon(
                                        Icons.arrow_upward,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: _isLoadFinish,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 420),
                        opacity: !_isLoadFinish && _isScreenChange ? 1.0 : 0.0,
                        child: const MainShimmer(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
