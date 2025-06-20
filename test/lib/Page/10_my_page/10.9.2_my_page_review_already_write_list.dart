import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰관리 - 작성한리뷰 탭 클릭시 보이는 하단 리스트

class MyPageReviewAlreadyWriteList extends StatefulWidget {
  const MyPageReviewAlreadyWriteList({super.key});

  @override
  State<MyPageReviewAlreadyWriteList> createState() =>
      _MyPageReviewAlreadyWriteListState();
}

class _MyPageReviewAlreadyWriteListState
    extends State<MyPageReviewAlreadyWriteList> {
  final List<Map<String, dynamic>> _reviewList = [
    {
      'storeName': '태권치킨 건대점',
      'imageUrl': 'assets/images/test_ham.jpg',
      'orderDetail': '[BEST]심심바삭 외 1개',
      'price': '16,000원',
      'rating': 5,
      'writeDate': '2024.06.15',
      'content':
          '진짜 너무 맛있어요 엉엉ㅠㅠㅠ 진심 맨날맨날 시켜먹고 싶을 정도로 짱맛있어여 제가 장담하는데 저 여기 단골될 것 같아...'
    },
    {
      'storeName': '짱돌',
      'imageUrl': 'assets/images/test_ham.jpg',
      'orderDetail': '해물파닭 외 1개',
      'price': '16,500원',
      'rating': 5,
      'writeDate': '2024.06.15',
      'content':
          '짱돌은 울 학교서 절대 없어지면 안되는 가게에여,,, 나 진짜 비오는 날에 여기서만 시키잖아요... 사라지면 앙대ㅠㅠㅠ'
    },
    {
      'storeName': '네네치킨',
      'imageUrl': 'assets/images/test_ham.jpg',
      'orderDetail': '[BEST]반반치킨 세트',
      'price': '18,900원',
      'rating': 5,
      'writeDate': '2024.06.15',
      'content': '네네는 역시 반반이죠! 저는 다른건 몰라도 반반치킨 시킬 땐 꼭 네네에서 시켜먹어요! 진짜 강추!!!'
    },
  ];

  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star_rounded,
          size: 22.sw,
          color: index < rating
              ? const Color(0xFFF7CE45)
              : const Color(0xFFDBDBDB),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 19.sh,
        horizontal: 16.sw,
      ),
      itemCount: _reviewList.length,
      itemBuilder: (context, index) {
        final review = _reviewList[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/MyPageReviewDetail',
              arguments: review,
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.sh),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 6,
                  offset: Offset(2, 0),
                ),
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 6,
                  offset: Offset(-2, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80.sw,
                        height: 80.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(review['imageUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.sw),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review['storeName'],
                            style: const TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5.sh),
                          Text(
                            '${review['orderDetail']} ${review['price']}',
                            style: const TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.5.sh),
                  Divider(
                    height: 1.sh,
                    color: const Color(0xFFDBDBDB),
                  ),
                  SizedBox(height: 9.5.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStarRating(review['rating']),
                      Text(
                        '작성일 : ${review['writeDate']}',
                        style: const TextStyle(
                          color: Color(0xFFC1C1C1),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sh),
                  Text(
                    review['content'],
                    style: const TextStyle(
                      color: Color(0xFF5A5A5A),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
