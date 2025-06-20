import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/Page/13_join_us/13.1.2_join_us_detail_comment.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class JoinUsDetailPage extends StatefulWidget {
  const JoinUsDetailPage({super.key});

  @override
  State<JoinUsDetailPage> createState() => _JoinUsDetailPageState();
}

class _JoinUsDetailPageState extends State<JoinUsDetailPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final secondscreenWidth = screenWidth - screenWidth * 0.082;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.041, right: screenWidth * 0.041),
          child: Column(
            children: [
              const CustomAppBar(title: '같이 해요'),
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.076,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: secondscreenWidth * 0.042,
                            top: secondscreenWidth * 0.042,
                            right: secondscreenWidth * 0.056,
                            bottom: secondscreenWidth * 0.028),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: secondscreenWidth * 0.11,
                                  width: secondscreenWidth * 0.11,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: secondscreenWidth * 0.019),
                                const Text(
                                  '나는야 / LV.1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: secondscreenWidth * 0.028,
                                ),
                                Text(
                                  '1시간 전',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.grey[400]),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {},
                                  child: const Text(
                                    '신고하기',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff757575),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.342,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color(0xfff5f5f5),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: secondscreenWidth * 0.042,
                                top: screenHeight * 0.009),
                            child: const Row(
                              children: [
                                Text(
                                  '[식사]',
                                  style: TextStyle(
                                    color: Color(0xff6fbf8a),
                                    fontFamily: 'PretendardSemiBold',
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  ' 태권치킨 같이 식사할 사람',
                                  style: TextStyle(
                                    fontFamily: 'PretendardSemiBold',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Padding(
                            padding: EdgeInsets.only(
                              left: secondscreenWidth * 0.042,
                              right: secondscreenWidth * 0.042,
                            ),
                            child: const Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '태권치킨 먹고싶은데 혼자 먹으러가긴 조금 그래서 같이 식사하실 분 있나요? 같이 식사하면서 친해져요',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      color: Color(0xff757575),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Padding(
                            padding: EdgeInsets.only(
                                left: secondscreenWidth * 0.042,
                                right: secondscreenWidth * 0.042),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: secondscreenWidth * 0.17,
                                      height: screenHeight * 0.03,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff6fbf8a),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(14),
                                          topRight: Radius.circular(14),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '모집 중',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PretendardSemiBold',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: secondscreenWidth * 0.916,
                                        height: screenHeight * 0.161,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffe0e0e0),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: secondscreenWidth * 0.0336,
                                              right: secondscreenWidth * 0.0224,
                                              top: secondscreenWidth * 0.025,
                                              bottom:
                                                  secondscreenWidth * 0.025),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: secondscreenWidth *
                                                        0.196,
                                                    height: secondscreenWidth *
                                                        0.196,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: secondscreenWidth *
                                                          0.03),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '태권치킨',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              'PretendardSemiBold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        '2024.10.14(화) 오휴 8시 4명',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Pretendard',
                                                          color:
                                                              Color(0xff616161),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.01),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: secondscreenWidth *
                                                        0.41,
                                                    height:
                                                        screenHeight * 0.042,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xfff5f5f5),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                      '초대장 보기',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'PretendardSemiBold',
                                                      ),
                                                    )),
                                                  ),
                                                  SizedBox(
                                                      width: secondscreenWidth *
                                                          0.03),
                                                  Container(
                                                    width: secondscreenWidth *
                                                        0.41,
                                                    height:
                                                        screenHeight * 0.042,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xff6fbf8a),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        '수락하기',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'PretendardSemiBold',
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: secondscreenWidth * 0.042,
                                top: screenHeight * 0.01),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                      Icons.thumb_up_off_alt_outlined,
                                      size: 20,
                                      color: Color(0xff6fbf8a)),
                                ),
                                SizedBox(width: secondscreenWidth * 0.012),
                                const Text(
                                  '1',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                                SizedBox(width: secondscreenWidth * 0.051),
                                const Icon(
                                  CupertinoIcons.chat_bubble,
                                  size: 20,
                                  color: Color(0xffc1c1c1),
                                ),
                                SizedBox(width: secondscreenWidth * 0.012),
                                const Text(
                                  '2',
                                  style: TextStyle(
                                    color: Color(0xff8e8e8e),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _textEditingController,
                      cursorHeight: 20,
                      textAlignVertical: const TextAlignVertical(y: 0.3),
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
                              onTap: () {},
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
                            fontSize: 14),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const JoinUsDEtailComment(lastComment: false),
                    const Divider(
                      height: 1,
                      color: Color(0xfff5f5f5),
                    ),
                    const JoinUsDEtailComment(lastComment: true),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
