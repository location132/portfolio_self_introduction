import 'package:flutter/material.dart';
import 'package:my_dream/Page/9_store_review/9.2_store_review_summary.dart';
import 'package:my_dream/Page/9_store_review/9.3_store_reivew_photo_review.dart';
import 'package:my_dream/Page/9_store_review/9.4_store_review_navigator.dart';
import 'package:my_dream/Page/9_store_review/9.5_store_review_content.dart';
import 'package:my_dream/Page/9_store_review/store_review_dio/store_review_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class StoreReviewContainer extends StatefulWidget {
  const StoreReviewContainer({super.key});

  @override
  State<StoreReviewContainer> createState() => _StoreReviewContainer();
}

class _StoreReviewContainer extends State<StoreReviewContainer> {
  Map<String, dynamic> reviewstatistics = {}; // 리뷰 통계
  Map<String, dynamic> reviews = {}; // 리뷰 내용
  Map<String, dynamic> bestReviews = {}; // 리뷰 내용
  Map<String, dynamic> photoReviews = {}; // 포토리뷰

  bool setScreen = false;
  int loadFinish = 0;
  int marketId = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      marketId = ModalRoute.of(context)!.settings.arguments as int;
      getmarketStatisticsDio(marketId);
    });
  }

  // 리뷰 통계 가져오기
  void getmarketStatisticsDio(int marketId) async {
    reviewstatistics = await marketStatisticsDio(marketId);
    getstoreReviewContentDio(marketId);
    if (reviewstatistics.isNotEmpty) {
      loadScreen();
    }
  }

// 등록된 리뷰 가져오기
  void getstoreReviewContentDio(int marketId) async {
    bestReviews = await bestStoreReviewContentDio(marketId);
    reviews = await storeReviewContentDio(marketId, 'RECENTLY_UPLOAD');
    getstoreReviewPhotoContentDio(marketId);
    if (reviews.isNotEmpty) {
      loadScreen();
    }
  }

  // 등록된 포토리뷰 가져오기
  void getstoreReviewPhotoContentDio(int marketId) async {
    photoReviews = await storeReviewImagesDio(marketId);
    if (reviews.isNotEmpty) {
      loadScreen();
    }
  }

  void loadScreen() async {
    setState(() {
      loadFinish++;
    });

    if (loadFinish == 3) {
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        setScreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: setScreen
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.041),
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: '리뷰',
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            StoreReviewSummary(
                                reviewstatistics: reviewstatistics),
                            const SizedBox(height: 20),
                            StoreReviewPhotoReview(photoReviews: photoReviews),
                            const SizedBox(height: 15),
                            StoreReviewNavigator(reviews: reviews),
                            const SizedBox(height: 10),
                            StoreReviewContent(
                                reviews: reviews, bestReviews: bestReviews)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : LodingGifIfsai(isLoadingFinish: setScreen),
      ),
    );
  }
}
