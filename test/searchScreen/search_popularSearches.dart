import 'package:flutter/material.dart';
import 'package:team_between_leaf/%08mainPage/clang_search_detail/search_dio.dart';

class popularSearches extends StatefulWidget {
  const popularSearches({super.key});

  @override
  State<popularSearches> createState() => _popularSearchesState();
}

class _popularSearchesState extends State<popularSearches> {
  bool _isFirstSearchBar = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isFirstSearchBar = false;
  }

  // 인기 검색어 보여주는 화면
  Future<List<String>> popularSearches() async {
    print('실행');
    String userSearch = '';
    List<String> clangPopularSearches = await sendRelatedSearch(userSearch);
    return clangPopularSearches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: popularSearches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            _isFirstSearchBar) {
          return const SizedBox();
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: snapshot.data!.map<Widget>((popularItem) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          side: const BorderSide(color: Colors.blue)),
                      child: Text(popularItem)),
                );
              }).toList(),
            ),
          );
        } else {
          return const Text('    \n     오늘의 인기검색어를 만들어주세요!');
        }
      },
    );
  }
}
