import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/detail_description.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/pattern_card.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';

class AppPageDesktop extends StatelessWidget {
  final double width;
  final bool isAppPageScrollStart;

  const AppPageDesktop({
    super.key,
    required this.width,
    required this.isAppPageScrollStart,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          isAppPageScrollStart
              ? const ClampingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailDescription(),
          SizedBox(height: 30),
          // 개발 & 패턴
          TechCardSection(constantsType: PatternTextConstants),
          SizedBox(height: 30),
          // 상태관리
          TechCardSection(constantsType: StateManagementConstants),
          SizedBox(height: 30),
          // 생명주기
          TechCardSection(constantsType: LifecycleConstants),
          SizedBox(height: 30),
          // 애니메이션
          TechCardSection(constantsType: AnimationConstants),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
