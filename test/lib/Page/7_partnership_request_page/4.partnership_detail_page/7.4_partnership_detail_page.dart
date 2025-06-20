// 파트너쉽 요청글 페이지 //
/*
1. 유저 정보, 삭제, 수정 위젯인 PartnershipDetailUserinfo 불러옴
2. 댓글 불러오는 위젯(DetailPartnershipComment) 불러옴
3. textformfield에서 댓글 작성 기능 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:my_dream/Page/7_partnership_request_page/0.partnership_dio/partnership_screen_dio.dart';
import 'package:my_dream/Page/7_partnership_request_page/4.partnership_detail_page/7.4.3_partnership_detail_userinfo.dart';
import 'package:my_dream/Page/7_partnership_request_page/4.partnership_detail_page/7.4.1_parthership_detail_comment.dart';
import 'package:my_dream/Page/7_partnership_request_page/4.partnership_detail_page/7.4.2_partnership_detail_title.dart';
import 'package:my_dream/coreService/Dialog/login_dialog.dart';
import 'package:my_dream/coreService/provider.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class DetailPartnershipPage extends StatefulWidget {
  final String time;
  final Map<String, dynamic> serverData;
  final String type;
  const DetailPartnershipPage(
      {super.key,
      required this.serverData,
      required this.type,
      required this.time});

  @override
  State<DetailPartnershipPage> createState() => _DetailPartnershipPageState();
}

class _DetailPartnershipPageState extends State<DetailPartnershipPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> serverResult = [];
  Map<String, dynamic> serverDetailData = {};
  bool _isFinished = false;
  bool toggleValue = false;
  String newComment = '';
  String userEmail = '';
  int _finishCount = 0;
  int recommendationCount = 0;
  int commentCount = 0;
  KakaoMapController? mapController; // 카카오맵 컨트롤러
  Set<Marker> markers = {}; // 마커 변수
  late LatLng center;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    partnershipGetDetail();
    super.initState();
  }

  void partnershipGetDetail() async {
    //해당 파트너쉽 데이터 가져오기
    serverDetailData =
        await partnershipGetDetailData(widget.serverData['partnerRequestId']);
    toggleValue = serverDetailData['recommendation'];
    partnershipGetUserEmail();
    _incrementFinishCount();
  }

  void partnershipGetUserEmail() {
    final loginModel = Provider.of<LoginModel>(context, listen: false);
    userEmail = loginModel.studentEmail;

    partnershipGetComment();
    _incrementFinishCount();
  }

  void partnershipGetComment() async {
    serverResult =
        await partnershipGetCommentData(widget.serverData['partnerRequestId']);
    _incrementFinishCount();
  }

  // 좋아요 기능
  void toggleIcon() async {
    var result =
        await partnershipRecommendation(serverDetailData['partnerRequestId']);
    if (result['status'] == 'success') {
      recommendationCount += 1;
      toggleValue = true;
      setState(() {});
    } else if (result['status'] == 'requestAgain') {
      await partnershipRecommendationDelete(
          serverDetailData['partnerRequestId']);
      recommendationCount -= 1;
      toggleValue = false;
      setState(() {});
    }
  }

  void partnershipPageLoadComplete(int finishCount) async {
    if (_finishCount == 3) {
      await Future.delayed(const Duration(milliseconds: 800));
      setState(() {
        _isFinished = true;
      });
    }
  }

  void _incrementFinishCount() {
    _finishCount++;
    partnershipPageLoadComplete(_finishCount);
  }

  @override
  Widget build(BuildContext context) {
    final loginStatus = Provider.of<LoginModel>(context, listen: false);
    final screenWidth = MediaQuery.of(context).size.width;
    final secondscreenWidth = screenWidth - screenWidth * 0.082;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            if (_isFinished)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.041,
                          right: screenWidth * 0.041),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.018,
                          ),
                          const CustomAppBar(title: '파트너쉽 요청글'),
                          SizedBox(
                            height: screenHeight * 0.028,
                          ),
                          DecoratedBox(
                            // 가게 이름
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xffdbdbdb),
                              ),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              ),
                            ),

                            child: widget.type == 'hot'
                                ? hotDetailRequest(serverDetailData)
                                : (widget.type == 'new'
                                    ? newDetailRequest(serverDetailData)
                                    : normalDetailRequest(serverDetailData)),
                          ),
                          //--------------------------------------//유저 이름, 삭제, 수정 부분
                          PartnershipDetailUserinfo(
                            time: widget.time,
                            serverDetailData: serverDetailData,
                            userEmail: userEmail,
                          ),
                          //--------------------------------------//카카오맵 부분
                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.18,
                            decoration: const BoxDecoration(
                              border: Border(
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
                            child: KakaoMap(
                              onMapCreated: ((controller) async {
                                mapController = controller;
                                markers.add(Marker(
                                  markerId: UniqueKey().toString(),
                                  latLng: await mapController!.getCenter(),
                                ));
                                setState(() {});
                              }),
                              markers: markers.toList(),
                              center: LatLng(
                                serverDetailData['locationY'] as double,
                                serverDetailData['locationX'] as double,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 1,
                                  color: Color(0xffdbdbdb),
                                ),
                                right: BorderSide(
                                  width: 1,
                                  color: Color(0xffdbdbdb),
                                ),
                                bottom: BorderSide(
                                  width: 1,
                                  color: Color(0xfff5f5f5),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 10, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '업체명: ',
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                      SizedBox(
                                          width: secondscreenWidth * 0.055),
                                      Text(
                                        serverDetailData['marketName'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Text(
                                        '업체 위치: ',
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      Text(
                                        serverDetailData['marketAddress'],
                                        style: const TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Text(
                                        '상세주소: ',
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        serverDetailData['marketDetailAddress'],
                                        style: const TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Text(
                                        '전화번호: ',
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                      ),
                                      Text(
                                        serverDetailData['marketPhone'],
                                        style: const TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Color(0xffdbdbdb),
                                ),
                                left: BorderSide(
                                  width: 1,
                                  color: Color(0xffdbdbdb),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 13, right: 20, bottom: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      style: const TextStyle(height: 1.4),
                                      serverDetailData['description']),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          if (loginStatus.loginStatus &&
                                              loginStatus.isStudent) {
                                            toggleIcon();
                                          } else if (!loginStatus.loginStatus) {
                                            showLoginDialog(
                                                context, LoginDialogType.login);
                                          } else if (!loginStatus.isStudent) {
                                            showLoginDialog(context,
                                                LoginDialogType.studentAuth);
                                          }
                                        },
                                        child: Icon(
                                          Icons.thumb_up_off_alt_outlined,
                                          size: 20,
                                          color: toggleValue
                                              ? const Color(0xff6fbf8a)
                                              : const Color(0xffc1c1c1),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        (widget.serverData['recommendCount'] +
                                                recommendationCount)
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xff8e8e8e),
                                          fontSize: 12,
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
                                        (widget.serverData['commentCount'] +
                                                commentCount)
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xff8e8e8e),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
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
                            child: TextFormField(
                              controller: _textEditingController,
                              cursorHeight: 20,
                              textAlignVertical:
                                  const TextAlignVertical(y: 0.3),
                              maxLines: 1,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                filled: true,
                                fillColor: const Color(0xfff5f5f5),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (loginStatus.loginStatus &&
                                            loginStatus.isStudent) {
                                          if (_textEditingController
                                              .text.isNotEmpty) {
                                            await partnershipComment(
                                                // 서버로 댓글 전송
                                                widget.serverData[
                                                    'partnerRequestId'],
                                                _textEditingController.text);

                                            setState(() {
                                              newComment =
                                                  _textEditingController.text;
                                              commentCount += 1;
                                            });
                                            _textEditingController.clear();
                                          }
                                        } else if (!loginStatus.loginStatus) {
                                          showLoginDialog(
                                              context, LoginDialogType.login);
                                        } else if (!loginStatus.isStudent) {
                                          showLoginDialog(context,
                                              LoginDialogType.studentAuth);
                                        }
                                      },
                                      child: Container(
                                        width: screenWidth * 0.08, // 제출 버튼
                                        height: screenWidth * 0.08,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff6fbf8a),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: Colors.white,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                hintText: '댓글을 입력해주세요.',
                                hintStyle: const TextStyle(
                                    color: Color(0xffc1c1c1),
                                    fontFamily: 'Pretendard',
                                    fontSize: 15),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                          DetailPartnershipComment(
                            newComment: newComment,
                            number: widget.serverData['partnerRequestId'],
                            serverResult: serverResult,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
