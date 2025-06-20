import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/widget/mypage_filter_button.dart';

class MyPageOrderlist extends StatefulWidget {
  const MyPageOrderlist({super.key});

  @override
  State<MyPageOrderlist> createState() => _MyPageOrderlistState();
}

class _MyPageOrderlistState extends State<MyPageOrderlist> {
  bool _isScreenLoad = true; // 임시로 true로 설정하여 디자인 확인
  int _selectedFilter = 0; // 선택된 필터를 저장할 변수 추가
  List<Map<String, dynamic>> orderList = [
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/category_image_bugger.png',
      'title': '태권치킨 건대점',
      'description': '[BEST]심심바삭 외 1개 16,000원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/category_image_bugger.png',
      'title': 'BHC치킨',
      'description': '[BEST]블랙올리브 (기본 1인 세트메뉴) 1개 16,000원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/category_image_bugger.png',
      'title': 'KFC치킨',
      'description': 'KFC치킨 외 1개 16,000원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/category_image_bugger.png',
      'title': '네네치킨',
      'description': '[BEST]네네치킨세트 1개 16,000원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/category_image_bugger.png',
      'title': '짬뽕',
      'description': '[BEST]해물짬뽕 외 1개 16,000원',
      'status': '결제완료'
    },
  ]; // 임시 데이터

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
              child: Column(
                children: [
                  const CustomAppBar(
                    title: '주문내역',
                  ),
                  MypageFilterButton(
                    selectedFilter: _selectedFilter,
                    categoryType: 1,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: _isScreenLoad
                  ? ListView.builder(
                      itemCount: orderList.length,
                      itemBuilder: (context, index) {
                        final order = orderList[index];
                        return Container(
                          height: screenHeight * 0.163,
                          margin: EdgeInsets.only(
                            left: screenHeight * 0.019,
                            right: screenHeight * 0.019,
                            bottom: screenHeight * 0.019,
                          ),
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
                              Container(
                                margin: EdgeInsets.only(
                                  top: screenHeight * 0.012,
                                  left: screenHeight * 0.019,
                                  right: screenHeight * 0.019,
                                  bottom: screenHeight * 0.008,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          order['date'],
                                          style: const TextStyle(
                                            color: Color(0xffc1c1c1),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        const Text(
                                          ' ㅣ ',
                                          style: TextStyle(
                                            color: Color(0xffc1c1c1),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Text(
                                          order['status'],
                                          style: const TextStyle(
                                            color: Color(0xffc1c1c1),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/MyPageOrderlistDetail',
                                            arguments: order);
                                      },
                                      child: const Text(
                                        '주문상세 >',
                                        style: TextStyle(
                                          color: Color(0xff6fbf8a),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: screenHeight * 0.036),
                                decoration: const BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: screenHeight * 0.012,
                                  left: screenHeight * 0.018,
                                  right: screenHeight * 0.018,
                                  bottom: screenHeight * 0.008,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      order['imageUrl'],
                                      width: screenHeight * 0.094,
                                      height: screenHeight * 0.094,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: screenHeight * 0.019),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            order['title'],
                                            style: const TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight * 0.005),
                                          Text(
                                            order['description'],
                                            style: const TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 14,
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
                          ),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
