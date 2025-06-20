import 'package:flutter/material.dart';
import 'package:my_dream/Page/5_search_page/search_dio/search_screen_dio.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class SearchLogicKeywords extends StatefulWidget {
  const SearchLogicKeywords({super.key});

  @override
  State<SearchLogicKeywords> createState() => _SearchLogicKeywordsState();
}

class _SearchLogicKeywordsState extends State<SearchLogicKeywords> {
  bool _isFirstSearchBar = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  // 연관 검색어
  Future<List<String>> relatedSearch() async {
    final searchProvider = Provider.of<SearchBarModel2>(context);
    String searchScreen = searchProvider.userInputForRelatedSearch;
    if (searchScreen.isNotEmpty) {
      List<String> issevervaildate = await sendRelatedSearch(searchScreen);

      if (searchScreen.isNotEmpty && issevervaildate.isNotEmpty) {
        List<String> relatedSearchyeah = issevervaildate;
        searchProvider.previousValueHistory(issevervaildate);
        return relatedSearchyeah;
      } else {
        List<String> prevHistory = searchProvider.previousValue;
        return prevHistory;
      }
    }
    return [];
  }

  // 검색기록 클릭
  void _handleSearchItemTap(String content) async {
    final searchControllerModel =
        Provider.of<SearchBarModel>(context, listen: false);
    final searchProvider = Provider.of<SearchBarModel2>(context, listen: false);
    searchProvider.setUserInputForRelatedSearch('');
    searchProvider.previousValueHistory([]);

    searchControllerModel.setSearchController(content);
    searchControllerModel.setSearchScreenStaus(false);
    searchControllerModel.setFirstTabStatus(true);
    await Future.delayed(const Duration(milliseconds: 120));
    searchControllerModel.setSearchResultsScreen(true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FutureBuilder<List<String>>(
            future: relatedSearch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  _isFirstSearchBar) {
                return const SizedBox();
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Wrap(
                  children: snapshot.data!.map<Widget>((relatedItem) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 4,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _handleSearchItemTap(relatedItem);
                                },
                                style: TextButton.styleFrom(
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      relatedItem,
                                      style: const TextStyle(
                                        color: Color(0xff393939),
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
