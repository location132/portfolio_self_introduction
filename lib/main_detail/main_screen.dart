import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/main_detail/Ide_Screen/ide_main_screen.dart';
import 'package:self_introduction_flutter/main_detail/phone_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: widthSize * 0.01, right: widthSize * 0.01),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    PhoneScreen(),
                    IdeScreen(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
