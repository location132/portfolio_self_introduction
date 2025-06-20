// 파트너쉽 요청글에 해당하는 댓글 불러오는 위젯 //

/*
1. didUpdateWidget()을 통해서 내가 댓글을 달았다면 다시 서버에 요청해서 댓글 받아옴
2. timeElapsed() 댓글 달고 나서 얼마나 시간이 지났는지 보여주는 함수
3. 마지막 댓글은 왼쪽과 오른쪽 밑 부분에 border 처리를 하기 위해서 PartnershipComment 위젯에서 부모로부터 받은 index를 통해 처리함
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';

class DetailPartnershipComment extends StatefulWidget {
  final int number;
  final String newComment;
  final List<Map<String, dynamic>> serverResult;
  const DetailPartnershipComment({
    super.key,
    required this.number,
    required this.newComment,
    required this.serverResult,
  });

  @override
  State<DetailPartnershipComment> createState() =>
      _DetailPartnershipCommentState();
}

class _DetailPartnershipCommentState extends State<DetailPartnershipComment> {
  List<Map<String, dynamic>> serverResult = [];

  @override
  void didUpdateWidget(covariant DetailPartnershipComment oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.newComment != widget.newComment) {
      _fetchUpdatedComments();
    }
  }

  @override
  void initState() {
    super.initState();
    serverResult = widget.serverResult;
  }

  void _fetchUpdatedComments() async {
    List<Map<String, dynamic>> updatedServerResult =
        await partnershipGetCommentData(widget.number);

    if (mounted) {
      setState(() {
        serverResult = updatedServerResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return serverResult.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: serverResult.length,
            itemBuilder: (context, index) {
              return PartnershipComment(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  commentData: serverResult[index],
                  commentCount: serverResult.length,
                  index: index);
            },
          )
        : Container(
            height: screenHeight * 0.08,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
                left: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
                right: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          );
  }
}

class PartnershipComment extends StatelessWidget {
  const PartnershipComment(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.commentData,
      required this.index,
      required this.commentCount});

  final double screenHeight;
  final double screenWidth;
  final Map<String, dynamic> commentData;
  final int index;
  final int commentCount;

  String userName(String writer) {
    int index = writer.indexOf('@');
    String user = writer.substring(0, index);
    return user;
  }

  @override
  Widget build(BuildContext context) {
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

    return Container(
      height: screenHeight * 0.08,
      decoration: (commentCount == index + 1)
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
                left: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
                right: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            )
          : const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xfff5f5f5),
                ),
                left: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
                right: BorderSide(
                  width: 1,
                  color: Color(0xffdbdbdb),
                ),
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 13),
                  child: Container(
                    width: screenWidth * 0.08,
                    height: screenWidth * 0.08,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 0.1)),
                    child: ClipRRect(
                      child: commentData['imageUrl'] != null
                          ? CachedNetworkImage(
                              imageUrl: commentData['imageUrl'],
                              fit: BoxFit.cover,
                              memCacheHeight: ((screenWidth * 0.12) *
                                      MediaQuery.of(context).devicePixelRatio)
                                  .round(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error))
                          : const Icon(Icons.person),
                    ),
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
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: userName(
                                    commentData['writer']), // 나중에 서버에서 받아와야함
                                style: const TextStyle(color: Colors.black)),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: timeElapsed(commentData['writeTime']),
                              style: const TextStyle(
                                  color: Color(0xffbdbdbd), fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '신고',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Text(
                    commentData['message'],
                    overflow: TextOverflow.ellipsis,
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
