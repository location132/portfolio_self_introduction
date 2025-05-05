import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class InitPageView extends StatelessWidget {
  final int scrollCount;
  const InitPageView({super.key, required this.scrollCount});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: scrollCount == 0 ? 1 : 0,
      duration: const Duration(milliseconds: 720),
      child: Padding(
        padding: EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Just scroll down a little more, plz',
              textAlign: TextAlign.center,
              style: GoogleFonts.dancingScript(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              '조금만 더 스크롤을 내려주세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
