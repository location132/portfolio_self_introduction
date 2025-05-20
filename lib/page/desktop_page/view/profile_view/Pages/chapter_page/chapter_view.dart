import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/profile_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/Pages/chapter_page/animation/chapter_view_ani.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/Pages/chapter_page/widgets/chapter_with_blur.dart';

class ChapterView extends StatefulWidget {
  final ProfileModel profileModel;
  const ChapterView({
    super.key,
    required this.profileModel,
  });

  @override
  State<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView>
    with TickerProviderStateMixin {
  late ProfileAnimations animations;

  @override
  void initState() {
    super.initState();
    animations = ProfileAnimations(vsync: this, isVisible: false);
  }

  @override
  void dispose() {
    animations.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ChapterView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.profileModel.scrollCount == 1) {
      animations.startAnimation();
    } else {
      animations.stopAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Visibility(
        visible: animations.isVisible,
        child: Padding(
          padding: EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: animations.slideLeft,
                child: FadeTransition(
                  opacity: animations.fade,
                  child: const Text(
                    ProfilePage1Constants.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: animations.slideRight,
                child: FadeTransition(
                  opacity: animations.fade,
                  child: ChapterWithBlur(
                    isUserClick: widget.profileModel.isUserClick,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
