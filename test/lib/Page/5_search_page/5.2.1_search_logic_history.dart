import 'package:flutter/material.dart';
import 'package:my_dream/Page/5_search_page/search_dio/search_screen_dio.dart';
import 'package:my_dream/coreService/Sharedpreferences.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class SearchLogicHistory extends StatefulWidget {
  const SearchLogicHistory({super.key});

  @override
  State<SearchLogicHistory> createState() => _SearchLogicHistoryState();
}

class _SearchLogicHistoryState extends State<SearchLogicHistory> {
  PreferencesSearchHistory preferencesSearchHistory =
      PreferencesSearchHistory();
  bool _showAll = false;
  double _historyOpacity = 1.0;
  bool _isFirstSearchBar = true;
  bool _hasThreeOrMoreRecentSearches = false;
  bool _isRemoveSate = true;
  late Future<List<Map<String, dynamic>>> resultValue;
  List<Map<String, dynamic>> searchHistory = [];
  List<Map<String, dynamic>> searchHistory2 = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  @override
  void initState() {
    super.initState();
    resultValue = getSearchHistoryStatus();
  }

  // 검색기록 더보기
  void seeMoreHistory() async {
    setState(() {
      _showAll = !_showAll;
    });

    bool loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;

    if (loginStatus) {
      // 로그인 상태일 때
      List<Map<String, dynamic>> allHistory = searchHistory;
      setState(() {
        searchHistory2 = _showAll
            ? allHistory.take(10).toList()
            : allHistory.take(3).toList();
        _hasThreeOrMoreRecentSearches = allHistory.length >= 4;
      });
    } else {
      // 로그인하지 않은 상태일 때
      List<String> history =
          await preferencesSearchHistory.getSearchHistory() ?? [];
      List<Map<String, dynamic>> allHistory = history.reversed
          .map((item) => {"content": item, "historyId": ""})
          .toList();

      setState(() {
        searchHistory2 = _showAll
            ? allHistory.take(10).toList()
            : allHistory.take(3).toList();
        _hasThreeOrMoreRecentSearches = history.length >= 4;
      });
    }

    resultValue = Future.value(searchHistory2);
  }

// 검색기록 보여주기
  Future<List<Map<String, dynamic>>> getSearchHistoryStatus() async {
    final searchScreenStatus =
        Provider.of<SearchScreenModel>(context, listen: false);
    bool loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    if (loginStatus) {
      searchHistory = searchScreenStatus.searchHistory!;
      setState(() {
        _hasThreeOrMoreRecentSearches = searchHistory.length >= 4;
      });
      return searchHistory.take(3).toList();
    } else {
      List<String> history =
          await preferencesSearchHistory.getSearchHistory() ?? [];
      searchHistory = history.reversed
          .map((item) => {"content": item, "historyId": ""})
          .toList();
      if (!_showAll) {
        searchHistory = searchHistory.take(3).toList(); // 최대 3개만 보여주기
        setState(() {
          _hasThreeOrMoreRecentSearches = history.length >= 4;
        });
      } else {
        searchHistory = searchHistory.take(10).toList(); // 최대 10개 보여주기
      }
      return searchHistory;
    }
  }

  // 검삭기록 삭제하기
  void removeHistory(var searchItem) async {
    bool loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    setState(() {
      _historyOpacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    if (loginStatus) {
      await deleteSearchHistory(searchItem);
      resultValue = resultValue.then((list) {
        return list.where((item) => item['historyId'] != searchItem).toList();
      });
      setState(() {
        _historyOpacity = 1.0; // 다시 보이게 만들고, 필요하면 검색 기록 없음 메시지 표시
        _showAll = false;
      });
    } else {
      await preferencesSearchHistory.removeSearchHistory(searchItem);
      List<String> updatedHistory =
          await preferencesSearchHistory.getSearchHistory() ?? [];
      setState(() {
        searchHistory = updatedHistory.reversed
            .map((item) => {"content": item, "historyId": ""})
            .toList();
        resultValue = Future.value(searchHistory.take(3).toList());
        _hasThreeOrMoreRecentSearches = updatedHistory.length >= 4;
        _historyOpacity = 1.0;
        _showAll = false;
      });
    }
    setState(() {
      _historyOpacity = 1.0; // 다시 보이게 만들고, 필요하면 검색 기록 없음 메시지 표시
      _showAll = false;
    });
  }

// 검색기록 모두 삭제하기
  void removeAllHistory() async {
    final searchStatus = Provider.of<SearchBarModel>(context, listen: false);

    setState(() {
      _historyOpacity = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      bool loginStatus =
          Provider.of<LoginModel>(context, listen: false).loginStatus;

      if (loginStatus) {
        await deleteAllSearchHistory();
        setState(() {
          resultValue = Future.value([]);
        });
      } else {
        await preferencesSearchHistory.removeAllHistory();
        setState(() {
          searchHistory = [];
          resultValue = Future.value([]);
        });
      }
    }
    setState(() {
      _historyOpacity = 1.0;
      _showAll = false;
      _hasThreeOrMoreRecentSearches = false;
      searchStatus.setRemoveSearchHistory(false);
    });
  }

// 검색기록 클릭
  void _handleSearchItemTap(String content) async {
    final searchControllerModel =
        Provider.of<SearchBarModel>(context, listen: false);
    searchControllerModel.setSearchController(content);
    searchControllerModel.setSearchScreenStaus(false);
    searchControllerModel.setFirstTabStatus(true);
    await Future.delayed(const Duration(milliseconds: 120));
    searchControllerModel.setSearchResultsScreen(true);
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final searchStatus = Provider.of<SearchBarModel>(context);

    if (searchStatus.isRemoveSearchHistory && _isRemoveSate) {
      _isRemoveSate = false;
      removeAllHistory();
    }

    return Column(
      children: [
        AnimatedOpacity(
          opacity: _historyOpacity,
          duration: const Duration(milliseconds: 300),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: resultValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  _isFirstSearchBar) {
                return const SizedBox();
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Column(
                  children: snapshot.data!
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () =>
                                      _handleSearchItemTap(item['content']),
                                  child: SizedBox(
                                    width: screenWidth * 0.65,
                                    child: Text(
                                      item['content'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: IconButton(
                                      onPressed: () {
                                        bool loginstate =
                                            loginStatus.loginStatus;
                                        if (loginstate) {
                                          removeHistory(item['historyId']);
                                        } else {
                                          removeHistory(item["content"]);
                                        }
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.close,
                                        color: Color(0xffc1c1c1),
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                );
              } else {
                return const Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '최근 검색 기록이 없습니다.',
                      style: TextStyle(
                        color: Color(0xff111111),
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }
            },
          ),
        ),
        Visibility(
          visible: _hasThreeOrMoreRecentSearches,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              seeMoreHistory();
            },
            child: !_showAll
                ? const Text(
                    '최근 검색기록 더보기',
                    style: TextStyle(
                      color: Color(0xff6fbf8a),
                      fontFamily: 'Pretendard',
                    ),
                  )
                : const Text(
                    '최근 검색기록 닫기',
                    style: TextStyle(
                      color: Color(0xff6fbf8a),
                      fontFamily: 'Pretendard',
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
