import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/chapter_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/chapter_intro_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/background/profile_background_effect.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/init_page/init_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/profile_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/retrospect_text.dart';

class ProfileView extends StatelessWidget {
  final int scrollCount;
  final int previousCount;
  final bool isUserClick;
  const ProfileView(
      {super.key,
      required this.scrollCount,
      required this.previousCount,
      required this.isUserClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          ProfileBackgroundEffect(scrollCount: scrollCount),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    RetrospectTextView(scrollCount: scrollCount),
                    ProfileTitleView(scrollCount: scrollCount),
                    InitPageView(scrollCount: scrollCount),
                    ChapterView(
                      scrollCount: scrollCount,
                      previousCount: previousCount,
                      isUserClick: isUserClick,
                    ),
                    ChapterIntroView(scrollCount: scrollCount),
                    // 세미나, 컨퍼런스 페이지
                    // Page2(scrollCount: scrollCount),
                    // Page3(scrollCount: scrollCount),
                    // Page4(state: widget.state),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child:
                    //TODO: 삭제 (페이지 넘버)
                    Center(
                  child: Text(
                    scrollCount.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
