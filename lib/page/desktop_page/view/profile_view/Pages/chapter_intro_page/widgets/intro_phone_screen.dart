import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/Pages/chapter_intro_page/animation/chapter_screen_ani.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/Pages/chapter_intro_page/widgets/chapter_screen.dart';

class IntroPhoneScreen extends StatefulWidget {
  final ProfileModel profileModel;

  const IntroPhoneScreen({
    super.key,
    required this.profileModel,
  });

  @override
  State<IntroPhoneScreen> createState() => _IntroPhoneScreenState();
}

class _IntroPhoneScreenState extends State<IntroPhoneScreen>
    with TickerProviderStateMixin {
  late ChapterScreenAnimation animation;
  String chapterImage = 'assets/images/screen_2.jpeg';

  @override
  void initState() {
    super.initState();
    animation = ChapterScreenAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(covariant IntroPhoneScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.profileModel.scrollCount == 3 ||
        widget.profileModel.scrollCount == 8) {
      animation.startAnimationWithBackdrop();
    } else if (widget.profileModel.scrollCount != 3 ||
        widget.profileModel.scrollCount != 8) {
      animation.reverseAnimationWithBackdrop();
      updateChapterData(widget.profileModel.scrollCount);
    }
  }

  void updateChapterData(int scrollCount) {
    if (scrollCount == 1 || scrollCount == 2 || scrollCount == 3) {
      chapterImage = 'assets/images/screen_2.jpeg';
    } else if (scrollCount == 6 || scrollCount == 7 || scrollCount == 8) {
      chapterImage = 'assets/images/phone_screen.webp';
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
                          chapterImage,
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
                child: Image.asset(chapterImage, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned.fill(
            top: 14.sh,
            left: 13.sh,
            right: 13.sh,
            bottom: 12.sh,
            child: ChapterScreen(
              scrollCount: widget.profileModel.scrollCount,
            ),
          ),
        ],
      ),
    );
  }
}
