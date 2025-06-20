import 'package:flutter/material.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:my_dream/coreService/Dialog/my_page_review_delete_dialog.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';

// 마이페이지 리뷰상세

class MyPageReviewDetail extends StatelessWidget {
  const MyPageReviewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // 전달받은 리뷰 데이터
    final Map<String, dynamic> review =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // 리뷰 데이터 포맷팅
    final Map<String, dynamic> _reviewData = {
      'storeName': review['storeName'],
      'imageUrl': review['imageUrl'],
      'orderInfo': '${review['orderDetail']} ${review['price']}',
      'rating': review['rating'],
      'writeDate': review['writeDate'],
      'content': review['content'],
      'reviewImages': List.generate(4, (index) => review['imageUrl']),
      'likeCount': 134, // 기본값 또는 API에서 받아올 값
    };

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            // 커스텀 앱바
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sw),
              child: Stack(
                children: [
                  const CustomAppBar(
                    title: '리뷰상세',
                  ),
                  Positioned(
                    top: 7.sh,
                    right: 0,
                    child: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Color(0xFF111111),
                      ),
                      onSelected: (value) async {
                        if (value == 'edit') {
                          // 수정하기 페이지로 이동
                          Navigator.pushNamed(
                            context,
                            '/MyPageReviewFixBack',
                            arguments: review,
                          );
                        } else if (value == 'delete') {
                          // 커스텀 삭제 다이얼로그 표시
                          final result = await showDialog<bool>(
                            context: context,
                            builder: (context) =>
                                const MyPageReviewDeleteDialog(),
                          );

                          if (result == true) {
                            // 삭제 처리 후 이전 페이지로 이동
                            Navigator.pop(context);
                          }
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text(
                            '수정하기',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              color: Color(0xFF5A5A5A),
                            ),
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text(
                            '삭제하기',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              color: Color(0xFF5A5A5A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 리뷰 상세 내용
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 18.sw,
                    right: 18.sw,
                    top: 10.sh,
                  ),
                  child: Container(
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
                          // 매장 정보
                          Row(
                            children: [
                              Container(
                                width: 80.sw,
                                height: 80.sh,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                    image: AssetImage(_reviewData['imageUrl']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.sw),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _reviewData['storeName'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF111111),
                                    ),
                                  ),
                                  SizedBox(height: 5.sh),
                                  Text(
                                    _reviewData['orderInfo'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      color: Color(0xFF5A5A5A),
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
                          SizedBox(height: 9.5.sh),
                          // 별점과 작성일
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                  _reviewData['rating'],
                                  (index) => Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFF7CE45),
                                    size: 22.sw,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '작성일 : ${_reviewData['writeDate']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  color: Color(0xFFC1C1C1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.sh),
                          // 리뷰 내용
                          Text(
                            _reviewData['content'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              color: Color(0xFF5A5A5A),
                            ),
                          ),

                          SizedBox(height: 15.sh),

                          // 리뷰 이미지
                          Wrap(
                            spacing: 5.sw,
                            runSpacing: 5.sh,
                            children: _reviewData['reviewImages']
                                .map<Widget>((imageUrl) => Container(
                                      width: 75.sw,
                                      height: 75.sh,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        image: DecorationImage(
                                          image: AssetImage(imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),

                          SizedBox(height: 11.3.sh),

                          // 좋아요 버튼
                          Row(
                            children: [
                              Icon(
                                Icons.thumb_up_outlined,
                                color: Color(0xFFC1C1C1),
                                size: 20.sw,
                              ),
                              SizedBox(width: 5.8.sw),
                              Text(
                                _reviewData['likeCount'].toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  color: Color(0xFF8E8E8E),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
