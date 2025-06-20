//  댓글창 위젯
/*
1. 같이해요 페이지에서 사용함
2. 나중에 서버에서 받아온 값(이미지, 닉네임, 시간, 댓글 내용 등) 받아와서 바꾸기만 하면 됨
3. timeElapsed 함수는 서버에서 받아온 시간 포맷 바꾸는 함수
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JoinUsDEtailComment extends StatelessWidget {
  const JoinUsDEtailComment({super.key, required this.lastComment});

  final bool lastComment;

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final secondscreenWidth = screenWidth - screenWidth * 0.082;
    return Container(
      decoration: BoxDecoration(
          border: lastComment
              ? const Border(
                  bottom: BorderSide(color: Color(0xfff5f5f5)),
                )
              : null),
      height: screenHeight * 0.079,
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.012),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 13),
                  child: Container(
                    width: secondscreenWidth * 0.083,
                    height: secondscreenWidth * 0.083,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellow),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: '웅냔냥', // 나중에 서버에서 받아와야함
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'PretendardSemiBold',
                                )),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: '10분전',
                              style: TextStyle(
                                color: Color(0xffbdbdbd),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: secondscreenWidth * 0.044),
                        child: const Text(
                          '신고',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    '저 참여할래요!! 수락하기 누를게여!',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: 'Pretendard'),
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
