import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileTitle extends StatefulWidget {
  final MainPageState state;
  const ProfileTitle({super.key, required this.state});

  @override
  State<ProfileTitle> createState() => _ProfileTitleState();
}

class _ProfileTitleState extends State<ProfileTitle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: widget.state.profileModel.scrollCount != 1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 720),
            child: const TitleText(
              title: TitleTextConstants.title2,
              subTitle: TitleTextConstants.subTitle2,
              description: '  ${TitleTextConstants.description2}',
              color: Colors.white,
            ),
          ),
          AnimatedOpacity(
            opacity: widget.state.profileModel.scrollCount == 1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 720),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: const TitleText(
                title: TitleTextConstants.title2,
                subTitle: TitleTextConstants.subTitle2,
                description: '  ${TitleTextConstants.description2}',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
