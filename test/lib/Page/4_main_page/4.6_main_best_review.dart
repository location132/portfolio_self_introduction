import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/4.6.1_main_best_review_contauner.dart';
import 'package:my_dream/Page/4_main_page/components/main_SmoothPageIndicator.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';
import 'package:my_dream/Page/4_main_page/components/main_title_overview.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';

class MainBestReview extends StatefulWidget {
  final VoidCallback onLoadingComplete;

  const MainBestReview({super.key, required this.onLoadingComplete});

  @override
  State<MainBestReview> createState() => _MainBestReviewState();
}

class _MainBestReviewState extends State<MainBestReview> {
  final PageController _controller = PageController();
  List<Map<String, dynamic>> serverResult = [];

  bool _isFinish = false;

  @override
  void initState() {
    super.initState();
    bestReviewGetDio();
  }

  void bestReviewGetDio() async {
    serverResult = await mainScreenBestReviews();
    _isFinish = true;
    widget.onLoadingComplete();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return _isFinish
        ? Column(
            children: [
              const MainTitleOverview(
                title: 'BEST 리뷰✨',
                isShowMore: false,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 6),
                child: SizedBox(
                  height: screenWidth * 0.387,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      // 첫 번째 컨테이너
                      if (serverResult.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.032,
                              right: screenWidth * 0.032,
                              top: 10,
                              bottom: 10),
                          child: MainContainer(
                            content: BestReview3(reviewsData: serverResult[0]),
                          ),
                        ),
                      // 두 번째 컨테이너
                      if (serverResult.length > 1)
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.032,
                              right: screenWidth * 0.032,
                              top: 10,
                              bottom: 10),
                          child: MainContainer(
                            content: BestReview3(reviewsData: serverResult[1]),
                          ),
                        ),
                      // 세 번째 컨테이너
                      if (serverResult.length > 2)
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.032,
                              right: screenWidth * 0.032,
                              top: 10,
                              bottom: 10),
                          child: MainContainer(
                            content: BestReview3(reviewsData: serverResult[2]),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              MainSmoothPageIndicator(
                controller: _controller,
                count: serverResult.length,
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          );
  }
}
