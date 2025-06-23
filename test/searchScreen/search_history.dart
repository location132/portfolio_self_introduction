import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_between_leaf/%08mainPage/clang_search_detail/search_dio.dart';
import 'package:team_between_leaf/%08mainPage/clang_search_detail/search_popularSearches.dart';
import 'package:team_between_leaf/core_services/SharedPreferences.dart';
import 'package:team_between_leaf/core_services/provider.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistory();
}

class _SearchHistory extends State<SearchHistory> {
  PreferencesSearchHistort preferencesSearchHistort =
      PreferencesSearchHistort();
  double _historyOpacity = 1.0;
  bool _isFirstSearchBar = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  // 검색기록 보여주는 화면
  Future<List<Map<String, dynamic>>> clangGetsearchHistory() async {
    bool loginstate =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    if (loginstate) {
      var result = await getHistory();
      List<Map<String, dynamic>> clangHistory = result;
      clangHistory
          .sort((a, b) => a["content"]!.length.compareTo(b["content"]!.length));
      return clangHistory;
    } else {
      // 우리 로컬에서 검색기록 보여주기
      List<String> history =
          await preferencesSearchHistort.getSearchHistory() ?? [];
      List<Map<String, String>> clangHistory =
          history.map((item) => {"content": item, "historyId": ""}).toList();
      //채현이가 익숙한 sort정렬
      clangHistory
          .sort((a, b) => a["content"]!.length.compareTo(b["content"]!.length));
      return clangHistory;
    }
  }

  //검색기록 삭제하는 코드
  void sendRemoveHistory(int historyId) async {
    setState(() {
      _historyOpacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 250), () async {
      await sendremoveHistory(historyId);

      setState(() {
        _historyOpacity = 1.0;
      });
    });
  }

  void removeHistory(String searchItem) async {
    setState(() {
      _historyOpacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 250), () async {
      preferencesSearchHistort.removeSearchHistory(searchItem);
      setState(() {
        _historyOpacity = 1.0;
      });
    });
  }

  //검색 기록 전부 삭제하는 코드
  void removeAllHistory() async {
    setState(() {
      _historyOpacity = 0.0;
    });

    await Future.delayed(const Duration(milliseconds: 300), () async {
      bool loginStatus =
          Provider.of<LoginModel>(context, listen: false).loginStatus;

      if (loginStatus) {
        var serverResult = await clangGetsearchHistory();
        if (serverResult.isNotEmpty) {
          await sendremoveAllHistory();
        }
      } else {
        var localResult = await preferencesSearchHistort.getSearchHistory();
        if (localResult != null && localResult.isNotEmpty) {
          preferencesSearchHistort.removeAllHistory();
        }
      }
      setState(() {
        _historyOpacity = 1.0; // 다시 보이게 만들고, 필요하면 검색 기록 없음 메시지 표시
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<LoginModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
          child: Row(
            children: [
              const Text('최근 검색어',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              TextButton(
                onPressed: removeAllHistory,
                child: const Text(
                  '전체 삭제',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _historyOpacity,
          duration: const Duration(milliseconds: 700), // 0.7초 동안 애니메이션 실행
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: clangGetsearchHistory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  _isFirstSearchBar) {
                return const SizedBox();
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: snapshot.data!
                        .map<Widget>(
                          (searchItem) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextButton(
                              onPressed: () {
                                // 검색 항목 선택시 동작
                              },
                              style: TextButton.styleFrom(
                                side: const BorderSide(color: Colors.blue),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    searchItem["content"]!,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      // 삭제 아이콘 탭시 동작
                                      bool loginstate = loginModel.loginStatus;
                                      if (loginstate) {
                                        sendRemoveHistory(
                                            searchItem["historyId"]);
                                      } else {
                                        removeHistory(searchItem["content"]);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                // 검색 기록이 없을 경우
                return const Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    '최근 검색 기록이 없습니다.',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 5, right: 15),
          child: Row(
            children: [
              Text(
                '인기 검색어',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
