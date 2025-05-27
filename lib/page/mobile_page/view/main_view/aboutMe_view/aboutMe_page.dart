import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/aboutMe_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/about_me_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/select_tap.dart';

class AboutMePage extends StatelessWidget {
  final AboutMeModel state;
  final bool isDetailMeRiveStart;
  const AboutMePage({
    super.key,
    required this.state,
    required this.isDetailMeRiveStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OneLineTitle(
          isTitelTextAniStart: state.isTitleAniStart,
          duration: 620,
          title: '일단 핵심부터',
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        AboutMeDescription(isBannerAniStart: state.isDescriptionAniStart),
        const SizedBox(height: 30),
        AnimatedOpacity(
          opacity: state.isTitleAniStart ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 400),
          child: const SelectTap(),
        ),
      ],
    );
  }
}
