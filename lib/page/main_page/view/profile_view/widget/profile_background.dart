import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/deco.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileBackground extends StatefulWidget {
  const ProfileBackground({super.key});

  @override
  State<ProfileBackground> createState() => _ProfileBackgroundState();
}

class _ProfileBackgroundState extends State<ProfileBackground> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform(
          transform: Matrix4.translationValues(0, 1, 0),
          child: const DiagonalTriangle(
              isTop: true, description: TitleTextConstants.description2),
        ),
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const TitleText(
              title: TitleTextConstants.title2,
              subTitle: TitleTextConstants.subTitle2,
              description: '  ${TitleTextConstants.description2}',
              color: Colors.white,
            ),
          ],
        ),
        Transform(
          transform: Matrix4.translationValues(0, -1, 0),
          child: const DiagonalTriangle(isTop: false),
        ),
      ],
    );
  }
}
