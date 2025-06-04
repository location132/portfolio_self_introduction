import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/description_button.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/widget/desktop_chapter_card.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/animation/chapter_card_animation.dart';

class DesktopChapterView extends StatefulWidget {
  final Function(int)? onCardTap;
  final DesktopState? state;
  final Function(bool)? onDescriptionActive;

  const DesktopChapterView({
    super.key,
    this.onCardTap,
    this.state,
    this.onDescriptionActive,
  });

  @override
  State<DesktopChapterView> createState() => _DesktopChapterViewState();
}

class _DesktopChapterViewState extends State<DesktopChapterView>
    with TickerProviderStateMixin {
  late ChapterCardAnimation cardAnimation;

  @override
  void initState() {
    super.initState();
    cardAnimation = ChapterCardAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(DesktopChapterView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state?.scrollModel.chapterViewState == ChapterViewState.active &&
        oldWidget.state?.scrollModel.chapterViewState !=
            ChapterViewState.active) {
      cardAnimation.startAnimations();
    }
  }

  @override
  void dispose() {
    cardAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: '알면 알수록,',
          subTitle: '이정원',
          description: '',
          titleFontSize: 34,
          isVisible:
              widget.state?.scrollModel.chapterViewState ==
              ChapterViewState.active,
        ),
        SizedBox(height: 40.sh),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 120),
                  SlideTransition(
                    position: cardAnimation.cardAnimation1,
                    child: FadeTransition(
                      opacity: cardAnimation.cardOpacity1,
                      child: Container(
                        height: 501.3 * 1.3,
                        width: 258 * 1.3,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => widget.onCardTap?.call(3),
                          child: const DesktopChapterCard(cardIndex: 3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SlideTransition(
                    position: cardAnimation.cardAnimation2,
                    child: FadeTransition(
                      opacity: cardAnimation.cardOpacity2,
                      child: Container(
                        height: 501.3 * 1.3,
                        width: 258 * 1.3,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => widget.onCardTap?.call(0),
                          child: const DesktopChapterCard(cardIndex: 0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SlideTransition(
                    position: cardAnimation.cardAnimation3,
                    child: FadeTransition(
                      opacity: cardAnimation.cardOpacity3,
                      child: Container(
                        height: 501.3 * 1.3,
                        width: 258 * 1.3,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => widget.onCardTap?.call(1),
                          child: const DesktopChapterCard(cardIndex: 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SlideTransition(
                    position: cardAnimation.cardAnimation4,
                    child: FadeTransition(
                      opacity: cardAnimation.cardOpacity4,
                      child: Container(
                        height: 501.3 * 1.3,
                        width: 258 * 1.3,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () => widget.onCardTap?.call(2),
                          child: const DesktopChapterCard(cardIndex: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 80),
                ],
              ),
            ),
            const SizedBox(height: 60),
            if (widget.state != null && widget.onDescriptionActive != null)
              DescriptionButton(
                onTap: () {
                  widget.onDescriptionActive!(true);
                },
                state: widget.state!,
              ),
            const SizedBox(height: 40),
          ],
        ),
        SizedBox(height: 20.sh),
      ],
    );
  }
}
