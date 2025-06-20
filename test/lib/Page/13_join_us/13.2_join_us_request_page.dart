import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/custom_appbar.dart';

class JoinUsRequestPage extends StatefulWidget {
  const JoinUsRequestPage({super.key});

  @override
  State<JoinUsRequestPage> createState() => _JoinUsRequestPageState();
}

class _JoinUsRequestPageState extends State<JoinUsRequestPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentsEditingController =
      TextEditingController();
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sw,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  // 상단 고정 부분
                  Column(
                    children: [
                      const CustomAppBar(title: '글쓰기'),
                      Container(
                        width: 361.sw,
                        height: 239.sh,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 48.5.sh,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Color(0xfff5f5f5),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.sw,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '제목: ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        color: Color(0xff757575),
                                      ),
                                    ),
                                    SizedBox(width: 4.sw),
                                    Expanded(
                                      child: SizedBox(
                                        height: 21,
                                        child: TextFormField(
                                          controller: _titleController,
                                          decoration: const InputDecoration(
                                            hintText: '제목을 입력해주세요.',
                                            hintStyle: TextStyle(
                                              color: Color(0xffc1c1c1),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                          ),
                                          onChanged: (text) {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 14.5.sh),
                            Container(
                              width: 331.sw,
                              height: 160.sh,
                              decoration: BoxDecoration(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: const Color(0xffe0e0e0)),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 7.sw,
                                    ),
                                    child: TextFormField(
                                      controller: _contentsEditingController,
                                      maxLines: null,
                                      maxLength: 1000,
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '내용글을 작성해주세요. (500자 내외)',
                                        hintStyle: TextStyle(
                                          color: Color(0xff8e8e8e),
                                          fontFamily: 'Pretendard',
                                        ),
                                        counterText: '',
                                      ),
                                      onChanged: (text) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 16.sw,
                                    bottom: 10.sh,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                '${_contentsEditingController.text.length}',
                                            style: const TextStyle(
                                              color: Color(0xff5b5b5b),
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' / 1,000',
                                            style: TextStyle(
                                              color: Color(0xff8e8e8e),
                                              fontSize: 14,
                                              fontFamily: 'Pretendard',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: ischecked,
                            onChanged: (bool? value) {
                              setState(() {
                                ischecked = value!;
                              });
                            },
                            activeColor: const Color(0xff6fbf8a),
                            checkColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0xffbdbdbd),
                            ),
                          ),
                          const Text(
                            '초대장 첨부하기',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              color: Color(0xff757575),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: ischecked ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: 361.sw,
                          height: 157.sh,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xffe0e0e0),
                              //color: Colors.grey
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.sw),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70.sw,
                                      height: 70.sh,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(width: 10.sw),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '목포집',
                                          style: TextStyle(
                                            fontFamily: 'PretendardSemiBold',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '2024.10.16(목) 오후 6시 4명',
                                          style: TextStyle(
                                              color: Color(0xff616161)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 18.sh),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 161.sw,
                                      height: 37.sh,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffeeeeee),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        '초대장 보기',
                                        style: TextStyle(
                                          fontFamily: 'Pretendard',
                                        ),
                                      )),
                                    ),
                                    Container(
                                      width: 161.sw,
                                      height: 37.sh,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: const Color(0xffbdbdbd),
                                            width: 2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '취소하기',
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
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
                      ),
                    ],
                  ),
                  // 하단 내용 수정
                ],
              ),
              Positioned(
                bottom: 10.sh,
                child: Container(
                  width: 361.sw,
                  height: 50.sh,
                  decoration: ShapeDecoration(
                    color: const Color(0xff6fbf8a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '등록하기',
                      style: TextStyle(
                        fontFamily: 'PretendardSemiBold',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
