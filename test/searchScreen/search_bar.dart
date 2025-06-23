import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_between_leaf/%08mainPage/clang_search_detail/search_dio.dart';
import 'package:team_between_leaf/core_services/SharedPreferences.dart';
import 'package:team_between_leaf/core_services/provider.dart';

class SearchBarClang extends StatefulWidget {
  const SearchBarClang({
    super.key,
  });

  @override
  State<SearchBarClang> createState() => _SearchBarClangState();
}

class _SearchBarClangState extends State<SearchBarClang> {
  PreferencesSearchHistort preferencesSearchHistort =
      PreferencesSearchHistort();
  final TextEditingController _searchBarCupertino = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;
  String saveSearchHistory = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  // 검색창에서의 화면 변화
  void updateSearchScreenState() async {
    if (saveSearchHistory.isNotEmpty) {
      Provider.of<SearchProvider>(context, listen: false).showChangeScreen(
        false,
        false,
        true,
      );
      Provider.of<SearchProvider>(context, listen: false)
          .userSearhValue(saveSearchHistory);
    } else {
      Provider.of<SearchProvider>(context, listen: false).showChangeScreen(
        false,
        true,
        false,
      );
      Provider.of<SearchProvider>(context, listen: false)
          .userSearhValue(saveSearchHistory);
    }
  }

  // 메인화면에서 검색창 초기화
  void updateSearchScreen() {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    bool result = searchProvider.isMainScreenVisible;
    if (result) {
      _searchBarCupertino.text = '';
    }
  }

// 메인화면과 검색화면의 이동
  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      // 검색바 클릭 시 최근 검색어 + 실시간 검색어
      Provider.of<SearchProvider>(context, listen: false)
          .showChangeScreen(false, true, false);
    } else if (!_focusNode.hasFocus) {
      //검색바 벗어낫을 시 메인화면으로 이동
      Provider.of<SearchProvider>(context, listen: false)
          .showChangeScreen(true, false, false);
    }
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _searchBarCupertino.dispose();
    super.dispose();
  }

  // 검색 히스토리 저장
  void setsearchHistory() async {
    bool loginstate =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    List<String> histroyMatch =
        await preferencesSearchHistort.getSearchHistory() ?? [];

    if (saveSearchHistory.isNotEmpty) {
      if (loginstate) {
        await sendSearchHistory(saveSearchHistory); // 서버에 요청 보내기
        var result = await getHistory();
        List<String> clangHistory =
            result.map<String>((item) => item["content"]).toList();
        if (!clangHistory.contains(saveSearchHistory)) {
          await saveHistory(saveSearchHistory);
        }
      } else {
        if (!histroyMatch.contains(saveSearchHistory)) {
          preferencesSearchHistort.setSearchHistory(saveSearchHistory);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.only(left: _isFocused ? 20 : 0),
        child: Column(
          children: [
            Row(
              children: [
                AnimatedOpacity(
                  opacity: _isFocused ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: GestureDetector(
                    onTap: () {
                      _focusNode.unfocus();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(CupertinoIcons.back),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CupertinoSearchTextField(
                      controller: _searchBarCupertino,
                      onTap: () {
                        // 클릭했을 때 초기화
                        updateSearchScreen();
                      },
                      onChanged: (value) {
                        // 입력값 변화 감지
                        saveSearchHistory = value.trim();
                        updateSearchScreenState();
                      },
                      onSubmitted: (value) {
                        // 검색 누르면 저장
                        setsearchHistory();
                      },
                      focusNode: _focusNode,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
