import 'package:flutter/material.dart';

class PhoneMainScreen extends StatefulWidget {
  const PhoneMainScreen({super.key});

  @override
  State<PhoneMainScreen> createState() => _PhoneMainScreenState();
}

class _PhoneMainScreenState extends State<PhoneMainScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
            image: AssetImage('assets/Images/main_page_bg.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth),
        borderRadius: BorderRadius.all(Radius.circular(screenHeight * 0.0483)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.017),
                child: Container(
                  height: screenHeight * 0.03,
                  width: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Text(
                  '안녕하세요',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  '현재 보고계신 페이지는\n저의 프로젝트와 지식을 담은 디지털 포트폴리오입니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.016,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  '저를 소개합니다.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: screenHeight * 0.14,
                          width: screenHeight * 0.14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 33,
                                color: const Color(0xFFD3D3D3).withOpacity(.84),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.09,
                                width: screenHeight * 0.08,
                                child: Image.asset('assets/Images/book-1.png'),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  '자기소개서',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight * 0.014,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  '제 장단점, 포부 등, 모든 것을\n설명하는 Self-Introduction\n에 관한 내용입니다.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight * 0.01,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'PM으로서의 프로젝트 3개',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // 리스트 뷰

                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: screenHeight * 0.24,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 10),
                                    blurRadius: 33,
                                    color: const Color(0xFFD3D3D3)
                                        .withOpacity(.84),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
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
                                            Text(
                                              '학생의 재능을 거래할 수 있는 온라인 마켓플레이스를 개발,\n프로젝트에서 Flutter 개발자이자 PM으로 활동하며,\nFlutter개발과 팀 내 커뮤니케이션을 통한 균형 유지 능력에\n관한 내용입니다.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenHeight * 0.014,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: screenHeight * 0.015,
                              top: screenHeight * 0.03,
                              child: Container(
                                height: screenHeight * 0.07,
                                width: screenHeight * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 10),
                                      blurRadius: 33,
                                      color: const Color(0xFFD3D3D3)
                                          .withOpacity(.84),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'KLANG',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 110, 136, 246),
                                      fontSize: screenHeight * 0.032,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
