import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/animation/chapter_screen_ani.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter_screen.dart';

class IntroPhoneScreen extends StatefulWidget {
  final int scrollCount;
  final bool isChapterSkip;

  const IntroPhoneScreen({
    super.key,
    required this.scrollCount,
    required this.isChapterSkip,
  });

  @override
  State<IntroPhoneScreen> createState() => _IntroPhoneScreenState();
}

class _IntroPhoneScreenState extends State<IntroPhoneScreen>
    with TickerProviderStateMixin {
  late ChapterScreenAnimation animation;

  @override
  void initState() {
    super.initState();
    animation = ChapterScreenAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(covariant IntroPhoneScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 3) {
      animation.startAnimationWithBackdrop();
    } else if (widget.scrollCount != 3) {
      animation.reverseAnimationWithBackdrop();
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610.sh,
      child: Stack(
        children: [
          Image.asset('assets/images/profile_card.png'),
          Positioned.fill(
            top: 14.sh,
            left: 13.sh,
            right: 13.sh,
            bottom: 12.sh,
            child: AnimatedBuilder(
              animation: animation.backdropController,
              builder: (context, child) {
                return ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: animation.backdropBlur.value,
                    sigmaY: animation.backdropBlur.value,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(42.sh),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/screen_2.jpeg',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(0, 0, 0,
                                    animation.backdropOpacity.value * 0.4),
                                Color.fromRGBO(0, 0, 0,
                                    animation.backdropOpacity.value * 0.7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(42.sh),
                child: Image.asset('assets/images/screen_2.jpeg',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned.fill(
            top: 14.sh,
            left: 13.sh,
            right: 13.sh,
            bottom: 12.sh,
            child: ChapterScreen(
              scrollCount: widget.scrollCount,
            ),
          ),
        ],
      ),
    );
  }
}
