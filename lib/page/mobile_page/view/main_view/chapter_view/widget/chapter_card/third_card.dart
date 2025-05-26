import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class ThirdCard extends StatelessWidget {
  final bool isBackGroundAniStart;
  const ThirdCard({super.key, required this.isBackGroundAniStart});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 501.3,
      width: 258,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/Images/my_self.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black.withValues(alpha: 0.4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' ${ProfilePage1Constants.chapter3}',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ' ${ProfilePage1Constants.chapter3Title}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ProfilePage1Constants.chapter3Mobile,
                          style: TextStyle(
                            color: Color.fromARGB(255, 222, 222, 222),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
