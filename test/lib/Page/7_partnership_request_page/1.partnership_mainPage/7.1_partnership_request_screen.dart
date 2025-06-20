//파트너쉽 요청하러 가기 버튼 눌렀을 때 나오는 페이지//

/*
1. new, hot, normal에 따라서 데이터 나누기
2. 한페이지에 10개씩 나오도록 nextPage() 함수를 작성
3. + 아이콘을 누르면 파트너쉽 요청 글쓰기 페이지로 이동
*/

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/1.partnership_mainPage/7.1.1._partnership_request_category.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/bottom_navigation.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/searchbar.dart';
import 'package:provider/provider.dart';

class PartnershipRequestScreen extends StatefulWidget {
  final List<Map<String, dynamic>> hotPartnership; //1
  final int total; //2
  final List<Map<String, dynamic>> serverResult; //3

  const PartnershipRequestScreen(
      {super.key,
      required this.hotPartnership,
      required this.total,
      required this.serverResult});

  @override
  State<PartnershipRequestScreen> createState() =>
      _PartnershipRequestScreenState();
}

class _PartnershipRequestScreenState extends State<PartnershipRequestScreen> {
  List<Map<String, dynamic>> serverResult = []; //3
  List<Map<String, dynamic>> originalServerResult = [];
  List<Map<String, dynamic>> hotPartnership = []; //1
  List<Map<String, dynamic>> showFirstPageData = [];
  List<Map<String, dynamic>> showNextPageData = [];
  List<Map<String, dynamic>> searchResultData = [];
  final ScrollController _scrollController = ScrollController();

  String searchKeyword = '';
  bool _isFinish = false;
  bool _isFirstPage = true;
  bool _isSearchPage = false;
  int total = 0; //2
  int retotal = 0; //2
  int pageNum = 1;
  int hotAndNewCount = 0;
  int standartNum = 0;
  int saveNum = 0;
  bool _showFloatingButton = false;
  bool _isLoading = false;
  late int length; // 파트너쉽 랭스

