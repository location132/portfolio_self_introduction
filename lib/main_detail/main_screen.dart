import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_main_screen.dart';
import 'package:self_introduction_flutter/main_detail/phone_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isNextPage = false;
  bool _isVisbility = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isNextPage = true;
      });
      await Future.delayed(const Duration(milliseconds: 220));
      setState(() {
        _isVisbility = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedOpacity(
                  opacity: _isNextPage ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 420),
                  child: SizedBox(
                    height: screenHeight * 1,
                    width: screenWidth * 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Images/mainIMG.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: screenWidth * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.07),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '2024',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'PORTFOLIO',
                                style: TextStyle(fontSize: screenWidth * 0.05),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.07),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end, // 오른쪽 정렬
                                  children: [
                                    Text(
                                      'FLUTTER',
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 1),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                SingleChildScrollView(
                  child: Visibility(
                    visible: !_isNextPage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          opacity: !_isVisbility ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 420),
                          child: const Column(
                            children: [
                              PhoneScreen(),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.1),
                        SizedBox(
                          child: AnimatedOpacity(
                            opacity: !_isVisbility ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 420),
                            child: const IdeScreen(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
