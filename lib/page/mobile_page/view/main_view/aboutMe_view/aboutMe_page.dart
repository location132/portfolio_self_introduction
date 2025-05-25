import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_cubit.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/about_me_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/select_tap.dart';

class AboutMePage extends StatelessWidget {
  final AboutMeModel state;
  final MobileCubit cubit;
  const AboutMePage({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelTextAniStart: state.isTitleAniStart,
          isReverse: !state.isBackGroundAniStart,
          title: '일단 핵심부터',
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        AboutMeDescription(
          isBannerAniStart: state.isDescriptionAniStart,
          isBackGroundAniStart: !state.isBackGroundAniStart,
        ),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity: state.isTabBarAniOpacity ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          child: const SelectTap(),
        ),
      ],
    );
  }
}