  @override
  void initState() {
    super.initState();
    initialAssignment();
    partnershipDistributionData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    if (_scrollController.offset > 30) {
      if (!_showFloatingButton) {
        setState(() {
          _showFloatingButton = true;
        });
      }
    } else {
      if (_showFloatingButton) {
        setState(() {
          _showFloatingButton = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 처음에 메인에서 받아온 데이터 할당하기
  void initialAssignment() {
    total = widget.total;
    serverResult = widget.serverResult;
    hotPartnership = widget.hotPartnership;
  }

  // 파트너쉽 새로고침
  Future<void> onRefresh() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    retotal = await partnershipTotal(cacheMemory: 1);

    if (total != retotal) {
      print('새로고침 실행 중');
      total = retotal;
      serverResult = await partnershipData(retotal, cacheMemory: 1);
      hotPartnership = await partnershiHotData(2, cacheMemory: 1);
      partnershipDistributionData();
    }
    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() {
      _isLoading = false;
    });
  }

  List<Map<String, dynamic>> deepCopyList(List<Map<String, dynamic>> original) {
    return original.map((item) => Map<String, dynamic>.from(item)).toList();
  } // 깊은 복사하기 위해서 생성

  //hot 데이터 원본에서 삭제, 검색할 때 쓰이는 originalSeverResult에 원본 데이터 전달, 첫번째 페이지에 보이는 showFirstPageData 전달
  void partnershipDistributionData() async {
    originalServerResult = deepCopyList(serverResult); // 서버에서 받은 기존 데이터 저장

    //전체 데이터에서 hot 데이터 삭제하기
    serverResult.removeWhere((result) => hotPartnership
        .any((item) => item['partnerRequestId'] == result['partnerRequestId']));

    // 첫번째 페이지에 나오는 8개 데이터(hot 데이터 미포함)
    if (serverResult.length >= 8) {
      showFirstPageData = serverResult.sublist(0, 10 - hotPartnership.length);
    } else {
      showFirstPageData = serverResult.sublist(0);
    }

    setState(() {
      _isFinish = true;
    });
  }

  bool nextPage(int page) {
    int startIndex = showFirstPageData.length + 10 * (page - 2);
    int endIndex = showFirstPageData.length + 10 * (page - 1);

    // 인덱스 범위가 유효한지 확인
    if (startIndex > serverResult.length) {
      return false;
    }
    if (startIndex < 0) startIndex = 0;
    if (endIndex > serverResult.length) endIndex = serverResult.length;

    // 다음 페이지에 10개 이상의 데이터가 있으면 실행
    if (serverResult.length >= endIndex) {
      showNextPageData = serverResult.sublist(startIndex, endIndex);
      return true;
    }
    // 다음 페이지에 데이터가 10개 미만인 경우 실행
    else if (serverResult.length > startIndex) {
      showNextPageData = serverResult.sublist(startIndex);
      return true;
    } else {
      return false;
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  //검색 완료 후
  void isUserSearch(String value) async {
    if (value.isEmpty) {
      setState(() {
        if (pageNum == 1) {
          _isFirstPage = true;
        }

        _isSearchPage = false;
        searchResultData = List.from(originalServerResult); // 원래 리스트로 복원
      });
    } else {
      List<Map<String, dynamic>> filteredStores =
          originalServerResult.where((partnershipRequest) {
        String title = partnershipRequest['marketName'].toString();
        String description = partnershipRequest['description'].toString();
        return _matchesSearch(title, value) ||
            _matchesSearch(description, value);
      }).toList();

      setState(() {
        searchResultData = filteredStores;
        _isSearchPage = true;
        _isFirstPage = false;
      });
    }
  }

  bool _matchesSearch(String text, String search) {
    text = text.toLowerCase();
    search = search.toLowerCase();

    // 완전 일치 검색
    if (text.contains(search)) {
      return true;
    }

    // 초성 검색
    String textChosung = _getChosung(text);
    String searchChosung = _getChosung(search);
    if (textChosung.contains(searchChosung)) {
      return true;
    }

    // 부분 일치 검색 (2글자 이상일 때)
    if (search.length >= 2) {
      for (int i = 0; i < search.length - 1; i++) {
        if (text.contains(search.substring(i, i + 2))) {
          return true;
        }
      }
    }

    return false;
  }

  String _getChosung(String text) {
    const chosungList = [
      'ㄱ',
      'ㄲ',
      'ㄴ',
      'ㄷ',
      'ㄸ',
      'ㄹ',
      'ㅁ',
      'ㅂ',
      'ㅃ',
      'ㅅ',
      'ㅆ',
      'ㅇ',
      'ㅈ',
      'ㅉ',
      'ㅊ',
      'ㅋ',
      'ㅌ',
      'ㅍ',
      'ㅎ'
    ];
    String result = '';
    for (int i = 0; i < text.length; i++) {
      int code = text.codeUnitAt(i);
      if (code >= 44032 && code <= 55203) {
        int chosung = ((code - 44032) ~/ 588);
        result += chosungList[chosung];
      } else {
        result += text[i];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            if (_isFinish)
              Column(
                children: [
                  // 앱바
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.041, right: screenWidth * 0.041),
                    child: Column(
                      children: [
                        const CustomAppBar(
                          title: '파트너쉽 요청',
                        ),
                        Searchbar(
                          textEditing: '검색어를 입력해주세요.',
                          onChanged: isUserSearch,
                        ),
                        const SizedBox(height: 21),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomRefreshIndicator(
                      onRefresh: onRefresh,
                      builder: (
                        BuildContext context,
                        Widget child,
                        IndicatorController controller,
                      ) {
                        return Stack(
                          children: <Widget>[
                            AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget? _) {
                                return Positioned(
                                  top: -125 + controller.value * 100,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 100,
                                    child: LodingGifIfsaiTop(
                                        isLoadingFinish: !_isLoading),
                                  ),
                                );
                              },
                            ),
                            AnimatedBuilder(
                              builder: (context, _) {
                                return Transform.translate(
                                  offset: Offset(0.0, controller.value * 60),
                                  child: child,
                                );
                              },
                              animation: controller,
                            ),
                          ],
                        );
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            // 파트너쉽 요청 핫
                            if (_isFirstPage)
                              PartnershipRequestHot(
                                hotData: hotPartnership,
                              ),
                            //-------------
                            SizedBox(height: screenHeight * 0.012),
                            //첫번째 페이지에 보이는 데이터
                            if (_isFirstPage && !_isSearchPage)
                              PartnershipRequestNewAndNormal(
                                  serverData: showFirstPageData),
                            if (!_isFirstPage && !_isSearchPage)
                              PartnershipRequestNewAndNormal(
                                  serverData: showNextPageData),
                            //검색결과 데이터
                            if (_isSearchPage)
                              PartnershipRequestNewAndNormal(
                                  serverData: searchResultData),
                            const SizedBox(height: 23),
                            !_isSearchPage
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          if (standartNum != 0) {
                                            setState(() {
                                              if (nextPage(standartNum)) {
                                                standartNum -= 3;
                                                pageNum = standartNum + 3;
                                              }
                                              _scrollToTop();
                                            });
                                          }
                                        },
                                        child: const Icon(
                                          Icons.keyboard_arrow_left,
                                          size: 20,
                                          color: Color(0xffc1c1c1),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          pageNum = standartNum + 1;
                                          if (pageNum == 1) {
                                            setState(() {
                                              _isFirstPage = true;
                                            });
                                          } else {
                                            if (nextPage(pageNum)) {
                                              setState(() {
                                                _isFirstPage = false;
                                              });
                                            }
                                          }
                                          _scrollToTop();
                                        },
                                        child: Text(
                                          '${standartNum + 1}',
                                          style: TextStyle(
                                            color: pageNum == standartNum + 1
                                                ? const Color(0xff6fbf8a)
                                                : const Color(0xff8e8e8e),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          saveNum = pageNum;
                                          pageNum = standartNum + 2;
                                          if (nextPage(pageNum)) {
                                            setState(() {
                                              _isFirstPage = false;
                                            });
                                            _scrollToTop();
                                          } else {
                                            pageNum = saveNum;
                                          }
                                        },
                                        child: Text(
                                          '${standartNum + 2}',
                                          style: TextStyle(
                                            color: pageNum == standartNum + 2
                                                ? const Color(0xff6fbf8a)
                                                : const Color(0xff8e8e8e),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          saveNum = pageNum;
                                          pageNum = standartNum + 3;
                                          if (nextPage(pageNum)) {
                                            setState(() {
                                              _isFirstPage = false;
                                            });
                                            _scrollToTop();
                                          } else {
                                            pageNum = saveNum;
                                          }
                                        },
                                        child: Text(
                                          '${standartNum + 3}',
                                          style: TextStyle(
                                            color: pageNum == standartNum + 3
                                                ? const Color(0xff6fbf8a)
                                                : const Color(0xff8e8e8e),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            if (nextPage(standartNum + 4)) {
                                              standartNum += 3;
                                              pageNum = standartNum + 1;
                                              _isFirstPage = false;
                                              _scrollToTop();
                                            }
                                          });
                                        },
                                        child: const Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 20,
                                          color: Color(0xffc1c1c1),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            while (nextPage(standartNum + 4)) {
                                              standartNum += 3;
                                              pageNum = standartNum + 1;
                                              _isFirstPage = false;
                                            }
                                            _scrollToTop();
                                          });
                                        },
                                        child: const Icon(
                                          Icons.keyboard_double_arrow_right,
                                          size: 20,
                                          color: Color(0xffc1c1c1),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              const SizedBox(),
            Positioned(
              right: 20,
              bottom: 70,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 420),
                opacity: _isFinish && _showFloatingButton ? 1.0 : 0.0,
                child: IgnorePointer(
                  ignoring: !_showFloatingButton,
                  child: FloatingActionButton(
                    heroTag: "fab1",
                    onPressed: () {
                      _scrollToTop();
                    },
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
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              right: 20,
              bottom: _showFloatingButton ? 135 : 70,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 420),
                opacity: _isFinish ? 1.0 : 0.0,
                child: FloatingActionButton(
                  heroTag: "fab2",
                  onPressed: () async {
                    if (loginStatus.loginStatus && loginStatus.isStudent) {
                      final result = await Navigator.pushNamed(
                          context, '/PartnershipRequestForm');
                      if (result == true) {
                        onRefresh();
                        _scrollToTop();
                      }
                    } else if (!loginStatus.loginStatus) {
                      showLoginDialog(context, LoginDialogType.login);
                    } else {
                      showLoginDialog(context, LoginDialogType.studentAuth);
                    }
                  },
                  backgroundColor: const Color(0xff6fbf8a),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: screenWidth,
                child: Column(
                  children: [
                    BottomNavigation(
                        toggleLoadAndScreenChange: () {}, forcedoutput: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
