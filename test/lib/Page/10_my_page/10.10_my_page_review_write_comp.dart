import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰쓰기, 리뷰수정에 사용되는 리뷰 작성 양식 컴포넌트
// 썸네일, 가게정보, 별점, 리뷰내용, 사진첨부하기 버튼까지 포함

class MyPageReviewWriteComp extends StatefulWidget {
  const MyPageReviewWriteComp({super.key});

  @override
  State<MyPageReviewWriteComp> createState() => _MyPageReviewWriteCompState();
}

class _MyPageReviewWriteCompState extends State<MyPageReviewWriteComp> {
  final Map<String, dynamic> _orderData = {
    'storeName': '태권치킨 건대점',
    'imageUrl': 'assets/images/test_ham.jpg',
    'orderDetail': '[BEST]심심바삭 외 1개',
    'price': '16,000원',
  };

  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1;
            });
          },
          child: Container(
            child: Icon(
              Icons.star_outline_rounded,
              size: 48.sw,
              color: index < _rating
                  ? const Color(0xFFF7CE45)
                  : const Color(0xFFC1C1C1),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sw),
      child: Container(
        height: 489.sh,
        padding: EdgeInsets.all(15.sw),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              offset: Offset(2, 0),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Color(0x0C000000),
              offset: Offset(-2, 0),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 가게 정보 섹션
            Row(
              children: [
                Container(
                  width: 80.sw,
                  height: 80.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: AssetImage(_orderData['imageUrl']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.sw),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _orderData['storeName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111111),
                      ),
                    ),
                    SizedBox(height: 5.sh),
                    Text(
                      '${_orderData['orderDetail']} ${_orderData['price']}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        color: Color(0xff5b5b5b),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14.5.sh),
            Divider(
              height: 1.sh,
              color: Color(0xffdbdbdb),
            ),

            // 별점 섹션
            SizedBox(height: 29.5.sh),
            const Center(
              child: Text(
                '별점을 선택해주세요.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  color: Color(0xFF393939),
                ),
              ),
            ),
            SizedBox(height: 15.sh),
            _buildStarRating(),

            // 리뷰 작성 섹션
            SizedBox(height: 20.sh),
            Container(
              height: 160.sh,
              padding: EdgeInsets.all(10.sh),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFFDBDBDB),
                ),
              ),
              child: Stack(
                children: [
                  TextField(
                    controller: _reviewController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: '최소 10자 이상 작성해주세요.',
                      hintStyle: TextStyle(
                        color: Color(0xFF8E8E8E),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Text(
                      '${_reviewController.text.length} / 1,000',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        color: _reviewController.text.isEmpty
                            ? const Color(0xFF5B5B5B)
                            : const Color(0xFF8E8E8E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 사진 첨부 버튼
            SizedBox(height: 20.sh),
            Container(
              width: 331.sw,
              height: 50.sh,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF282828),
                  width: 1.5.sw,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: const Color(0xFF282828),
                  ),
                  SizedBox(width: 8.sw),
                  const Text(
                    '사진 첨부하기',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF282828),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
