import 'package:flutter/material.dart';
import 'package:my_dream/Page/10_my_page/10.4_my_page_event_detail.dart';
import 'package:my_dream/Page/10_my_page/my_page_dio/my_page_dio.dart';
import 'package:my_dream/coreService/Dialog/my_page_event_end_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class MyPageEvent extends StatefulWidget {
  const MyPageEvent({super.key});

  @override
  State<MyPageEvent> createState() => _MyPageEventState();
}

class _MyPageEventState extends State<MyPageEvent> {
  Map<String, dynamic> userEventsParticipantTrue = {};
  Map<String, dynamic> userEventsParticipantFalse = {};

  bool _isScreenLoad = false;

  @override
  void initState() {
    getDioEvents();
    super.initState();
  }

  void getDioEvents() async {
    final loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    if (loginStatus) {
      userEventsParticipantTrue = await events(true);
      userEventsParticipantFalse = await events(false);
    } else {
      userEventsParticipantFalse = await events(false);
    }

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
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.041),
                            itemCount: userEventsParticipantTrue['itemLength'] +
                                userEventsParticipantFalse['itemLength'],
                            itemBuilder: (context, index) {
                              if (index <
                                  userEventsParticipantTrue['itemLength']) {
                                final event =
                                    userEventsParticipantTrue['status'][index];
                                return Column(
                                  children: [
                                    _buildEventCard(
                                      title: event['title'].toString(),
                                      date:
                                          '${event['eventStartDate'].toString()} ~ ${event['eventEndDate'].toString()}',
                                      imagePath: event['imageUrl'].toString(),
                                      isEnded: false,
                                      participant: true,
                                      eventId: event['eventId'],
                                    ),
                                    SizedBox(height: screenHeight * 0.024),
                                  ],
                                );
                              } else {
                                final falseIndex = index -
                                    userEventsParticipantTrue['itemLength'];
                                final event =
                                    userEventsParticipantFalse['status']
                                        [falseIndex];
                                return Column(
                                  children: [
                                    _buildEventCard(
                                      title: event['title'].toString(),
                                      date:
                                          '${event['eventStartDate'].toString()} ~ ${event['eventEndDate'].toString()}',
                                      imagePath: event['imageUrl'].toString(),
                                      isEnded: false,
                                      participant: false,
                                      eventId: event['eventId'],
                                    ),
                                    SizedBox(height: screenHeight * 0.024),
                                  ],
                                );
                              }
                            },
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

  Widget _buildEventCard({
    required String title,
    required String date,
    required String imagePath,
    required bool isEnded,
    required bool participant,
    required int eventId,
  }) {
    // title 앞에 상태 추가
    final String fullTitle = isEnded ? "[이벤트종료] $title" : "[이벤트] $title";
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        if (isEnded) {
          // 종료된 이벤트일 경우 10.5 dialog 표시
          handleMyPageEventEndDialog(context);
        } else {
          // 진행 중인 이벤트일 경우 10.4 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPageEventDetail(eventId: eventId),
            ),
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Visibility(
                visible: participant,
                child: const Text(
                  '내가 참여한 이벤트',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8E8E),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.012),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: imagePath,
                        width: double.infinity,
                        height: screenHeight * 0.164,
                        fit: BoxFit.cover,
                        memCacheHeight: ((screenHeight * 0.164) *
                                MediaQuery.of(context).devicePixelRatio)
                            .round(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    if (isEnded)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8)),
                          ),
                          child: const Center(
                            child: Text(
                              '이벤트종료',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.012),
                Text(
                  fullTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    color: isEnded ? const Color(0xFF8E8E8E) : Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8E8E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
