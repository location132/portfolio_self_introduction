import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/chapter_title.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_3/widgets/intro_phone_screen.dart';

import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_3/widgets/intro_text.dart';

class Page3 extends StatefulWidget {
  final MainPageState state;
  const Page3({super.key, required this.state});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: VisibleorOpacityCondition.isOpacityWith1_2(
          widget.state.profileModel.scrollCount),
      duration: const Duration(milliseconds: 720),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                ChapterTitle(
                  state: widget.state,
                  chapter: ProfilePage1Constants.chapter2,
                  title: '  ${ProfilePage1Constants.chapter2Title}',
                ),
                Positioned.fill(
                  top: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IntroPhoneScreen(state: widget.state),
                      const SizedBox(
                        width: 80,
                      ),
                      const IntroText(),
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
