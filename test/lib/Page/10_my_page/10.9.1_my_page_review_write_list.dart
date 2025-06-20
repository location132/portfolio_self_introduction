import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰관리 - 리뷰쓰기 탭 클릭시 보이는 하단 리스트

class MyPageReviewWriteList extends StatefulWidget {
  const MyPageReviewWriteList({super.key});

  @override
  State<MyPageReviewWriteList> createState() => _MyPageReviewWriteListState();
}

class _MyPageReviewWriteListState extends State<MyPageReviewWriteList> {
  // 주문 목록 데이터
  final List<Map<String, dynamic>> _orderList = [
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/test_ham.jpg',
      'storeName': '태권치킨 건대점',
      'orderDetail': '[BEST]심심바삭 외 1개',
      'price': '16,000원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/test_ham.jpg',
      'storeName': '네네치킨',
      'orderDetail': '[BEST]반반치킨 세트',
      'price': '18,900원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/test_ham.jpg',
      'storeName': '짱돌',
      'orderDetail': '해물파닭 외 1개',
      'price': '16,500원',
      'status': '결제완료'
    },
    {
      'date': '2024.06.14(금)',
      'imageUrl': 'assets/images/test_ham.jpg',
      'storeName': '쭈꾸대장',
      'orderDetail': '철판 쭈꾸미 1인세트',
      'price': '14,000원',
      'status': '결제완료'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.sh, horizontal: 16.sw),
      itemCount: _orderList.length,
      itemBuilder: (context, index) {
        final order = _orderList[index];
        return Container(
          width: 361.sw,
          height: 139.sh,
          margin: EdgeInsets.only(bottom: 15.sh),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              const BoxShadow(
                color: Color(0x0C000000),
                offset: Offset(2, 0),
                blurRadius: 10,
                spreadRadius: 0,
              ),
              const BoxShadow(
                color: Color(0x0C000000),
                offset: Offset(-2, 0),
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.sw, 10.sh, 15.sw, 6.5.sh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${order['date']} ㅣ ${order['status']}',
                      style: const TextStyle(
                        color: Color(0xFFC1C1C1),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sw),
                child: Divider(
                  height: 1.sh,
                  color: const Color(0xFFF5F5F5),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.sw, 9.5.sh, 15.sw, 9.5.sh),
                child: Row(
                  children: [
                    Container(
                      width: 80.sw,
                      height: 80.sh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(order['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.sw),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['storeName'],
                            style: const TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.sh),
                          Text(
                            order['orderDetail'],
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                          Text(
                            order['price'],
                            style: const TextStyle(
                              color: Color(0xFF393939),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 27.sh,
                      width: 69.sw,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF6FBF8A),
                          width: 1.5.sw,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/MyPageReviewWriteBack');
                        },
                        child: const Center(
                          child: Text(
                            '리뷰쓰기',
                            style: TextStyle(
                              color: Color(0xFF6FBF8A),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
