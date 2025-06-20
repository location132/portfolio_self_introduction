import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyPageEventDetail extends StatefulWidget {
  final int eventId;
  const MyPageEventDetail({super.key, required this.eventId});

  @override
  State<MyPageEventDetail> createState() => _MyPageEventDetailState();
}

class _MyPageEventDetailState extends State<MyPageEventDetail> {
  late int eventId;
  Map<String, dynamic> getEventDetailwithDio = {};
  bool _isScreenLoad = false;

  @override
  void initState() {
    super.initState();
    eventId = widget.eventId;
    getEvevtsDetail();
  }

  void getEvevtsDetail() async {
    getEventDetailwithDio = await getEventDetail(eventId);
    setState(() {
      _isScreenLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: _isScreenLoad
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.041),
                          child: const CustomAppBar(title: '이벤트'),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.041),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                      color: Color(0xFFF5F5F5), thickness: 1.5),
                                  SizedBox(height: screenHeight * 0.023),
                                  Text(
                                    '[이벤트] ${getEventDetailwithDio['status']['title']}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF282828),
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.008),
                                  Text(
                                    '이벤트 기간 : ${getEventDetailwithDio['status']['eventStartDate']} ~ ${getEventDetailwithDio['status']['eventEndDate']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF8E8E8E),
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.023),
                                  const Divider(
                                      color: Color(0xFFF5F5F5), thickness: 1.5),
                                  SizedBox(height: screenHeight * 0.017),
                                  getEventDetailwithDio['status']['imageUrl'] !=
                                          null
                                      ? Container(
                                          width: double.infinity,
                                          height: screenHeight * 0.164,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              imageUrl: getEventDetailwithDio[
                                                  'status']['imageUrl'],
                                              fit: BoxFit.cover,
                                              memCacheHeight: (screenHeight *
                                                      0.164 *
                                                      MediaQuery.of(context)
                                                          .devicePixelRatio)
                                                  .round(),
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          height: screenHeight * 0.164,
                                        ),
                                  SizedBox(height: screenHeight * 0.018),
                                  Text(
                                    getEventDetailwithDio['status']
                                        ['description'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF393939),
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.041),
                          child: ElevatedButton(
                            onPressed: () {
                              // 이벤트 참여 로직
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6FBF8A),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '이벤트 참여하기',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            AnimatedOpacity(
              opacity: !_isScreenLoad ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 420),
              child: LodingGifIfsai(
                isLoadingFinish: _isScreenLoad,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
