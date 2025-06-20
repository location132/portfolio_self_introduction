import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoreReviewPhotoReview extends StatefulWidget {
  final Map<String, dynamic> photoReviews;
  const StoreReviewPhotoReview({super.key, required this.photoReviews});

  @override
  State<StoreReviewPhotoReview> createState() => _StoreReviewPhotoReview();
}

class _StoreReviewPhotoReview extends State<StoreReviewPhotoReview> {
  List<Map<String, dynamic>> photoUri = [];
  Map<String, dynamic> reviews = {};

  @override
  void initState() {
    super.initState();
    imageProcessing();
  }

  void imageProcessing() {
    List<Map<String, dynamic>> imagesWithId = [];

    if (widget.photoReviews['photoreviews'].isNotEmpty) {
      for (var review in widget.photoReviews['photoreviews']) {
        for (var image in review['reviewImages']) {
          imagesWithId
              .add({'image': image['image'], 'reviewId': review['reviewId']});
        }
      }
    }
    setState(() {
      photoUri = imagesWithId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageSize =
        (screenWidth - (screenWidth * 0.041 * 2) - (8 * 2) - (5 * 5)) / 4;

    return photoUri.isNotEmpty
        ? Container(
            width: double.infinity,
            height: screenHeight * 0.153,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xfff5f5f5),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '포토리뷰 모아보기',
                    style: TextStyle(
                      color: Color(0xff393939),
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                      child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                    itemCount: photoUri.length,
                    itemBuilder: (context, index) {
                      if (index == 3) {
                        // 4번째 아이템 처리
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/StoreReviewPhotoReviewDetail',
                                arguments: photoUri);
                          },
                          child: SizedBox(
                            width: imageSize,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: photoUri[3]['image'],
                                    fit: BoxFit.cover,
                                    memCacheWidth: (imageSize *
                                            MediaQuery.of(context)
                                                .devicePixelRatio)
                                        .round(),
                                    memCacheHeight: (imageSize *
                                            MediaQuery.of(context)
                                                .devicePixelRatio)
                                        .round(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1, sigmaY: 1),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.6),
                                        child: const Center(
                                          child: Text(
                                            '더보기',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        // 일반 아이템 처리
                        return Row(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/StoreReviewPhotoReviewDetail',
                                    arguments: photoUri);
                              },
                              child: SizedBox(
                                width: imageSize,
                                height: imageSize,
                                child: CachedNetworkImage(
                                  imageUrl: photoUri[index]['image'],
                                  fit: BoxFit.cover,
                                  memCacheWidth: (imageSize *
                                          MediaQuery.of(context)
                                              .devicePixelRatio)
                                      .round(),
                                  memCacheHeight: (imageSize *
                                          MediaQuery.of(context)
                                              .devicePixelRatio)
                                      .round(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        );
                      }
                    },
                  ))
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
