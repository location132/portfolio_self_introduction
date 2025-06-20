import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/9_store_review/9.8_store_review_content_dialog.dart';
import 'package:my_dream/Page/9_store_review/store_review_dio/store_review_dio.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class StoreReviewPhotoReviewDetail extends StatefulWidget {
  const StoreReviewPhotoReviewDetail({super.key});

  @override
  State<StoreReviewPhotoReviewDetail> createState() =>
      _StoreReviewPhotoReviewDetailState();
}

class _StoreReviewPhotoReviewDetailState
    extends State<StoreReviewPhotoReviewDetail> {
  List<Map<String, dynamic>> photoUri = [];
  Map<String, dynamic> reviews = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<Map<String, dynamic>> args = ModalRoute.of(context)!
          .settings
          .arguments as List<Map<String, dynamic>>;
      setState(() {
        photoUri = args;
      });
    });
  }

  void photoReviewDetails(int reviewId) async {
    reviews = await fetchReviewDio(reviewId);
    if (reviews['statusCode']) {
      if (mounted) {
        handlereviewsIMG(
            context, reviews['review'], reviews['review']['images'].length);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
              child: Column(
                children: [
                  const Column(
                    children: [
                      CustomAppBar(
                        title: '포토리뷰 모아보기',
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "전체 ${photoUri.length}",
                      style: const TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: photoUri.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      photoReviewDetails(photoUri[index]['reviewId']);
                    },
                    child: CachedNetworkImage(
                      imageUrl: photoUri[index]['image'].toString(),
                      fit: BoxFit.cover,
                      memCacheHeight: ((screenHeight * 0.11) *
                              MediaQuery.of(context).devicePixelRatio)
                          .round(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
