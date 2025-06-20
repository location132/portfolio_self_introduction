// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSearchHistory {
  static const _historyKey = 'hisKey';

// 검색기록 저장
  Future<void> setSearchHistory(String newSearchSave) async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> searchHistory = loadHistory.getStringList(_historyKey) ?? [];
    if (searchHistory.length >= 10) {
      searchHistory.removeAt(0);
    }
    searchHistory.add(newSearchSave);
    await loadHistory.setStringList(_historyKey, searchHistory);
  }

//검색기록 불러오기
  Future<List<String>?> getSearchHistory() async {
    final loadHistory = await SharedPreferences.getInstance();
    return loadHistory.getStringList(_historyKey);
  }

// 검색기록 삭제
  Future<void> removeSearchHistory(String searchItem) async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> clangHistory = loadHistory.getStringList(_historyKey) ?? [];
    clangHistory.removeWhere((item) => item == searchItem);
    await loadHistory.setStringList(_historyKey, clangHistory);
  }

  // 검색기록 모두 삭제
  Future<void> removeAllHistory() async {
    final loadHistory = await SharedPreferences.getInstance();
    List<String> clangHistory = loadHistory.getStringList(_historyKey) ?? [];
    clangHistory.clear();
    await loadHistory.setStringList(_historyKey, clangHistory);
  }
}
