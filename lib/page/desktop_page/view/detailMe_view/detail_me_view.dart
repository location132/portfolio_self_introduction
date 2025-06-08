import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/mobile_detail.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/detailMe_view/widget/app_screen_desktop.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/detailMe_view/widget/error.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class DesktopDetailMeView extends StatefulWidget {
  final DesktopState state;

  const DesktopDetailMeView({super.key, required this.state});

  @override
  State<DesktopDetailMeView> createState() => _DesktopDetailMeViewState();
}

class _DesktopDetailMeViewState extends State<DesktopDetailMeView> {
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
              widget.state.scrollModel.chapterViewState ==
              ChapterViewState.active,
        ),
        const SizedBox(height: 30),

        Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 200),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedOpacity(
                    opacity: MediaQuery.of(context).size.height < 983 ? 1 : 0,
                    duration: const Duration(milliseconds: 700),
                    child: const ErrorSize(),
                  ),
                ),
                SizedBox(height: 200),
              ],
            ),
            SizedBox(
              height: 900,
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: MediaQuery.of(context).size.height < 983 ? 0 : 1,
                    duration: const Duration(milliseconds: 700),
                    child: MobileDetailRive(
                      isStartAni:
                          widget.state.detailMeModel.isDetailMeRiveStart,
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: MediaQuery.of(context).size.height < 983 ? 0 : 1,
                    duration: const Duration(milliseconds: 700),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AppScreenDesktop(
                        isAppPageStart:
                            widget.state.detailMeModel.isAppPageStart,
                        isAppPageScrollStart:
                            widget.state.detailMeModel.isAppPageScrollStart,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
