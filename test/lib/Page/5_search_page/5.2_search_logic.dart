import 'package:flutter/material.dart';
import 'package:my_dream/Page/5_search_page/5.2.1_search_logic_history.dart';
import 'package:my_dream/Page/5_search_page/5.2.2_search_logic_keywords.dart';
import 'package:my_dream/Page/5_search_page/5.2.3_search_logic_category.dart';
import 'package:my_dream/Page/5_search_page/5.2.4_search_logic_trending.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

class SearchLogic extends StatefulWidget {
  const SearchLogic({super.key});

  @override
  State<SearchLogic> createState() => _SearchLogicState();
}

class _SearchLogicState extends State<SearchLogic> {
  String getKoreanTimeFormatted() {
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 9));
    String formattedDate = '${now.month.toString().padLeft(2, '0')}.'
        '${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:00 기준';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchStatus = Provider.of<SearchBarModel>(context, listen: false);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Column(
            children: [
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '최근 검색어',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontFamily: 'PretendardSemiBold',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      searchStatus.setRemoveSearchHistory(true);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                  color: Color(0xff8e8e8e),
                                )),
                              ),
                              child: const Text(
                                '전체 삭제',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 2,
                color: Color(0xfff5f5f5),
              ),
              const SizedBox(height: 13),
              const SearchLogicHistory(),
              const SizedBox(height: 13),
            ],
          ),
        ),
        Container(
          height: 10,
          decoration: const BoxDecoration(
            color: Color(0xfff5f5f5),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    '추천 검색어',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontFamily: 'PretendardSemiBold',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SearchLogicKeywords(),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    '카테고리',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontFamily: 'PretendardSemiBold',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              const SearchLogicCategory(),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '인기 검색어',
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontFamily: 'PretendardSemiBold',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    getKoreanTimeFormatted(),
                    style: const TextStyle(
                      color: Color(0xff8e8e8e),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              const Divider(
                height: 1.5,
                color: Color(0xfff5f5f5),
              ),
              const SearchLogicTrending(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
