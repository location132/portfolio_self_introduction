import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import '../../coreService/Dialog/my_page_orderlist_delete_dialog.dart';

class MyPageOrderlistDetail extends StatefulWidget {
  const MyPageOrderlistDetail({super.key});

  @override
  State<MyPageOrderlistDetail> createState() => _MyPageOrderlistDetailState();
}

class _MyPageOrderlistDetailState extends State<MyPageOrderlistDetail> {
  Map<String, dynamic> orderlistDetail = {
    'title': '태권치킨 건대점',
    'description': '[BEST]심심바삭 외 1개 16,000원',
    'orderDate': '2024년 6월 14일 금요일 오후 3:23',
    'orderNumber': 'B1NL01S1MB',
    'items': [
      {'name': '[BEST]심장바사삭 1개', 'price': '23,000원'},
      {
        'name': '[사이드메뉴]바삭바삭 치즈볼 1개',
        'option': '기본 치즈볼 5개 세트 구성',
        'price': '3,000원'
      },
    ],
    'orderAmount': '26,000원',
    'couponDiscount': '3,000원',
    'totalAmount': '23,000원',
    'paymentMethod': '카카오페이',
    'storeAddress': '(우편번호)32421 충북 충주시 단월동 240-9 소피아빌 403호',
    'storePhone': '010-5639-6248',
  };
  bool isLoading = false;
  late int orderlistId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderlistId = ModalRoute.of(context)!.settings.arguments as int;
      // getDioOrderlist();
    });
  }

  // void getDioOrderlist() async {
  //   final result = await orderlistDetail(orderlistId);
  //   setState(() {
  //     orderlistDetail = result['status'] ?? {};
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
              child: const CustomAppBar(title: '주문내역'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.041),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.019,
                              left: screenWidth * 0.041,
                              right: screenWidth * 0.041),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderlistDetail['title'] ?? '',
                                style: TextStyle(
                                  color: Color(0xff111111),
                                  fontSize: 20,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                orderlistDetail['description'] ?? '',
                                style: TextStyle(
                                  color: Color(0xff5b5b5b),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                '주문일시 : ${orderlistDetail['orderDate']}',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                '주문번호 : ${orderlistDetail['orderNumber']}',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.021),
                        Container(
                          height: screenHeight * 0.006,
                          color: Color(0xfff5f5f5),
                        ),
                        SizedBox(height: screenHeight * 0.021),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...orderlistDetail['items']
                                  .asMap()
                                  .entries
                                  .map<Widget>((entry) {
                                int idx = entry.key;
                                var item = entry.value;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        color: Color(0xff111111),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                    if (item.containsKey('option'))
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.006),
                                        child: Text(
                                          item['option'],
                                          style: TextStyle(
                                            color: Color(0xff8e8e8e),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: screenHeight * 0.006),
                                    Text(
                                      item['price'],
                                      style: TextStyle(
                                        color: Color(0xff5b5b5b),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                      ),
                                    ),
                                    if (idx <
                                        orderlistDetail['items'].length -
                                            1) ...[
                                      SizedBox(height: screenHeight * 0.023),
                                      Container(
                                        height: screenHeight * 0.001,
                                        color: Color(0xfff5f5f5),
                                      ),
                                      SizedBox(height: screenHeight * 0.023),
                                    ],
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.021),
                        Container(
                          height: screenHeight * 0.006,
                          color: Color(0xfff5f5f5),
                        ),
                        SizedBox(height: screenHeight * 0.021),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '결제금액',
                                style: TextStyle(
                                  color: Color(0xff111111),
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '주문금액',
                                    style: TextStyle(
                                      color: Color(0xff5b5b5b),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  Text(
                                    orderlistDetail['orderAmount'] ?? '',
                                    style: TextStyle(
                                      color: Color(0xff111111),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '쿠폰할인',
                                    style: TextStyle(
                                      color: Color(0xff5b5b5b),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  Text(
                                    orderlistDetail['couponDiscount'] ?? '',
                                    style: TextStyle(
                                      color: Color(0xff6fbf8a),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.023),
                              Container(
                                height: screenHeight * 0.001,
                                color: Color(0xfff5f5f5),
                              ),
                              SizedBox(height: screenHeight * 0.023),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '총 결제금액',
                                    style: TextStyle(
                                      color: Color(0xff111111),
                                      fontSize: 18,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    orderlistDetail['totalAmount'] ?? '',
                                    style: TextStyle(
                                      color: Color(0xff111111),
                                      fontSize: 18,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '결제방법',
                                    style: TextStyle(
                                      color: Color(0xff5b5b5b),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  Text(
                                    orderlistDetail['paymentMethod'] ?? '',
                                    style: TextStyle(
                                      color: Color(0xff111111),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.021),
                        Container(
                          height: screenHeight * 0.006,
                          color: Color(0xfff5f5f5),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '매장주소',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5b5b5b),
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Text(
                                orderlistDetail['storeAddress'] ?? '',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.017),
                              Container(
                                height: screenHeight * 0.001,
                                color: Color(0xfff5f5f5),
                              ),
                              SizedBox(height: screenHeight * 0.017),
                              Text(
                                '매장번호',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5b5b5b),
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.006),
                              Text(
                                orderlistDetail['storePhone'] ?? '',
                                style: TextStyle(
                                  color: Color(0xff8e8e8e),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Container(
                          height: screenHeight * 0.006,
                          color: Color(0xfff5f5f5),
                        ),
                        SizedBox(
                          height: screenHeight * 0.066,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return MyPageOrderlistDeleteDialog();
                                  },
                                );
                              },
                              child: Text(
                                '주문내역 삭제',
                                style: TextStyle(
                                  color: Color(0xfff64f4f),
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
