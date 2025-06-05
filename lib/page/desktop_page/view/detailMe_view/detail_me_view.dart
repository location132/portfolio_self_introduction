import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/mobile_detail.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/detailMe_view/widget/app_screen_desktop.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class DesktopDetailMeView extends StatelessWidget {
  final DesktopState state;

  const DesktopDetailMeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: '더 자세히 살펴보기',
          subTitle: '',
          description: '',
          titleFontSize: 34,
          color: Colors.white,
          isVisible:
              state.scrollModel.chapterViewState == ChapterViewState.active,
        ),
        const SizedBox(height: 30),
        Container(
          height: MediaQuery.of(context).size.height,
          constraints: const BoxConstraints(minHeight: 600, maxHeight: 900),
          child: Stack(
            children: [
              MobileDetailRive(
                isStartAni: state.detailMeModel.isDetailMeRiveStart,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppScreenDesktop(
                  isAppPageStart: state.detailMeModel.isAppPageStart,
                  isAppPageScrollStart:
                      state.detailMeModel.isAppPageScrollStart,
                  controller: state.scrollModel.subScrollController!,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
