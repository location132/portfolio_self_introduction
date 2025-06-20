import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/6_search_results_page/search_result_dio/search_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/1.partnership_mainPage/7.1_partnership_request_screen.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart' as getx;

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<Map<String, dynamic>> serverResult = [];
  String _searchText = '';
  bool _isLoading = true;

  //파트너쉽 요청
  List<Map<String, dynamic>> hotPartnership = []; //1
  int total = 0; //2
  List<Map<String, dynamic>> partnershipServerResult = []; //3

  @override
  void initState() {
    super.initState();
    searchResultGetDio();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final searchModel = Provider.of<SearchBarModel>(context);
    if (searchModel.isUserTextController != _searchText) {
      setState(() {
        _isLoading = true;
        serverResult = [];
      });
      searchResultGetDio();
    }
  }

  void searchResultGetDio() async {
    final searchModel = Provider.of<SearchBarModel>(context, listen: false);
    String newSearchText = searchModel.isUserTextController;
    if (_searchText != newSearchText) {
      _searchText = newSearchText;
      setState(() {
        _isLoading = true;
      });
      try {
        serverResult = await searchResultData(newSearchText);
        await Future.delayed(const Duration(milliseconds: 500));
      } catch (e) {
        serverResult = [];
        // 오류 모달창 하빈디자이너한테 말하기
      } finally {
        setState(() {
          _isLoading = false;
        });
      }

      setState(() {});
    }
  }

  //파트너쉽 요청하기
  Future<void> partnershipGetData() async {
    hotPartnership = await partnershiHotData(2); //1
    total = await partnershipTotal(); //2
    partnershipServerResult = await partnershipData(total); //3
  }

  Future<void> _onAddBoxPressed() async {
    await partnershipGetData();

    getx.Get.to(
      () => PartnershipRequestScreen(
          hotPartnership: hotPartnership,
          total: total,
          serverResult: partnershipServerResult),
      transition: getx.Transition.fade,
      duration: const Duration(milliseconds: 700),
    );
  }

  List<String> listItem = [" 최신순", " 인기순", " 거리순"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: !_isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 450),
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.041, right: screenWidth * 0.041),
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.04,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xfff5f5f5), width: 2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: screenHeight * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffdbdbdb),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: DropdownButton<String>(
                            underline: Container(),
                            value: selectedValue,
                            hint: const Text(
                              '최신순',
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff8e8e8e),
                              size: 20,
                            ),
                            style: const TextStyle(
                              color: Color(0xff8e8e8e),
                              fontSize: 13,
                              fontFamily: 'Pretendard',
                            ),
                            items: listItem.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //----------------------------------
                SizedBox(
                  height: screenHeight * 0.006,
                ),
                serverResult.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: serverResult.length,
                        itemBuilder: (context, index) {
                          return searchCard(index);
                        })
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '원하는 업체가 없으신가요?',
                            style: TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _onAddBoxPressed();
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          color: Color(0xff757575),
                                        )),
                                      ),
                                      child: const Text(
                                        '파트너십 요청하러 가기',
                                        style: TextStyle(
                                          color: Color(0xff757575),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget searchCard(int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final subscreenWidth = screenWidth - screenWidth * 0.082;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/StoreDetail',
                arguments: {
                  'marketId': serverResult[index]['marketId'],
                  'isFavorite': false,
                },
              );
            },
            child: Container(
              height: screenHeight * 0.118,
              width: subscreenWidth * 0.99,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 6,
                    offset: Offset(2, 0),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 6,
                    offset: Offset(-2, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  children: [
                    SizedBox(
                        width: screenHeight * 0.118,
                        height: screenHeight * 0.118,
                        child: CachedNetworkImage(
                          imageUrl: serverResult[index]['image'].toString(),
                          fit: BoxFit.cover,
                          memCacheHeight: ((screenHeight * 0.118) *
                                  MediaQuery.of(context).devicePixelRatio)
                              .round(),
                          memCacheWidth: ((screenHeight * 0.118) *
                                  MediaQuery.of(context).devicePixelRatio)
                              .round(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  serverResult[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff111111),
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: subscreenWidth * 0.02),
                                Flexible(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    '현재 지점으로 부터 ${serverResult[index]['distance'].toString()}',
                                    style: const TextStyle(
                                      color: Color(0xff6fbf8a),
                                      fontSize: 13,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(
                              serverResult[index]['description'],
                              style: const TextStyle(
                                color: Color(0xff8e8e8e),
                                fontSize: 13,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '영업시간 : ${serverResult[index]['openTime'].substring(0, 5)} ~ ${serverResult[index]['closeTime'].substring(0, 5)} ㅣ 매주 화요일 휴무',
                              style: const TextStyle(
                                color: Color(0xff111111),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(
                              height: 1,
                              color: Color(0xfff5f5f5),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xff6fbf8a),
                                ),
                                Text(
                                  serverResult[index]['reviewScore']
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: Color(0xff111111),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '리뷰(${serverResult[index]['reviewCount']})',
                                  style: const TextStyle(
                                    color: Color(0xff111111),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    serverResult[index]['eventMessage'],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xfff64f4f),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          (index == serverResult.length - 1)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '원하는 업체가 없으신가요?',
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onAddBoxPressed();
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Color(0xff757575),
                                  )),
                                ),
                                child: const Text(
                                  '파트너십 요청하러 가기',
                                  style: TextStyle(
                                    color: Color(0xff757575),
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
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
