import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_dream/Page/10_my_page/10_my_page.dart';
import 'package:my_dream/Page/12_naver_map/service/naver_map_overlay.dart';
import 'package:my_dream/Page/15_invite_page/15.1_invite_detail_page.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart' as getx;

class BottomNavigation extends StatefulWidget {
  final Function? toggleLoadAndScreenChange;
  final bool? forcedoutput;
  const BottomNavigation(
      {super.key, this.toggleLoadAndScreenChange, this.forcedoutput});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;

  //파트너쉽 요청
  List<Map<String, dynamic>> hotPartnership = []; //1
  int total = 0; //2
  List<Map<String, dynamic>> serverResult = []; //3

  @override
  void initState() {
    _selectedTab = context.read<BottomNavigationModel>().selectedTab;
    super.initState();
  }

  // 홈 버튼 클릭
  void _onHomePressed() {
    final bottomNavigationModel = context.read<BottomNavigationModel>();
    final naverMapProvider = context.read<NaverMapProvider>();

    if (naverMapProvider.isNaverMapOpacity) {
      // 네이버맵 오버레이 숨기기
      context.read<NaverMapProvider>().setIsNaverMapOpacity(false);
      NaverMapOverlayService().hideNaverMap();
    }

    if (bottomNavigationModel.selectedTab != 0) {
      bottomNavigationModel.setSelectedTab(0);

      Navigator.popUntil(
        context,
        (route) {
          return route.settings.name == '/MainScreen';
        },
      );
    }
  }

  // 네이버 지도 버튼 클릭
  void _onLocationPressed() {
    final naverMapProvider = context.read<NaverMapProvider>();
    final bottomNavigationModel = context.read<BottomNavigationModel>();

    // 탭 상태 변경 체크
    if (_selectedTab != 1) {
      bottomNavigationModel.setSelectedTab(1);
    }

    // 네이버맵 오버레이 상태 체크
    if (!naverMapProvider.isNaverMapOpacity) {
      context.read<NaverMapProvider>().setIsNaverMapOpacity(true);
      NaverMapOverlayService().showNaverMap(context);
    }
  }

  // 파트너쉽
  // Future<void> _onAddBoxPressed() async {
  //   // 네이버맵 오버레이 상태 체크
  //   if (context.read<NaverMapProvider>().isNaverMapOpacity) {
  //     context.read<NaverMapProvider>().setIsNaverMapOpacity(false);
  //     NaverMapOverlayService().hideNaverMap();
  //   }

  //   // 파트너십 화면 전환 체크
  //   if (_selectedTab != 2) {
  //     Navigator.popUntil(
  //       context,
  //       (route) => route.settings.name == '/MainScreen',
  //     );
  //     context.read<BottomNavigationModel>().setSelectedTab(2);

  //     await partnershipGetData();
  //     if (mounted) {
  //       setState(() {
  //         widget.toggleLoadAndScreenChange?.call();
  //       });
  //       getx.Get.to(
  //         () => PartnershipRequestScreen(
  //             hotPartnership: hotPartnership,
  //             total: total,
  //             serverResult: serverResult),
  //         transition: getx.Transition.fade,
  //         duration: const Duration(milliseconds: 700),
  //       );
  //     }
  //     await Future.delayed(const Duration(seconds: 1));
  //     if (mounted) {
  //       // 여기에도 mounted 체크 추가
  //       setState(() {
  //         _selectedTab = _selectedTab;
  //         widget.toggleLoadAndScreenChange?.call();
  //       });
  //     }
  //   }
  // }

  Future<void> _onAddBoxPressed() async {
    // 네이버맵 오버레이 상태 체크
    if (context.read<NaverMapProvider>().isNaverMapOpacity) {
      context.read<NaverMapProvider>().setIsNaverMapOpacity(false);
      NaverMapOverlayService().hideNaverMap();
    }

    // 파트너십 화면 전환 체크
    if (_selectedTab != 2) {
      Navigator.popUntil(
        context,
        (route) => route.settings.name == '/MainScreen',
      );
      context.read<BottomNavigationModel>().setSelectedTab(2);

      if (mounted) {
        getx.Get.to(
          () => const MyInvitePage(),
          transition: getx.Transition.fade,
          duration: const Duration(milliseconds: 700),
        );
      }
    }
  }

  Future<void> partnershipGetData() async {
    hotPartnership = await partnershiHotData(2); //1
    total = await partnershipTotal(); //2
    serverResult = await partnershipData(total); //3
  }

  // 마이페이지 이동
  void _onPersonPressed() {
    final naverMapProvider = context.read<NaverMapProvider>();

    // 네이버맵 오버레이 상태 체크
    if (naverMapProvider.isNaverMapOpacity) {
      context.read<NaverMapProvider>().setIsNaverMapOpacity(false);
      NaverMapOverlayService().hideNaverMap();
    }

    // 마이페이지 화면 전환 체크
    if (_selectedTab != 3) {
      Navigator.popUntil(
        context,
        (route) => route.settings.name == '/MainScreen',
      );
      context.read<BottomNavigationModel>().setSelectedTab(3);

      if (mounted) {
        getx.Get.to(
          () => const MyPage(),
          transition: getx.Transition.fade,
          duration: const Duration(milliseconds: 700),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchModelStatus = Provider.of<SearchBarModel>(context);
    final loginState = Provider.of<LoginModel>(context).loginStatus;
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    final bottomNavigationModel = Provider.of<BottomNavigationModel>(context);

    return IgnorePointer(
      ignoring: searchModelStatus.isSearchResultsScreen,
      child: AnimatedOpacity(
        opacity: widget.forcedoutput == true
            ? 1
            : (searchModelStatus.isSearchResultsScreen ? 0 : 1),
        duration: const Duration(milliseconds: 450),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Container(
            decoration: ShapeDecoration(
              color: const Color(0xFFFDFDFD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color.fromARGB(24, 107, 107, 107),
                  blurRadius: 4,
                  offset: Offset(0, -4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.home_filled,
                    size: 32,
                    color: bottomNavigationModel.selectedTab == 0
                        ? const Color(0xff6fbf8a)
                        : const Color(0xffc1c1c1),
                  ),
                  onPressed: _onHomePressed,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.location_on_rounded,
                    size: 32,
                    color: bottomNavigationModel.selectedTab == 1
                        ? const Color(0xff6fbf8a)
                        : const Color(0xffc1c1c1),
                  ),
                  onPressed: _onLocationPressed,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.mail_outline_rounded,
                    size: 32,
                    color: _selectedTab == 2
                        ? const Color(0xff6fbf8a)
                        : const Color(0xffc1c1c1),
                  ),
                  onPressed: _onAddBoxPressed,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    size: 32,
                    color: _selectedTab == 3
                        ? const Color(0xff6fbf8a)
                        : const Color(0xffc1c1c1),
                  ),
                  onPressed: () {
                    // 마이페이지로 넘거가는 버튼 분기 처리
                    if (loginState) {
                      _onPersonPressed();
                    } else {
                      pageRoutesStatus.setPageController('/MyPage');
                      showLoginDialog(context, LoginDialogType.login);
                    }
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
