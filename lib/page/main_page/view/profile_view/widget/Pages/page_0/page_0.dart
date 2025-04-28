import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class Page0 extends StatefulWidget {
  final MainPageState state;
  const Page0({super.key, required this.state});

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  bool _isTextOpacity = true;

  void activeOpacity() async {
    setState(() {
      _isTextOpacity = true;
    });
  }

  void deactiveOpacity() async {
    setState(() {
      _isTextOpacity = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.profileModel.scrollCount == 0) {
      activeOpacity();
    } else {
      deactiveOpacity();
    }
    return AnimatedOpacity(
      opacity: _isTextOpacity ? 1 : 0,
      duration: const Duration(milliseconds: 1120),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
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
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
