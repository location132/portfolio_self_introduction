import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:my_dream/coreService/widget/bottom_navigation.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Map<String, dynamic> userData = {}; // 사용자 데이터 받기dio
  Map<String, dynamic> userCoupons = {}; // 사용자가 다운로드 받은 쿠폰

  late int couponsLength;
  late int favoriteCount;
  late String? imageUrl;

  // 화면 로딩
  bool _isScreenLoad = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getUserData();
    });
  }

  Future<void> getUserData() async {
    if (mounted) {
      context.read<BottomNavigationModel>().setSelectedTab(3);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<ResetStorePage>(context, listen: false)
            .toggleAllFavoritesToTrue();
      });
      userData = await myPageData();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<ResetMyPage>(context, listen: false)
            .setFavoriteCount(userData['status']['favoriteCount']);
      });
      couponsLength = userData['status']['couponCount']; // coupons.lenth
      favoriteCount =
          userData['status']['favoriteCount']; // favoriteCount.legth
      imageUrl = userData['status']['imageUrl'];

      setState(() {
        _isScreenLoad = true;
      });
    }
  }

  void mycouponCheck() async {
    userCoupons = await myCoupons();
    if (mounted) {
      Navigator.pushNamed(context, '/MyCoupon', arguments: couponsLength);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final favoriteCount = Provider.of<ResetMyPage>(context).isFavoriteCount;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: _isScreenLoad
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child:
                              const CustomAppBar(title: 'MY', backButton: true),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.041),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.047,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xffdbdbdb),
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/MyPageNotice');
                                          },
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.campaign_outlined,
                                                size: 24,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 12),
                                              Flexible(
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '[중요]',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xfff64f4f),
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' 잎사이 사용 관련 공지사항입니다.',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff393939),
                                                          fontFamily:
                                                              'Pretendard',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  style: TextStyle(
                                                    color: Color(0xfff64f4f),
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      MainContainer(
                                        height: screenHeight * 0.245,
                                        content: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.0115,
                                              bottom: screenHeight * 0.0184),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '회원 ID : ${userData['status']['accountId']}',
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'Pretendard',
                                                        color:
                                                            Color(0xffbdbdbd),
                                                        fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          screenWidth * 0.028),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: screenWidth *
                                                            0.086),
                                                    child: SizedBox(
                                                      height:
                                                          screenWidth * 0.21,
                                                      width: screenWidth * 0.21,
                                                      child: imageUrl == null
                                                          ? Image.asset(
                                                              'assets/images/default_image.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            )
                                                          : CachedNetworkImage(
                                                              imageUrl:
                                                                  imageUrl!,
                                                              fit: BoxFit.cover,
                                                              memCacheHeight: ((200) *
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .devicePixelRatio)
                                                                  .round(),
                                                            ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '${userData['status']['email'].toString().substring(0, 4)}***',
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xff111111),
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Pretendard',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Container(
                                                              height: 18,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xff6fbf8a),
                                                                  width: 1.5,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'LV. ${userData['status']['level'].toString()}',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xff6fbf8a),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Pretendard',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          userData['status']
                                                                  ['school']
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff8e8e8e),
                                                            fontFamily:
                                                                'Pretendard',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.023),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            '내 포인트',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff5b5b5b),
                                                              fontFamily:
                                                                  'Pretendard',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.012),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                priceFormatting(
                                                                    '${userData['status']['totalGainPoint']}'),
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xff6fbf8a),
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Pretendard',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              const Text(
                                                                'P',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff6fbf8a),
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      'Pretendard',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.069,
                                                      width: 1.5,
                                                      color: const Color(
                                                          0xffdbdbdb),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            '퀘스트',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff5b5b5b),
                                                              fontFamily:
                                                                  'Pretendard',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      0.006),
                                                          const Icon(
                                                            Icons
                                                                .verified_rounded,
                                                            size: 29,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height:
                                                          screenHeight * 0.069,
                                                      width: 1.5,
                                                      color: const Color(
                                                          0xffdbdbdb),
                                                    ),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/MyPageEvent');
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              '이벤트',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff5b5b5b),
                                                                fontFamily:
                                                                    'Pretendard',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.006),
                                                            Image.asset(
                                                              'assets/images/gift_icon.png',
                                                              width: 29,
                                                              height: 29,
                                                              cacheWidth: 72,
                                                              cacheHeight: 72,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.023),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: screenHeight * 0.115,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x05000000),
                                                    offset: Offset(2, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x05000000),
                                                    offset: Offset(-2, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () {
                                                  mycouponCheck();
                                                },
                                                child: _buildCountItem(
                                                    '쿠폰 보관함',
                                                    couponsLength.toString(),
                                                    Icons
                                                        .confirmation_num_outlined,
                                                    const Color(0xff000000)),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Container(
                                              height: screenHeight * 0.115,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x05000000),
                                                    offset: Offset(2, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0x05000000),
                                                    offset: Offset(-2, 0),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/MyWishlist',
                                                      arguments: favoriteCount);
                                                },
                                                child: _buildCountItem(
                                                    '찜한 목록',
                                                    favoriteCount.toString(),
                                                    Icons.favorite_rounded,
                                                    const Color(0xfff64f4f)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        height: 228,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x05000000),
                                              offset: Offset(2, 0),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                            ),
                                            BoxShadow(
                                              color: Color(0x05000000),
                                              offset: Offset(-2, 0),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              leading:
                                                  const Icon(Icons.credit_card),
                                              title: const Text('주문내역'),
                                              trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Color(0xff757575),
                                                  size: 18),
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    '/MyPageOrderlist');
                                              },
                                            ),
                                            const Divider(
                                                height: 1,
                                                color: Color(0xfff5f5f5)),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.receipt_rounded),
                                              title: const Text('리뷰관리'),
                                              trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Color(0xff757575),
                                                  size: 18),
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/MyPageReview');
                                              },
                                            ),
                                            const Divider(
                                                height: 1,
                                                color: Color(0xfff5f5f5)),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.account_circle_rounded),
                                              title: const Text('내 정보 관리'),
                                              trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Color(0xff757575),
                                                  size: 18),
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/MyPageMyInfo');
                                              },
                                            ),
                                            const Divider(
                                                height: 1,
                                                color: Color(0xfff5f5f5)),
                                            ListTile(
                                              leading: const Icon(
                                                  Icons.headset_mic_outlined),
                                              title: const Text('고객센터'),
                                              trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: Color(0xff757575),
                                                  size: 18),
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    '/MyPageCustomerService'); // 임시연결
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: BottomNavigation(
                                  toggleLoadAndScreenChange: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            AnimatedOpacity(
              opacity: !_isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: LodingGifIfsai(
                isLoadingFinish: _isScreenLoad,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountItem(
      String title, String count, IconData icon, Color iconColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff5b5b5b),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 1.5,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: const Color(0xffdbdbdb),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 5),
            Text(
              '$count개',
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
