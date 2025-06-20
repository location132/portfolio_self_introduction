import 'package:flutter/material.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class SearchLogicTrending extends StatefulWidget {
  const SearchLogicTrending({super.key});

  @override
  State<SearchLogicTrending> createState() => _SearchLogicTrendingState();
}

class _SearchLogicTrendingState extends State<SearchLogicTrending> {
  @override
  Widget build(BuildContext context) {
    final searchScreenModel =
        Provider.of<SearchScreenModel>(context, listen: false);
    final popularSearches = searchScreenModel.popularSearches;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 10),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.39,
            child: popularSearches == null || popularSearches.isEmpty
                ? const Center(
                    child: Text(
                      '인기 검색어가 없습니다.\n검색을 통해 인기검색어를 만들어주세요!',
                      style: TextStyle(
                        color: Color(0xff393939),
                        fontFamily: 'PretendardSemiBold',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: popularSearches.length,
                    itemBuilder: (context, index) {
                      final searchItem = popularSearches[index]['value0'] ?? '';
                      final searcRank = popularSearches[index]['value1'] ?? '';

                      return Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Color(0xff393939),
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              searchItem,
                              style: const TextStyle(
                                color: Color(0xff393939),
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const Spacer(),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Visibility(
                                    visible: searcRank.toString() == '0',
                                    child: Container(
                                      width: 10,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible:
                                      searcRank.toString() == ('-${index + 1}'),
                                  child: const Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Color(0xff6fbf8a),
                                      fontSize: 10,
                                      fontFamily: 'PretendardBold',
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: searcRank.toString() !=
                                          ('-${index + 1}') &&
                                      searcRank < 0,
                                  child: const Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: Color(0xff8e8e8e),
                                  ),
                                ),
                                Visibility(
                                  visible: searcRank.toString() !=
                                          ('-${index + 1}') &&
                                      searcRank > 0,
                                  child: const Icon(
                                    Icons.arrow_drop_up_rounded,
                                    color: Color(0xfff64f4f),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
