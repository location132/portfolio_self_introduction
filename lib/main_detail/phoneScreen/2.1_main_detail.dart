import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
                                '클랭',
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
                                '14명',
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
                                    '학생의 재능을 거래할 수 있는 온라인 마켓플레이스를 개발, 프로젝트에서 Flutter 개발자이자 PM으로 활동하며, Flutter개발 그리고 팀 내 커뮤니케이션을 통한...',
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
              right: screenHeight * 0.035,
              top: screenHeight * 0.05,
              child: Text(
                'KLANG',
                style: TextStyle(
                  color: const Color.fromARGB(255, 110, 136, 246),
                  fontSize: screenHeight * 0.032,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
