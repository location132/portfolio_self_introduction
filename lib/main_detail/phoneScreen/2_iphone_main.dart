import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/main_detail/phoneScreen/2.1_main_detail.dart';
import 'package:self_introduction_flutter/main_detail/phoneScreen/2.2_main_detail.dart';
import 'package:self_introduction_flutter/main_detail/phoneScreen/2.3_main_detail.dart';

class PhoneMainScreen extends StatefulWidget {
  const PhoneMainScreen({super.key});

  @override
  State<PhoneMainScreen> createState() => _PhoneMainScreenState();
}

class _PhoneMainScreenState extends State<PhoneMainScreen> {
  int _nextPage = 0;

  void nextPage(String type) {
    if (type == '++') {
      setState(() {
        _nextPage++;
        print(_nextPage);
      });
    } else {
      setState(() {
        _nextPage--;
        print(_nextPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFFDFDFD),
            image: const DecorationImage(
                image: AssetImage('assets/Images/main_page_bg.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth),
            borderRadius:
                BorderRadius.all(Radius.circular(screenHeight * 0.0483)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      '방문해주셔서 감사합니다!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.014,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: screenHeight * 0.14,
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
                            ),
                            Positioned(
                              top: -30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.09,
                                    width: screenHeight * 0.08,
                                    child:
                                        Image.asset('assets/Images/book-1.png'),
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
                        SizedBox(height: screenHeight * 0.04),
                        Text(
                          'PM으로 진행한 프로젝트',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                        Stack(
                          children: [
                            IgnorePointer(
                              ignoring: _nextPage != 0,
                              child: AnimatedOpacity(
                                opacity: _nextPage == 0 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 420),
                                child: const TestPage(),
                              ),
                            ),
                            IgnorePointer(
                              ignoring: _nextPage != 1,
                              child: AnimatedOpacity(
                                opacity: _nextPage == 1 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 420),
                                child: const TestPage1(),
                              ),
                            ),
                            IgnorePointer(
                              ignoring: _nextPage != 2,
                              child: AnimatedOpacity(
                                opacity: _nextPage == 2 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 420),
                                child: const TestPage2(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        Text(
                          'Flutter 지식 저장소',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.018,
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
          top: screenHeight * 0.52,
          child: _nextPage != 0
              ? InkWell(
                  onTap: () => nextPage('--'),
                  child: Container(
                    decoration: boxDecoration,
                    child: const Icon(Icons.arrow_back,
                        color: Colors.grey, size: 24),
                  ),
                )
              : const SizedBox(),
        ),
        Positioned(
          top: screenHeight * 0.52,
          right: 0,
          child: _nextPage < 2
              ? InkWell(
                  onTap: () => nextPage('++'),
                  child: Container(
                    decoration: boxDecoration,
                    child: const Icon(Icons.arrow_forward,
                        color: Colors.grey, size: 24),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
