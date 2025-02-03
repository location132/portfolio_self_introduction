import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/%08core_service/di/injector.dart';
import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_main_screen.dart';
import 'package:self_introduction_flutter/main_detail/phoneScreen/0_iphone_screen.dart';
import 'package:self_introduction_flutter/page/start_page/start_cubit.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<StartPageCubit>(),
      child: const StartPageView(),
    );
  }
}

class StartPageView extends StatefulWidget {
  const StartPageView({super.key});

  @override
  State<StartPageView> createState() => _StartPageViewState();
}

class _StartPageViewState extends State<StartPageView> {
  final ScrollController _scrollController = ScrollController();

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
                SizedBox(
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
                                    '2025',
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.02),
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
                                    style:
                                        TextStyle(fontSize: screenWidth * 0.02),
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
                const SizedBox(height: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
