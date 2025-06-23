import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_between_leaf/%08mainPage/clang_search_detail/search_dio.dart';
import 'package:team_between_leaf/core_services/provider.dart';

class SearchRelated extends StatefulWidget {
  const SearchRelated({super.key});

  @override
  State<SearchRelated> createState() => _SearchRelated();
}

class _SearchRelated extends State<SearchRelated> {
  bool _isFirstSearchBar = true;
  double _isOpacity = 1.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  // 연관 검색어
  Future<List<String>> relatedSearch() async {
    final searchProvider = Provider.of<SearchProvider>(context);
    String searchScreen = searchProvider.isUserSearchValue;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        FutureBuilder<List<String>>(
          future: relatedSearch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                _isFirstSearchBar) {
              return const SizedBox();
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return AnimatedOpacity(
                opacity: _isOpacity,
                duration: const Duration(milliseconds: 50),
                child: Wrap(
                  children: snapshot.data!.map<Widget>((relatedItem) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              relatedItem,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}


// 서버 연결
