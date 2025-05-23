import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FirstCard extends StatelessWidget {
  final bool isBackGroundAniStart;
  const FirstCard({super.key, required this.isBackGroundAniStart});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBorder(
      borderRadius: BorderRadius.circular(24),
      animationTime: 3,
      borderSize: -3,
      glowSize: 3,
      gradientColors:
          isBackGroundAniStart
              ? const [
                Color(0xFF8C9EFF),
                Color(0xFF82B1FF),
                Color(0xFF80D8FF),
                Color(0xFFB9F6CA),
                Color(0xFFFFF59D),
                Color(0xFFFF8A80),
                Color(0xFFFF80AB),
                Color(0xFFE1BEE7),
                Color(0xFFB388FF),
              ]
              : const [Colors.transparent],
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/Images/Magic Studio Magic Expand L&P - MOBILE.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${ProfilePage1Constants.chapter1}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ' ${ProfilePage1Constants.chapter1Title}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ProfilePage1Constants.chapter1Mobile,
                    style: TextStyle(
                      color: Color.fromARGB(255, 222, 222, 222),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
