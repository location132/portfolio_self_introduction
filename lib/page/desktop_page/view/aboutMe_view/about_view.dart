import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/aboutMe_view/widget/about_me_description_desktop.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/aboutMe_view/widget/select_tap_desktop.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class DesktopAboutView extends StatelessWidget {
  final DesktopState state;

  const DesktopAboutView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: '일단 핵심부터',
          subTitle: '',
          description: '',
          titleFontSize: 34,
          color: Colors.white,
          isVisible:
              state.scrollModel.chapterViewState == ChapterViewState.active,
        ),
        const SizedBox(height: 30),
        Center(
          child: AboutMeDescriptionDesktop(
            isAniStart:
                state.scrollModel.aboutMeViewState == AboutMeViewState.active,
          ),
        ),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity:
              state.scrollModel.aboutMeViewState == AboutMeViewState.active
                  ? 1.0
                  : 0.0,
          duration: const Duration(milliseconds: 400),
          child: const SelectTapDesktop(),
        ),
      ],
    );
  }
}
