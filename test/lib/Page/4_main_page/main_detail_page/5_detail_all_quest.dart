import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';
import 'package:my_dream/coreService/Shimmer_loading/loding_gif_IFSAI.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class DetailAllQuest extends StatefulWidget {
  final List<Map<String, dynamic>> serverResult;
  const DetailAllQuest({super.key, required this.serverResult});

  @override
  State<DetailAllQuest> createState() => _DetailAllQuestState();
}

class _DetailAllQuestState extends State<DetailAllQuest> {
  Map<String, dynamic> questLevelData = {};
  bool _isScreenLoad = false;
  @override
  void initState() {
    final loginStatus =
        Provider.of<LoginModel>(context, listen: false).loginStatus;
    if (loginStatus) {
      getTotalQuestLevelData();
    } else {
      questLevelData = {};
    }
    super.initState();
  }

  void getTotalQuestLevelData() async {
    questLevelData = await totalQuestLevel();
    setState(() {
      _isScreenLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final secondscreenWidth = screenWidth - screenWidth * 0.082;
    final secondScreenHeight = screenHeight * 0.2465;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            (_isScreenLoad && questLevelData.isNotEmpty)
                ? AnimatedOpacity(
                    opacity: !_isScreenLoad ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 420),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.041,
                              right: screenWidth * 0.041),
                          child: Column(
                            children: [
                              const CustomAppBar(title: '퀘스트'),
                              Container(
                                height: screenHeight * 0.067,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffd6d6d6),
                                      width: 1.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.083,
                                      right: screenWidth * 0.083),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        '내가 모은 포인트',
                                        style:
                                            TextStyle(fontFamily: 'Pretendard'),
                                      ),
                                      Text(
                                        '${questLevelData['userExp']}P',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xff6fbf8a),
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.013,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.041,
                                  right: screenWidth * 0.041,
                                  top: screenHeight * 0.01),
                              child: Column(
                                children: [
                                  allQeust3(
                                      1,
                                      'assets/images/quest_image_calendar.png',
                                      widget.serverResult,
                                      screenWidth,
                                      secondscreenWidth,
                                      secondScreenHeight,
                                      screenHeight),
                                  SizedBox(height: screenHeight * 0.03),
                                  allQeust3(
                                      2,
                                      'assets/images/quest_image_memo.png',
                                      widget.serverResult,
                                      screenWidth,
                                      secondscreenWidth,
                                      secondScreenHeight,
                                      screenHeight),
                                  SizedBox(height: screenHeight * 0.03),
                                  allQeust3(
                                      0,
                                      'assets/images/quest_image_tickets.png',
                                      widget.serverResult,
                                      screenWidth,
                                      secondscreenWidth,
                                      secondScreenHeight,
                                      screenHeight),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
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

//quest container 위젯
Widget allQeust3(
    int questNum,
    String image,
    List<Map<String, dynamic>> serverResult,
    double screenWidth,
    double secondScreenWidth,
    double secondScreenHeight,
    double screenHeight) {
  String formatMessage(String message, int number) {
    String updatedMessage =
        message.replaceAll(RegExp(r'\d+'), number.toString());

    if (updatedMessage.contains('할인쿠폰')) {
      if (number < 9) {
        return updatedMessage.substring(6, 14);
      } else {
        return updatedMessage.substring(6, 15);
      }
    } else if (updatedMessage.contains('리뷰')) {
      if (number > 8) {
        return updatedMessage.substring(0, 9);
      } else {
        return updatedMessage.substring(0, 8);
      }
    } else {
      if (number > 9) {
        return updatedMessage.substring(0, 10);
      } else {
        return updatedMessage.substring(0, 9);
      }
    }
  }

  return Container(
    height: screenHeight * 0.285,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color(0x19000000),
          offset: Offset(0, 2),
          blurRadius: 10,
          spreadRadius: 0,
        ),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(
          right: screenWidth * 0.053, left: screenWidth * 0.053),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              Text(
                '[${serverResult[questNum]['level']}단계] ',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Pretendard',
                ),
              ), // 수정 필요
              Text(
                '${serverResult[questNum]['message']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                ),
              ), // 수정 필요
            ],
          ),
          Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.155,
                      ),
                      Container(
                        width: secondScreenWidth * 0.885,
                        height: secondScreenHeight * 0.025,
                        decoration: const BoxDecoration(
                          color: Color(0xffeeeeee),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.055,
                          ),
                          Container(
                            width: secondScreenWidth * 0.15,
                            height: secondScreenWidth * 0.15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Transform(
                                  transform: Matrix4.rotationY(3.14159),
                                  alignment: Alignment.center,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.0, end: 0.0),
                                    duration:
                                        const Duration(milliseconds: 1420),
                                    builder: (context, value, _) =>
                                        CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      strokeWidth: 5,
                                      value: value,
                                      backgroundColor: const Color(0xffeeeeee),
                                      color: const Color(0xff6fbf8a),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    serverResult[questNum]
                                            ['weight_previousLevel']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xffeeeeee),
                                      fontFamily: 'Pretendard',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: secondScreenWidth * 0.1),
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.055,
                          ),
                          Container(
                            width: secondScreenWidth * 0.235,
                            height: secondScreenWidth * 0.235,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Transform(
                                  transform: Matrix4.rotationY(3.14159),
                                  alignment: Alignment.center,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween<double>(
                                        begin: 0.0,
                                        end: 1.0 -
                                            (serverResult[questNum]
                                                    ['expValue'] /
                                                serverResult[questNum]
                                                    ['weight_currentLevel'])),
                                    duration:
                                        const Duration(milliseconds: 1420),
                                    builder: (context, value, _) =>
                                        CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      strokeWidth: 5,
                                      value: value,
                                      backgroundColor: const Color(0xffeeeeee),
                                      color: const Color(0xff6fbf8a),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    image,
                                    scale: 2.9,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: secondScreenWidth * 0.1),
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.055,
                          ),
                          Container(
                            width: secondScreenWidth * 0.15,
                            height: secondScreenWidth * 0.15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Transform(
                                  transform: Matrix4.rotationY(3.14159),
                                  alignment: Alignment.center,
                                  child: TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 0.0, end: 1),
                                    duration:
                                        const Duration(milliseconds: 1420),
                                    builder: (context, value, _) =>
                                        CircularProgressIndicator(
                                      strokeCap: StrokeCap.round,
                                      strokeWidth: 5,
                                      value: value,
                                      backgroundColor: const Color(0xffeeeeee),
                                      color: const Color(0xff6fbf8a),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    serverResult[questNum]['weight_nextLevel']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff6fbf8a)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: secondScreenWidth * 0.25,
                    child: Column(
                      children: [
                        const Text(
                          '[ 달성완료 ]',
                          style: TextStyle(
                              fontSize: 12.3,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Pretendard',
                              color: Color(0xffbdbdbd)),
                        ),
                        Text(
                          formatMessage(serverResult[questNum]['message'],
                              serverResult[questNum]['weight_previousLevel']),
                          style: const TextStyle(
                            fontSize: 12.3,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Pretendard',
                            color: Color(0xffbdbdbd),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            '+ ${serverResult[questNum]['gainExp_previousLevel']}P',
                            style: const TextStyle(
                                fontSize: 12.3,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard',
                                color: Color(0xffbdbdbd))),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: secondScreenWidth * 0.25,
                    child: Column(
                      children: [
                        SizedBox(height: screenWidth * 0.045),
                        const Text(
                          '[ 진행중 ]',
                          style: TextStyle(
                              fontSize: 12.3,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Pretendard'),
                        ),
                        Text(
                            formatMessage(serverResult[questNum]['message'],
                                serverResult[questNum]['weight_currentLevel']),
                            style: const TextStyle(
                                fontSize: 12.3,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard')),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                            '+ ${serverResult[questNum]['gainExp_currentLevel']}P',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard',
                                color: Colors.red)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: secondScreenWidth * 0.25,
                    child: Column(
                      children: [
                        const Text(
                          '[ 진행예정 ]',
                          style: TextStyle(
                              fontSize: 12.3,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Pretendard',
                              color: Color(0xffbdbdbd)),
                        ),
                        Text(
                            formatMessage(serverResult[questNum]['message'],
                                serverResult[questNum]['weight_nextLevel']),
                            style: const TextStyle(
                                fontSize: 12.3,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard',
                                color: Color(0xffbdbdbd))),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            '+ ${serverResult[questNum]['gainExp_nextLevel']}P',
                            style: const TextStyle(
                                fontSize: 12.3,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Pretendard',
                                color: Color(0xffbdbdbd))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
