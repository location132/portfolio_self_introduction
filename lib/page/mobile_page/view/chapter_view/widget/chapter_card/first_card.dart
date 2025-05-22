import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 258,
      height: 501.3,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${ProfilePage1Constants.chapter1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ' ${ProfilePage1Constants.chapter1Title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
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
