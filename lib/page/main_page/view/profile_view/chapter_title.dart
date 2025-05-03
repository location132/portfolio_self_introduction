import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/widgets/chapter_box.dart';

class ChapterTitle extends StatelessWidget {
  final String chapter;
  final String title;
  final MainPageState state;
  const ChapterTitle(
      {super.key,
      required this.state,
      required this.chapter,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 130.sw,
      child: ChapterBox(
        state: state,
        chapter: chapter,
        title: title,
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
    );
  }
}
