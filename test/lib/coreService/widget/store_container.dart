/*
재사용

마켓 리스트 페이지에서 마켓 정보를 보여주는 위젯
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoreContainer extends StatefulWidget {
  final Map<String, dynamic> store;
  final bool isNewStore;
  final bool isEditing;
  const StoreContainer({
    super.key,
    required this.store,
    required this.isNewStore,
    required this.isEditing,
  });

  @override
  State<StoreContainer> createState() => _StoreContainerState();
}

class _StoreContainerState extends State<StoreContainer> {
  bool _isAniOpacity = true;

  void changeOpacityText() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      _isAniOpacity = !_isAniOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    if (_isAniOpacity == widget.isEditing) {
      changeOpacityText();
    }
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.12,
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
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.13,
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
                            child: SizedBox(
                              width: screenHeight * 0.12,
                              height: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.store['marketImage'].toString(),
                                fit: BoxFit.cover,
                                memCacheHeight: ((screenHeight * 0.11) *
                                        MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${widget.store['marketName']}',
                                        style: const TextStyle(
                                          color: Color(0xff111111),
                                          fontSize: 16,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.012),
                                      Expanded(
                                        child: AnimatedOpacity(
                                          opacity:
                                              _isAniOpacity && !widget.isEditing
                                                  ? 1.0
                                                  : 0.0,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          child: Text(
                                            '현재 지점에서부터 ${widget.store['distance']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xff6fbf8a),
                                              fontSize: 12,
                                              fontFamily: 'PretendardSemiBold',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenWidth * 0.01),
                                  Text(
                                    widget.store['marketDescription'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xff5b5b5b),
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.009),
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: !widget.isEditing
                                        ? Text(
                                            '영업시간 : ${widget.store['openTime']} ~ ${widget.store['closeTime']} ${widget.store['closedDays'] != null ? ' ㅣ 매주 ${widget.store['closedDays']} 휴무' : ''}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xff393939),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                            ),
                                          )
                                        : Text(
                                            '영업시간 : ${widget.store['openTime']} ~ ${widget.store['closeTime']}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Color(0xff393939),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                  ),
                                  SizedBox(height: screenWidth * 0.009),
                                  const Divider(
                                    height: 1,
                                    color: Color(0xfff5f5f5),
                                  ),
                                  SizedBox(height: screenWidth * 0.013),
                                  !widget.isNewStore
                                      ? Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 17,
                                              color: Color(0xfff7ce45),
                                            ),
                                            const SizedBox(width: 2),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: widget.store[
                                                            'averageReviewScore']
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff111111),
                                                      fontFamily: 'Pretendard',
                                                    ),
                                                  ),
                                                  const TextSpan(text: '  '),
                                                  TextSpan(
                                                    text:
                                                        '리뷰(${widget.store['reviewCount'].toString()})',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff111111),
                                                      fontFamily: 'Pretendard',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            if (widget.store['eventMessage'] !=
                                                    null &&
                                                widget.store['eventMessage']
                                                    .isNotEmpty)
                                              !widget.isEditing
                                                  ? Expanded(
                                                      child: AnimatedOpacity(
                                                        opacity: _isAniOpacity &&
                                                                !widget
                                                                    .isEditing
                                                            ? 1.0
                                                            : 0.0,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        child: Text(
                                                          widget.store[
                                                              'eventMessage'],
                                                          overflow:
                                                              TextOverflow.fade,
                                                          softWrap: false,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xfff64f4f),
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'PretendardSemiBold',
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                          ],
                                        )
                                      : const SizedBox(),
                                  if (widget.isNewStore) ...[
                                    Row(
                                      children: [
                                        if (widget.store['eventMessage'] !=
                                                null &&
                                            widget.store['eventMessage']
                                                .isNotEmpty)
                                          !widget.isEditing
                                              ? Expanded(
                                                  child: Text(
                                                    widget
                                                        .store['eventMessage'],
                                                    overflow: TextOverflow.fade,
                                                    softWrap: false,
                                                    style: const TextStyle(
                                                      color: Color(0xfff64f4f),
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'PretendardSemiBold',
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                      ],
                                    ),
                                  ],
                                  SizedBox(height: screenWidth * 0.02),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: widget.isNewStore,
                        child: Positioned(
                          top: 10,
                          child: Container(
                            height: 18,
                            width: 39,
                            decoration: const BoxDecoration(
                              color: Color(0xff6fbf8a),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6, right: 5),
                              child: Center(
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
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
            ],
          ),
        ),
        const SizedBox(height: 7),
      ],
    );
  }
}
