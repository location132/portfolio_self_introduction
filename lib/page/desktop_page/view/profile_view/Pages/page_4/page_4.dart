import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/chapter_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/Pages/page_4/widgets/my_story.dart';

class Page4 extends StatefulWidget {
  final DesktopState state;
  const Page4({super.key, required this.state});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void startAnimation() {
    _controller.forward();
  }

  void stopAnimation() {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Page4 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.profileModel.scrollCount == 6) {
      startAnimation();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.state.profileModel.scrollCount == 6 ? 1 : 0,
      duration: const Duration(milliseconds: 720),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                ChapterTitle(
                  scrollCount: widget.state.profileModel.scrollCount,
                  chapter: ProfilePage1Constants.chapter3,
                  title: '  ${ProfilePage1Constants.chapter3Title}',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 130.sw, top: 110),
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 520.sh,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/my_self.jpeg'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Padding(
                                padding: EdgeInsets.only(left: 42.sw),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MyStory',
                                      style: GoogleFonts.dancingScript(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('With',
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: 34,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Flutter',
                                      style: GoogleFonts.dancingScript(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //------------- 내 이야기 시작 -------------
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: const MyStory(),
                            ),
                          )
                          //------------- 내 이야기 끝 -------------
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
