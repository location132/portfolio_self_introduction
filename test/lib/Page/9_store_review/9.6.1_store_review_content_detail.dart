import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/9_store_review/9.8_store_review_content_dialog.dart';
import 'package:my_dream/Page/9_store_review/store_review_dio/store_review_dio.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/core/utils/verifty_form.dart';
import 'package:provider/provider.dart';

class StoreReviewContentDetail extends StatefulWidget {
  final Map<String, dynamic> reviews;
  final int? index;
  const StoreReviewContentDetail(
      {super.key, required this.reviews, this.index});

  @override
  State<StoreReviewContentDetail> createState() => _StoreReviewContentDetail();
}

class _StoreReviewContentDetail extends State<StoreReviewContentDetail> {
  Map<String, dynamic> result = {};
  bool _toggleValue = false;
  late int recommendCount;
  bool _toggleSuccess = false;
  String _formatTime = '';

  @override
  void initState() {
    super.initState();
    recommendCount = widget.reviews['reviews'][widget.index]['recommendCount'];
    _toggleValue = widget.reviews['reviews'][widget.index]['recommendation'];
    _formatTime = formatTimeDifference(
        widget.reviews['reviews'][widget.index]['writeDate'].toString());
  }

  void togglIcon() async {
    result = await recommendReviewDio(
        widget.reviews['reviews'][widget.index]['reviewId']);
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
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final pageRoutesStatus = Provider.of<PageRoutes>(context, listen: false);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xfff5f5f5),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0c000000),
                offset: Offset(2, 0),
                blurRadius: 6,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x0c000000),
                offset: Offset(-2, 0),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            child: Column(
              children: [
                // 프로필, 레벨 작성 시간
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.reviews['reviews'][widget.index]
                            ['reviewerImage'],
                        fit: BoxFit.cover,
                        memCacheHeight:
                            (40 * MediaQuery.of(context).devicePixelRatio)
                                .round(),
                        memCacheWidth:
                            (40 * MediaQuery.of(context).devicePixelRatio)
                                .round(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.reviews['reviews'][widget.index]['reviewerEmail'],
                      style: const TextStyle(
                        color: Color(0xff393939),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _formatTime,
                      style: const TextStyle(
                        color: Color(0xffc1c1c1),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
                //--------------별점---------------
                const SizedBox(height: 10),
                Row(
                  children: [
                    RatingBar.readOnly(
                      isHalfAllowed: true,
                      size: 18,
                      alignment: Alignment.center,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      emptyColor: const Color(0xfff7ce45),
                      halfFilledColor: const Color(0xfff7ce45),
                      halfFilledIcon: Icons.star_half,
                      initialRating: (widget.reviews['reviews'][widget.index]
                              ['score'] as num)
                          .toDouble(),
                      maxRating: 5,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // ---------제목------------------
                Row(
                  children: [
                    Text(
                      widget.reviews['reviews'][widget.index]['orderMenu'],
                      style: const TextStyle(
                        color: Color(0xff393939),
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                // ------------내용--------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: ExpandableText(
                    widget.reviews['reviews'][widget.index]['reviewContent'],
                    textAlign: TextAlign.left,
                    expandText: '더보기',
                    collapseText: '접기',
                    maxLines: 3,
                    linkColor: const Color(0xffc1c1c1),
                    animation: true,
                    collapseOnTextTap: true,
                    prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                    hashtagStyle: const TextStyle(
                      color: Color(0xffc1c1c1),
                    ),
                    mentionStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    urlStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // 사진이 있는 경우
                if (widget.reviews['reviews'][widget.index]['images'] != null &&
                    (widget.reviews['reviews'][widget.index]['images']
                            as List<dynamic>)
                        .isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (widget.reviews['reviews'][widget.index]
                                ['images'] as List<dynamic>)
                            .length,
                        itemBuilder: (context, imageIndex) {
                          final imageUrl = widget.reviews['reviews']
                              [widget.index]['images'][imageIndex]['image'];
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              handlereviewsIMG(
                                context,
                                widget.reviews['reviews'][widget.index],
                                (widget.reviews['reviews'][widget.index]
                                        ['images'] as List<dynamic>)
                                    .length,
                              );
                            },
                            child: Container(
                                height: 80,
                                width: 80,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  fit: BoxFit.cover,
                                  memCacheWidth: (80 *
                                          MediaQuery.of(context)
                                              .devicePixelRatio)
                                      .round(),
                                  memCacheHeight: (80 *
                                          MediaQuery.of(context)
                                              .devicePixelRatio)
                                      .round(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                // -------------좋아요-------------
                InkWell(
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
              ],
            ),
          ),
        ),
        const Positioned(
          right: 10,
          top: 10,
          child: Text(
            '신고하기',
            style: TextStyle(
              color: Color(0xff8e8e8e),
              fontSize: 12,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      ],
    );
  }
}
