/*
프로필 배경화면의 효과를 담당하는 위젯
별, Rive 애니메이션, 이미지 애니메이션 등을 포함 하고 있음
*/

// 사용 중

import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/components/rive/test.riv.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/background/background_image.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/profile_view/widget/star_animation.dart';

class ProfileBackgroundEffect extends StatefulWidget {
  final int scrollCount;
  const ProfileBackgroundEffect({super.key, required this.scrollCount});

  @override
  State<ProfileBackgroundEffect> createState() =>
      _ProfileBackgroundEffectState();
}

class _ProfileBackgroundEffectState extends State<ProfileBackgroundEffect> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: VisibleorOpacityCondition.isOpacityWith0And1(
                widget.scrollCount),
            duration: const Duration(milliseconds: 720),
            child: StarAnimation(scrollCount: widget.scrollCount),
          ),
        ),
        Positioned.fill(
          child: AnimatedOpacity(
            opacity:
                VisibleorOpacityCondition.isOpacityWith3(widget.scrollCount),
            duration: const Duration(milliseconds: 720),
            child: const TestRiv(),
          ),
        ),
        //TODO: 비지빌리티 작업 들어가기
        Positioned.fill(
          child: AnimatedOpacity(
              opacity: widget.scrollCount == 5 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: BackgroundImage(
                stateScrollCount: widget.scrollCount,
                scrollCount: 5,
                imagePath: 'assets/Images/SeminarImage_groom.jpeg',
              )),
        ),
        // 세미나 백그라운드 이미지 2
        Positioned.fill(
          child: AnimatedOpacity(
              opacity: widget.scrollCount == 6 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: BackgroundImage(
                stateScrollCount: widget.scrollCount,
                scrollCount: 6,
                imagePath: 'assets/Images/pdc_groom.jpg',
              )),
        ),
      ],
    );
  }
}
