/*
아직 사용되지 않는 페이지 
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class RightTitle extends StatefulWidget {
  final DesktopState state;
  const RightTitle({super.key, required this.state});

  @override
  State<RightTitle> createState() => _RightTitleState();
}

class _RightTitleState extends State<RightTitle> {
  late int finalCount;

  @override
  void initState() {
    super.initState();
    finalCount = widget.state.profileModel.finalCount;
  }

  @override
  void didUpdateWidget(RightTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.profileModel.finalCount !=
        widget.state.profileModel.finalCount) {
      setState(() {
        finalCount = widget.state.profileModel.finalCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: finalCount >= 1 ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Text 1',
                style: GoogleFonts.dancingScript(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: finalCount >= 2 ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Text 2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: finalCount >= 3 ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'MyStory',
                style: GoogleFonts.dancingScript(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          SizedBox(height: 150.sh),
        ],
      ),
    );
  }
}
