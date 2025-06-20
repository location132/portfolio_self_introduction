import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/9_store_review/store_review_dio/store_review_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:provider/provider.dart';

void handlereviewsIMG(context, Map<String, dynamic> reviews, int size) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return StoreReviewContentDialog(reviews: reviews, size: size);
    },
  );
}

class StoreReviewContentDialog extends StatefulWidget {
  final Map<String, dynamic> reviews;
  final int size;
  const StoreReviewContentDialog(
      {super.key, required this.reviews, required this.size});

  @override
  State<StoreReviewContentDialog> createState() =>
      _StoreReviewContentDialogState();
}

class _StoreReviewContentDialogState extends State<StoreReviewContentDialog> {
  late PageController _pageController;
  int _currentPage = 0;
  //좋아요
  Map<String, dynamic> result = {};
  bool _toggleValue = false;
  bool _toggleSuccess = false;
  late int recommendCount;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    recommendCount = widget.reviews['recommendCount'];
    _toggleValue = widget.reviews['recommendation'];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void togglIcon() async {
    result = await recommendReviewDio(widget.reviews['reviewId']);
    if (result['success']) {
      setState(() {
        _toggleValue = true;
        _toggleSuccess = !_toggleSuccess;
      });
    } else {
      setState(() {
        _toggleValue = false;
        _toggleSuccess = !_toggleSuccess;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.only(left: 16, right: 16),
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 15, right: 15, bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: screenWidth * 0.55,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${widget.reviews['reviewerEmail']}',
                                  style: const TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 15,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '    ${widget.reviews['writeDate'].toString().split(' ')[0]}',
                                  style: const TextStyle(
                                    color: Color(0xffc1c1c1),
                                    fontSize: 13,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '신고하기',
                          style: TextStyle(
                            color: Color(0xff8e8e8e),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.424,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.size,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: widget.reviews['images'][index]
                                  ['image'],
                              fit: BoxFit.cover,
                              memCacheHeight: ((screenHeight * 0.424) *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: (screenWidth - ((screenWidth * 0.19) + 20)) / 2,
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(0.6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  if (_currentPage > 0) {
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${_currentPage + 1} / ${widget.size}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: () {
                                  if (_currentPage < widget.size - 1) {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        RatingBar.readOnly(
                          isHalfAllowed: true,
                          size: 20,
                          alignment: Alignment.center,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          emptyColor: const Color.fromARGB(255, 215, 215, 215),
                          halfFilledColor: const Color(0xfff7ce45),
                          halfFilledIcon: Icons.star_half,
                          initialRating: widget.reviews['score'].toDouble(),
                          maxRating: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.007),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.reviews['reviewContent'],
                        style: const TextStyle(
                          color: Color(0xff393939),
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0093),
                  // -------------좋아요-------------
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (loginStatus.loginStatus && loginStatus.isStudent) {
                          togglIcon();
                        } else if (!loginStatus.loginStatus) {
                          pageRoutesStatus
                              .setPageController('/StoreReviewContainer');
                          showLoginDialog(context, LoginDialogType.login);
                        } else {
                          pageRoutesStatus
                              .setPageController('/StoreReviewContainer');
                          showLoginDialog(context, LoginDialogType.studentAuth);
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_off_alt_outlined,
                            size: 20,
                            color: !_toggleValue
                                ? const Color(0xffc1c1c1)
                                : const Color(0xff6fbf8a),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            (_toggleValue && _toggleSuccess
                                    ? recommendCount + 1
                                    : !_toggleSuccess
                                        ? recommendCount
                                        : recommendCount - 1)
                                .toString(),
                            style: const TextStyle(
                              color: Color(0xff8e8e8e),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ],
                      ),
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
