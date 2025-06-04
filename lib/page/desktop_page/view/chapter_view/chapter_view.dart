import 'package:flutter/material.dart';
import 'package:glowy_borders/glowy_borders.dart';
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
        Stack(
          children: [
            AnimatedOpacity(
              opacity:
                  widget.state?.chapterModel.isBlackBackgroundColor == true
                      ? 1
                      : 0,
              duration: const Duration(seconds: 1),
              child: TitleText(
                title: '알면 알수록,',
                subTitle: ' 이정원',
                description: '',
                titleFontSize: 34,
                color: Colors.white,
                isVisible:
                    widget.state?.scrollModel.chapterViewState ==
                    ChapterViewState.active,
              ),
            ),
            AnimatedOpacity(
              opacity:
                  widget.state?.chapterModel.isBlackBackgroundColor == false
                      ? 1
                      : 0,
              duration: const Duration(seconds: 1),
              child: TitleText(
                title: 'Flutter 신입은 역시,',
                subTitle: '이정원',
                description: '',
                titleFontSize: 34,
                color: Colors.black,
                isVisible:
                    widget.state?.scrollModel.chapterViewState ==
                    ChapterViewState.active,
              ),
            ),
          ],
        ),
        SizedBox(height: 40.sh),
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
                  child: SizedBox(
                    height: 651.7,
                    width: 335.4,
                    child: AnimatedGradientBorder(
                      borderRadius: BorderRadius.circular(24),
                      animationTime: 3,
                      borderSize: -1,
                      glowSize: 1,
                      gradientColors: const [
                        Color(0xFF8C9EFF),
                        Color(0xFF82B1FF),
                        Color(0xFF80D8FF),
                        Color(0xFFB9F6CA),
                        Color(0xFFFFF59D),
                        Color(0xFFFF8A80),
                        Color(0xFFFF80AB),
                        Color(0xFFE1BEE7),
                        Color(0xFFB388FF),
                      ],
                      child: GestureDetector(
                        onTap: () => widget.onCardTap?.call(3),
                        child: const DesktopChapterCard(cardIndex: 3),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SlideTransition(
                position: cardAnimation.cardAnimation2,
                child: FadeTransition(
                  opacity: cardAnimation.cardOpacity2,
                  child: SizedBox(
                    height: 651.7,
                    width: 335.4,
                    child: AnimatedGradientBorder(
                      borderRadius: BorderRadius.circular(24),
                      animationTime: 3,
                      borderSize: 1,
                      glowSize: 1,
                      gradientColors: const [
                        Color(0xFF8C9EFF),
                        Color(0xFF82B1FF),
                        Color(0xFF80D8FF),
                        Color(0xFFB9F6CA),
                        Color(0xFFFFF59D),
                        Color(0xFFFF8A80),
                        Color(0xFFFF80AB),
                        Color(0xFFE1BEE7),
                        Color(0xFFB388FF),
                      ],
                      child: GestureDetector(
                        onTap: () => widget.onCardTap?.call(0),
                        child: const DesktopChapterCard(cardIndex: 0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SlideTransition(
                position: cardAnimation.cardAnimation3,
                child: FadeTransition(
                  opacity: cardAnimation.cardOpacity3,
                  child: SizedBox(
                    height: 651.7,
                    width: 335.4,
                    child: AnimatedGradientBorder(
                      borderRadius: BorderRadius.circular(24),
                      animationTime: 3,
                      borderSize: 1,
                      glowSize: 1,
                      gradientColors: const [
                        Color(0xFF8C9EFF),
                        Color(0xFF82B1FF),
                        Color(0xFF80D8FF),
                        Color(0xFFB9F6CA),
                        Color(0xFFFFF59D),
                        Color(0xFFFF8A80),
                        Color(0xFFFF80AB),
                        Color(0xFFE1BEE7),
                        Color(0xFFB388FF),
                      ],

                      child: GestureDetector(
                        onTap: () => widget.onCardTap?.call(1),
                        child: const DesktopChapterCard(cardIndex: 1),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              SlideTransition(
                position: cardAnimation.cardAnimation4,
                child: FadeTransition(
                  opacity: cardAnimation.cardOpacity4,
                  child: SizedBox(
                    height: 651.7,
                    width: 335.4,
                    child: AnimatedGradientBorder(
                      borderRadius: BorderRadius.circular(24),
                      animationTime: 3,
                      borderSize: 1,
                      glowSize: 1,
                      gradientColors: const [
                        Color(0xFF8C9EFF),
                        Color(0xFF82B1FF),
                        Color(0xFF80D8FF),
                        Color(0xFFB9F6CA),
                        Color(0xFFFFF59D),
                        Color(0xFFFF8A80),
                        Color(0xFFFF80AB),
                        Color(0xFFE1BEE7),
                        Color(0xFFB388FF),
                      ],
                      child: GestureDetector(
                        onTap: () => widget.onCardTap?.call(2),
                        child: const DesktopChapterCard(cardIndex: 2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 80),
            ],
          ),
        ),
        SizedBox(height: 20.sh),
      ],
    );
  }
}
