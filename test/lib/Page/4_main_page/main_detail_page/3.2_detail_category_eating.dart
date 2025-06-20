import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/paginationIndicator.dart';
import 'package:my_dream/coreService/widget/searchbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailCategoryEating extends StatefulWidget {
  const DetailCategoryEating({super.key});

  @override
  State<DetailCategoryEating> createState() => _DetailCategoryEatingState();
}

class _DetailCategoryEatingState extends State<DetailCategoryEating> {
  List<Map<String, dynamic>> serverResult = [];
  bool _isLoadingFinish = false;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    allStoreGetDio();
  }

  List<String> listItem = [" 최신순", " 인기순", " 거리순"];
  String? selectedValue;

  void allStoreGetDio() async {
    serverResult = await mainScreenNewStore();
    setState(() {
      _isLoadingFinish = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _isLoadingFinish ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: _isLoadingFinish
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.041,
                              right: screenWidth * 0.041),
                          child: Column(
                            children: [
                              const CustomAppBar(title: '식음료'),
                              const Searchbar(textEditing: '원하는 스토어를 검색해보세요.'),
                              SizedBox(height: screenHeight * 0.0175),
                              // ------------최신순 - 인기순 - 거리순 ---------------//
                              Row(
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
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 5),
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
                              SizedBox(height: screenHeight * 0.0175),
                            ],
                          ),
                        ),
                        //----------- 리스트 뷸더------------------
                        Expanded(
                          child: ListView.builder(
                            itemCount: serverResult.length,
                            itemBuilder: (context, index) {
                              bool lastIndex = index == serverResult.length - 1;
                              return newStoreContainer(
                                  serverResult[index], lastIndex);
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            AnimatedOpacity(
              opacity: !_isLoadingFinish ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: LodingGifIfsai(
                isLoadingFinish: _isLoadingFinish,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //리스트 뷸더
  Widget newStoreContainer(Map<String, dynamic> store, bool lastIndex) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.125,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color(0x0c000000).withOpacity(0.01),
                      const Color(0x0c000000).withOpacity(0.01),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.12,
                  decoration: BoxDecoration(
                    color: const Color(0xfffdfdfd),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(2, 0),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x0c000000),
                        offset: Offset(-2, 0),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4)),
                            child: CachedNetworkImage(
                              imageUrl: store['marketImage'],
                              fit: BoxFit.cover,
                              width: screenHeight * 0.12,
                              height: screenHeight * 0.12,
                              memCacheHeight: ((screenHeight * 0.12) *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: screenWidth * 0.55,
                                        ),
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: store['marketName']
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Color(0xff111111),
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: SizedBox(
                                                    width: screenWidth * 0.012),
                                              ),
                                              const TextSpan(
                                                text: '현재 위치에서 계산하기',
                                                style: TextStyle(
                                                  color: Color(0xff6fbf8a),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      'PretendardSemiBold',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenWidth * 0.007),
                                  Row(
                                    children: [
                                      Text(
                                        '${store['marketDescription']}',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xff5b5b5b),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenWidth * 0.009),
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Row(
                                      children: [
                                        Text(
                                          '영업시간: ${store['openTime']} ',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0xff393939),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Text(
                                          '~ ${store['closeTime']} | ${store['closedDays']}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0xff393939),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.0075),
                                  const Divider(
                                    height: 1,
                                    color: Color(0xfff5f5f5),
                                  ),
                                  SizedBox(height: screenWidth * 0.006),
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xfffdd835),
                                          size: 18,
                                        ),
                                        Text(
                                          store['averageReviewScore']
                                              .toString()
                                              .substring(0, 3),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Text(
                                          ' 리뷰(${store['reviewCount']}) ',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${store['eventMessage']}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xfff64f4f),
                                              fontSize: 10,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.02),
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
          ),
        ),
        SizedBox(height: screenHeight * 0.0083),
        lastIndex
            ? PaginationIndicator(
                currentPage: currentPage,
                totalPages: 10,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                  // TODO: 여기에 페이지 변경 시 데이터를 새로 불러오는 로직 추가
                },
              )
            : const SizedBox()
      ],
    );
  }
}
