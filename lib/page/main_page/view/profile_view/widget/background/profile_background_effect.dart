/*
프로필 배경화면의 효과를 담당하는 위젯
별, Rive 애니메이션, 이미지 애니메이션 등을 포함 하고 있음
*/

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/components/rive/test.riv.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/background/background_image.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/star_animation.dart';

class ProfileBackgroundEffect extends StatefulWidget {
  final MainPageState state;
  const ProfileBackgroundEffect({super.key, required this.state});

  @override
  State<ProfileBackgroundEffect> createState() =>
      _ProfileBackgroundEffectState();
}

class _ProfileBackgroundEffectState extends State<ProfileBackgroundEffect> {
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Visibility(
            visible: VisibleorOpacityCondition.isVisibleWith0between2(
                widget.state.profileModel.scrollCount),
            replacement: const SizedBox.shrink(),
            child: AnimatedOpacity(
              opacity: VisibleorOpacityCondition.isOpacityWith1(
                  widget.state.profileModel.scrollCount),
              duration: const Duration(milliseconds: 720),
              child: StarAnimation(state: widget.state),
            ),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: VisibleorOpacityCondition.isVisibleWith0(
                widget.state.profileModel.scrollCount),
            replacement: const SizedBox.shrink(),
            child: AnimatedOpacity(
              opacity: VisibleorOpacityCondition.isOpacityWith0And1(
                  widget.state.profileModel.scrollCount),
              duration: const Duration(milliseconds: 720),
              child: const TestRiv(),
            ),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: VisibleorOpacityCondition.isVisibleWith2And3(
                widget.state.profileModel.scrollCount),
            replacement: const SizedBox.shrink(),
            child: AnimatedOpacity(
                opacity: VisibleorOpacityCondition.isOpacityWith3(
                    widget.state.profileModel.scrollCount),
                duration: const Duration(milliseconds: 720),
                child: BackgroundImage(
                  state: widget.state,
                  scrollCount: 3,
                  imagePath: 'assets/Images/SeminarImage_groom.jpeg',
                )),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: VisibleorOpacityCondition.isVisibleWith3And4(
                widget.state.profileModel.scrollCount),
            replacement: const SizedBox.shrink(),
            child: AnimatedOpacity(
                opacity: VisibleorOpacityCondition.isOpacityWith4(
                    widget.state.profileModel.scrollCount),
                duration: const Duration(milliseconds: 720),
                child: BackgroundImage(
                  state: widget.state,
                  scrollCount: 4,
                  imagePath: 'assets/Images/pdc_groom.jpg',
                )),
          ),
        ),
      ],
    );
  }
}
