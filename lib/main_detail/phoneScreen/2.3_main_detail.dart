import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Text(
                                '프로젝트 명: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'University Battle',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '역할: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Project Manager (PM)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '팀원 수: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '6명',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '프로젝트 상태: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '진행 중',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            children: [
                              Text(
                                '프로젝트 설명: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.014,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: screenHeight * 0.355,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    '다른 학교의 학생과 전공, 예능, 스포츠, 등 대결하며 개인 역량과 취미의 발전, 프로젝트에서 Flutter 개발자이자 PM으로 활동하며, Flutter개발 그리고 팀 내 커뮤니케이션을...',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.014,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: screenHeight * 0.03,
              top: screenHeight * 0.05,
              child: Text(
                'University Battle',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenHeight * 0.02,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
