import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dream/Page/7_partnership_request_page/1.partnership_mainPage/7.1.1._partnership_request_category.dart';

//new에 해당하는 데이터
bool getNewData(String serverTime) {
  //데이터가 현재 시간으로 당일에 올린 데이터라면 new
  DateTime writeTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(serverTime);
  DateTime now = DateTime.now();

  if (now.difference(writeTime).inHours < 24) {
    return true;
  } else {
    return false;
  }
}

// 서버시간
String timeElapsed(String serverTime) {
  DateTime writeTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(serverTime);

  DateTime now = DateTime.now();

  Duration difference = now.difference(writeTime);

  if (difference.inDays > 0) {
    return '${difference.inDays}일 전';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}시간 전';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}분 전';
  } else {
    return '방금 전';
  }
}

// hot, new 컨테이너
class UnifiedCustomContainer extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final Map<String, dynamic> data;
  final String time;
  final String type; // 'hot', 'new', 또는 'normal'

  const UnifiedCustomContainer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.data,
    required this.time,
    required this.type,
  });

  @override
  State<UnifiedCustomContainer> createState() => _UnifiedCustomContainerState();
}

class _UnifiedCustomContainerState extends State<UnifiedCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.type != 'hot')
          SizedBox(height: widget.screenHeight * 0.0116),
        Container(
          height: widget.screenHeight * 0.142,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffdbdbdb),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 9, bottom: 9),
                    child: _buildTypeIndicator(),
                  ),
                  Text(
                    widget.data['marketName'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff111111),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        color: Color(0xffc1c1c1),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  height: 1,
                  color: Color(0xffdbdbdb),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: widget.screenHeight * 0.009),
                child: CustomText(
                  text: widget.data['description'],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: widget.screenHeight * 0.007),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 20,
                      color: widget.data['recommendation']
                          ? const Color(0xff6fbf8a)
                          : const Color(0xffc1c1c1),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.data['recommendCount'].toString(),
                      style: const TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 12.5,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(width: 24),
                    const Icon(
                      CupertinoIcons.chat_bubble,
                      size: 20,
                      color: Color(0xffc1c1c1),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.data['commentCount'].toString(),
                      style: const TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 12.5,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypeIndicator() {
    switch (widget.type) {
      case 'hot':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 1),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
          child: const Text(
            'HOT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case 'new':
        return const Text(
          'NEW',
          style: TextStyle(
            color: Color(0xfff64f4f),
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class CustomContainerNormal extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final int index;
  final List<Map<String, dynamic>> serverData;
  final String time;

  const CustomContainerNormal(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.index,
      required this.serverData,
      required this.time});

  @override
  State<CustomContainerNormal> createState() => _CustomContainerNormalState();
}

class _CustomContainerNormalState extends State<CustomContainerNormal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const SizedBox(height: 10),
        SizedBox(height: widget.screenHeight * 0.0116),

        Container(
          height: widget.screenHeight * 0.142,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xffdbdbdb),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 10, top: 9, bottom: 9),
                    child: Text(
                      widget.serverData[widget.index]['marketName'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff111111),
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.time,
                      style: const TextStyle(
                        color: Color(0xffc1c1c1),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  height: 1,
                  color: Color(0xffdbdbdb),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: widget.screenHeight * 0.009),
                child: CustomText(
                    text: widget.serverData[widget.index]['description']),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, right: 20, top: widget.screenHeight * 0.007),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 20,
                      color: widget.serverData[widget.index]['recommendation']
                          ? const Color(0xff6fbf8a)
                          : const Color(0xffc1c1c1),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.serverData[widget.index]['recommendCount']
                          .toString(),
                      style: const TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 12.5,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(width: 24),
                    const Icon(
                      CupertinoIcons.chat_bubble,
                      size: 20,
                      color: Color(0xffc1c1c1),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.serverData[widget.index]['commentCount']
                          .toString(),
                      style: const TextStyle(
                        color: Color(0xff8e8e8e),
                        fontSize: 12.5,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
