import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/4.2_main_adBanner.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';

class DetailTop12 extends StatefulWidget {
  const DetailTop12({super.key});

  @override
  State<DetailTop12> createState() => _DetailTop12State();
}

class _DetailTop12State extends State<DetailTop12> {
  List<Map<String, dynamic>> serverResult = [];
  @override
  void initState() {
    super.initState();
    top12GetDio();
  }

  void top12GetDio() async {
    serverResult = await mainScreenTop12();
    setState(() {});
  }

  Widget detailTop12({required int number}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.07, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            child: (number + 1) < 4
                ? Text(
                    (number + 1).toString(),
                    softWrap: false,
                    style: const TextStyle(
                      color: Color(0xff282828),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    (number + 1).toString(),
                    softWrap: false,
                    style: const TextStyle(
                      color: Color.fromARGB(219, 219, 219, 219),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
          SizedBox(
              width: (number + 1) < 10
                  ? screenWidth * 0.04
                  : screenWidth * 0.0355),
          SizedBox(
            height: screenWidth * 0.204,
            width: screenWidth * 0.204,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: serverResult[number]['market0'].toString(),
                  fit: BoxFit.cover,
                  memCacheHeight: ((screenWidth * 0.204) *
                          MediaQuery.of(context).devicePixelRatio)
                      .round(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
          SizedBox(
            width: screenWidth * 0.047,
          ),
          SizedBox(
            width: screenWidth * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Text(
                  serverResult[number]['market1'].toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff111111),
                    fontSize: 17,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  serverResult[number]['market2'].toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff8e8e8e),
                    fontFamily: 'Pretendard',
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 14,
                      color: Color(0xfff7ce45),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      serverResult[number]['market3'].toStringAsFixed(1),
                      style: const TextStyle(
                        color: Color(0xff111111),
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '리뷰(${serverResult[number]['market4'].toString()})',
                      style: const TextStyle(
                        color: Color(0xff111111),
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 30,
            color: Color.fromARGB(219, 219, 219, 219),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: const Text("스토어 순위"),
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: serverResult.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.041,
                        right: screenWidth * 0.041,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          const MainAddBannerScreen(bannerHeight: 140),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            height: screenHeight * 0.12,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: InkWell(
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
                              child: detailTop12(
                                number: index,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.013,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.041,
                        right: screenWidth * 0.041,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: screenHeight * 0.12,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 15,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: InkWell(
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
                              child: detailTop12(
                                number: index,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.013,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
