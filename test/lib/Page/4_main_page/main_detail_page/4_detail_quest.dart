import 'package:flutter/material.dart';

class DetailQuest3 extends StatefulWidget {
  final int questNum;
  final String image;
  final List<Map<String, dynamic>> serverResult;

  const DetailQuest3(
      {super.key,
      required this.serverResult,
      required this.questNum,
      required this.image});

  @override
  State<DetailQuest3> createState() => _DetailQuest3State();
}

class _DetailQuest3State extends State<DetailQuest3> {
//퀘스트별 나오는 글자수 제한
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final secondScreenHeight = screenHeight * 0.2465;
    final secondScreenWidth = screenWidth - screenWidth * 0.082;

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
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
              left: secondScreenWidth * 0.047,
              right: secondScreenWidth * 0.047),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.17,
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
                      SizedBox(
                        width: secondScreenWidth * 0.075,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: screenWidth * 0.07,
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
                                  child: const CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 5,
                                    value: 0,
                                    backgroundColor: Color(0xffeeeeee),
                                    color: Color(0xff6fbf8a),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    widget.serverResult[widget.questNum]
                                            ['weight_previousLevel']
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xffeeeeee)),
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
                            height: screenWidth * 0.07,
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
                                  child: CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 5,
                                    value: 1.0 -
                                        (widget.serverResult[widget.questNum]
                                                ['expValue'] /
                                            widget.serverResult[widget.questNum]
                                                ['weight_currentLevel']),
                                    backgroundColor: const Color(0xffeeeeee),
                                    color: const Color(0xff6fbf8a),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    widget.image,
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
                            height: screenWidth * 0.07,
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
                                  child: const CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 5,
                                    value: 1,
                                    backgroundColor: Color(0xffeeeeee),
                                    color: Color(0xff6fbf8a),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    widget.serverResult[widget.questNum]
                                            ['weight_nextLevel']
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
                      SizedBox(width: secondScreenWidth * 0.075),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: secondScreenWidth * 0.25,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenWidth * 0.26,
                            ),
                            const Text(
                              '[ 달성완료 ]',
                              style: TextStyle(
                                  fontSize: 12.3,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Pretendard',
                                  color: Color(0xffbdbdbd)),
                            ),
                            Text(
                              formatMessage(
                                  widget.serverResult[widget.questNum]
                                      ['message'],
                                  widget.serverResult[widget.questNum]
                                      ['weight_previousLevel']),
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
                                '+ ${widget.serverResult[widget.questNum]['gainExp_previousLevel']}P',
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
                            SizedBox(
                              height: screenWidth * 0.33,
                            ),
                            const Text(
                              '[ 진행중 ]',
                              style: TextStyle(
                                  fontSize: 12.3,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Pretendard'),
                            ),
                            Text(
                                formatMessage(
                                    widget.serverResult[widget.questNum]
                                        ['message'],
                                    widget.serverResult[widget.questNum]
                                        ['weight_currentLevel']),
                                style: const TextStyle(
                                    fontSize: 12.3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Pretendard')),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                                '+ ${widget.serverResult[widget.questNum]['gainExp_currentLevel']}P',
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
                            SizedBox(
                              height: screenWidth * 0.26,
                            ),
                            const Text(
                              '[ 진행예정 ]',
                              style: TextStyle(
                                  fontSize: 12.3,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Pretendard',
                                  color: Color(0xffbdbdbd)),
                            ),
                            Text(
                                formatMessage(
                                    widget.serverResult[widget.questNum]
                                        ['message'],
                                    widget.serverResult[widget.questNum]
                                        ['weight_nextLevel']),
                                style: const TextStyle(
                                    fontSize: 12.3,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Pretendard',
                                    color: Color(0xffbdbdbd))),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                                '+ ${widget.serverResult[widget.questNum]['gainExp_nextLevel']}P',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
