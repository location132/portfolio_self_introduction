/*
  연회 페이지에서 스토어 컨테이너를 포함한 위젯입니다.
 */

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/model/affiliated_store.dart';

class StoreContainer extends StatelessWidget {
  final AffiliatedStoreModel store;
  final bool lastIndex;

  const StoreContainer({
    super.key,
    required this.store,
    required this.lastIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sw),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 107.sh,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      const Color(0x0c000000).withOpacity(0.01),
                      const Color(0x0c000000).withOpacity(0.01),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.sh, horizontal: 2.sw),
                child: Container(
                  width: double.infinity,
                  height: 102.sh,
                  decoration: BoxDecoration(
                    color: const Color(0xfffdfdfd),
                    borderRadius: BorderRadius.circular(4),
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
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4)),
                            child: CachedNetworkImage(
                              imageUrl: store.marketImage,
                              fit: BoxFit.cover,
                              width: 102.sh,
                              height: 102.sh,
                              memCacheHeight: (102 *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10.sw, top: 10.sh, right: 15.sw),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 216.sw, // 393 * 0.55
                                        ),
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text:
                                                    store.marketName.toString(),
                                                style: const TextStyle(
                                                  color: Color(0xff111111),
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: SizedBox(
                                                    width: 5.sw), // 393 * 0.012
                                              ),
                                              const TextSpan(
                                                text: '현재 위치에서 계산하기',
                                                style: TextStyle(
                                                  color: Color(0xff6fbf8a),
                                                  fontSize: 12,
                                                  fontFamily:
                                                      'PretendardSemiBold',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3.sh), // 393 * 0.007
                                  Row(
                                    children: [
                                      Text(
                                        store.marketDescription,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color(0xff5b5b5b),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.sh), // 393 * 0.009
                                  SizedBox(
                                    width: 275.sw, // 393 * 0.7
                                    child: Row(
                                      children: [
                                        Text(
                                          '영업시간: ${store.openTime}',
                                          style: const TextStyle(
                                            color: Color(0xff393939),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            ' ~ ${store.closeTime} | ${store.closedDays}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xff393939),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 3.sh), // 393 * 0.0075
                                  const Divider(
                                    height: 1,
                                    color: Color(0xfff5f5f5),
                                  ),
                                  SizedBox(height: 2.sh), // 393 * 0.006
                                  SizedBox(
                                    width: 275.sw, // 393 * 0.7
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xfffdd835),
                                          size: 18,
                                        ),
                                        Text(
                                          store.averageReviewScore
                                              .toString()
                                              .substring(0, 3),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Text(
                                          ' 리뷰(${store.reviewCount}) ',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            store.eventMessage ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xfff64f4f),
                                              fontSize: 10,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.sh), // 393 * 0.02
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
