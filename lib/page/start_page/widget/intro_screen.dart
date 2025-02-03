import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/main_page/main_page.dart';
import 'package:self_introduction_flutter/page/start_page/start_cubit.dart';
import 'package:self_introduction_flutter/page/start_page/start_state.dart';

class IntroScreen extends StatelessWidget {
  final StartPageState state;
  const IntroScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedOpacity(
      opacity: state.isScrolled ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      onEnd: () {
        context.read<StartPageCubit>().close();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      },
      child: Column(
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
                        padding: EdgeInsets.only(left: screenWidth * 0.07),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '2025',
                              style: TextStyle(fontSize: screenWidth * 0.02),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'PORTFOLIO',
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.07),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'FLUTTER-이정원',
                              style: TextStyle(fontSize: screenWidth * 0.02),
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
    );
  }
}
