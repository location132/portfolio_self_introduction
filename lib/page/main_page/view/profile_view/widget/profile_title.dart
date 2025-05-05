import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/widgets/chapter_box.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class ProfileTitleView extends StatefulWidget {
  final int scrollCount;
  const ProfileTitleView({super.key, required this.scrollCount});

  @override
  State<ProfileTitleView> createState() => _ProfileTitleViewState();
}

class _ProfileTitleViewState extends State<ProfileTitleView> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: widget.scrollCount == 0 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 720),
            child: const TitleText(
              title: TitleTextConstants.title2,
              subTitle: TitleTextConstants.subTitle2,
              description: '  ${TitleTextConstants.description2}',
              color: Colors.white,
            ),
          ),
          AnimatedOpacity(
            opacity: widget.scrollCount == 1 ? 1.0 : 0.0,
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
          AnimatedOpacity(
            opacity: widget.scrollCount == 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 720),
            child: Padding(
              padding: EdgeInsets.only(left: 130.sw),
              child: ChapterBox(
                scrollCount: widget.scrollCount,
                chapter: ProfilePage1Constants.chapter1,
                title: '  ${ProfilePage1Constants.chapter1Title}',
                chapterTextStyle: GoogleFonts.dancingScript(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                titleTextStyle: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
