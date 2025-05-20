/*
프로필 배경화면을 담당하는 위젯
직각삼각형 2개와 직사각형 1개로 이루어져 있음
*/

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/background/diagonal_triangle.dart';

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
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(color: Colors.black),
                  ),
                ],
              ),
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
