import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/mypage_filter_button.dart';

class MyCoupon extends StatefulWidget {
  const MyCoupon({super.key});

  @override
  State<MyCoupon> createState() => _MyCouponState();
}

class _MyCouponState extends State<MyCoupon> {
  Map<String, dynamic> userCoupons = {}; // 사용자가 다운로드 받은 쿠폰
  bool _isScreenLoad = false;
  int _selectedFilter = 1; // 선택된 필터를 저장할 변수
  late int _isSetDio;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isSetDio = ModalRoute.of(context)!.settings.arguments as int;
      dioGetMyCoupons();
    });
    super.initState();
  }

  void dioGetMyCoupons() async {
    userCoupons = await myCoupons();
    if (userCoupons['status'].length != _isSetDio) {
      setState(() {
        _isScreenLoad = F;
      });
      userCoupons = await myCoupons(cacheMemory: 1);
    }

    setState(() {
      _isScreenLoad = T;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _isScreenLoad
                ? Column(
                    children: [
                      // 상단 고정 부분
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.041),
                        child: Column(
                          children: [
                            const CustomAppBar(title: '쿠폰 보관함'),
                            MypageFilterButton(
                              selectedFilter: _selectedFilter,
                              categoryType: 1,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  '받은 쿠폰 ${userCoupons['status']?.length ?? 0} ',
                                  style: const TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 14,
                                    fontFamily: 'PretendardSemiBold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      // 스크롤 가능한 부분
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              (userCoupons['status'] as List?)?.length ?? 0,
                          itemBuilder: (context, index) {
                            final coupon = userCoupons['status'][index];
                            return Column(
                              children: [
                                const SizedBox(height: 5),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.038),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/StoreDetail',
                                        arguments: {
                                          'marketId': coupon['marketId'],
                                          'isFavorite': false,
                                        },
                                      );
                                    },
                                    child: CouponCard(coupon: coupon),
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      ),
                      // GetNote 위젯
                      if (userCoupons['status']?.length < 3)
                        GetNote(screenWidth: screenWidth),
                    ],
                  )
                : const SizedBox(),
            // 로딩 인디케이터
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
}

// CouponCard 위젯 (기존 쿠폰 카드 내용을 별도의 위젯으로 분리)
class CouponCard extends StatelessWidget {
  final Map<String, dynamic> coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(2, 0),
            blurRadius: 10,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(-2, 0),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 7),
            child: Row(
              children: [
                Text(
                  coupon['couponName'] ?? '쿠폰 이름 없음',
                  style: const TextStyle(
                    color: Color(0xff111111),
                    fontSize: 24,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  '[${coupon['marketName'] ?? '브랜드 이름 없음'} 전용 쿠폰]',
                  style: const TextStyle(
                    color: Color(0xff5b5b5b),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Text(
                  '사용 조건',
                  style: TextStyle(
                    color: Color(0xffc1c1c1),
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  coupon['couponDescription'] ?? '사용 조건 없음',
                  style: const TextStyle(
                    color: Color(0xff8e8e8e),
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  '사용 기한',
                  style: TextStyle(
                    color: Color(0xffc1c1c1),
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 7),
                Text(
                  '24.06.14  23:59 까지',
                  style: TextStyle(
                    color: Color(0xff8e8e8e),
                    fontFamily: 'Pretendard',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 1.5,
              color: Color(0xfff5f5f5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '사용하러 가기',
                  style: TextStyle(
                    color: Color(0xff6fbf8a),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Color(0xff6fbf8a),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetNote extends StatelessWidget {
  const GetNote({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff5f5f5),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.092, top: 15),
        child: const Column(
          children: [
            Row(
              children: [
                Text(
                  '쿠폰 유의사항',
                  style: TextStyle(
                    color: Color(0xff5b5b5b),
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '•쿠폰은 중복 적용이 불가능합니다.\n• 쿠폰의 사용기한 만료 시 자동 삭제되어 사용이 불가능합니다.\n• 브랜드 쿠폰은 해당 브랜드에서 결제 시에만 사용가능합니다.\n• 잎사이 쿠폰은 모든 브랜드에서 사용이 가능합니다.',
                  style: TextStyle(
                    color: Color(0xff8e8e8e),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
