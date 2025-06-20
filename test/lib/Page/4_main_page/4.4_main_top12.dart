import 'package:flutter/material.dart';
import 'package:my_dream/Page/4_main_page/4.4.1_main_top_12_container.dart';
import 'package:my_dream/Page/4_main_page/components/main_SmoothPageIndicator.dart';
import 'package:my_dream/Page/4_main_page/components/main_container.dart';
import 'package:my_dream/Page/4_main_page/components/main_title_overview.dart';
import 'package:my_dream/Page/4_main_page/main_dio/main_screen_dio.dart';

class MainTop12 extends StatefulWidget {
  final VoidCallback onLoadingComplete;

  const MainTop12({super.key, required this.onLoadingComplete});

  @override
  State<MainTop12> createState() => _MainTop12State();
}

class _MainTop12State extends State<MainTop12> {
  final PageController _controller = PageController();
  bool _isFinish = false;
  List<Map<String, dynamic>> serverResult = [];
  List<Map<String, dynamic>> storePage1 = [];
  List<Map<String, dynamic>> storePage2 = [];
  List<Map<String, dynamic>> storePage3 = [];
  List<Map<String, dynamic>> storePage4 = [];

  @override
  void initState() {
    super.initState();
    top12GetDio();
  }

  void top12GetDio() async {
    serverResult = await mainScreenTop12();

    _isFinish = dataProcessing();
    if (_isFinish) {
      widget.onLoadingComplete();
    }

    setState(() {});
  }

  bool dataProcessing() {
    storePage1 = serverResult.sublist(0, 3);
    storePage2 = serverResult.sublist(3, 6);
    storePage3 = serverResult.sublist(6, 9);
    storePage4 = serverResult.sublist(9, 12);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        MainTitleOverview(
          title: 'TOP 12 👑',
          onTap: () {
            Navigator.pushNamed(context, '/DetailTop12Store');
          },
        ),
        // 페이지 뷰 만들기
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 6),
              child: SizedBox(
                height: screenWidth * 0.815,
                child: _isFinish
                    ? PageView(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        children: [
                          //---------------------
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.032,
                                right: screenWidth * 0.032,
                                top: 10,
                                bottom: 10),
                            child: MainContainer(
                              content: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: screenWidth * 0.765,
                                      child: Top12(
                                          number: 1,
                                          serverResultData: storePage1));
                                },
                              ),
                            ),
                          ),
                          //--------------------------
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.032,
                                right: screenWidth * 0.032,
                                top: 10,
                                bottom: 10),
                            child: MainContainer(
                              content: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: screenWidth * 0.765,
                                      child: Top12(
                                          number: 4,
                                          serverResultData: storePage2));
                                },
                              ),
                            ),
                          ),
                          //------------------------
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.032,
                                right: screenWidth * 0.032,
                                top: 10,
                                bottom: 10),
                            child: MainContainer(
                              content: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: screenWidth * 0.765,
                                      child: Top12(
                                          number: 7,
                                          serverResultData: storePage3));
                                },
                              ),
                            ),
                          ),
                          //------------------
                          Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth * 0.032,
                                right: screenWidth * 0.032,
                                top: 10,
                                bottom: 10),
                            child: MainContainer(
                              content: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: screenWidth * 0.765,
                                      child: Top12(
                                          number: 10,
                                          serverResultData: storePage4));
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
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
                        ),
                      ),
              ),
            ),
            MainSmoothPageIndicator(
              controller: _controller,
              count: 4,
            ),
          ],
        ),
      ],
    );
  }
}
