import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/one_line_title.dart';
import 'package:self_introduction_flutter/model/mobile_page/skill_model.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/skill_view/widget/skill_overview.dart';

class SkillPage extends StatelessWidget {
  final SkillModel state;
  const SkillPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        OneLineTitle(
          isTitelTextAniStart: state.isTitleAniStart,
          duration: 620,
          title: '이런 기술들을 사용해요',
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: AnimatedOpacity(
            opacity: state.isSkillItemsAniStart ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: '전체'),
                      Tab(text: '프로그래밍 스택'),
                      Tab(text: '테스트도구'),
                      Tab(text: '협업 & 디자인'),
                    ],
                  ),
                  SizedBox(
                    height: 250.h,
                    child: TabBarView(
                      children: [
                        SkillTabItem(
                          key: const ValueKey('all'),
                          category: 'all',
                          isAnimationStart: state.isSkillItemsAniStart,
                        ),
                        SkillTabItem(
                          key: const ValueKey('programming'),
                          category: 'programming',
                          isAnimationStart: state.isSkillItemsAniStart,
                        ),
                        SkillTabItem(
                          key: const ValueKey('testing'),
                          category: 'testing',
                          isAnimationStart: state.isSkillItemsAniStart,
                        ),
                        SkillTabItem(
                          key: const ValueKey('collaboration'),
                          category: 'collaboration',
                          isAnimationStart: state.isSkillItemsAniStart,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class SkillTabItem extends StatelessWidget {
  final String category;
  final bool isAnimationStart;

  const SkillTabItem({
    super.key,
    required this.category,
    required this.isAnimationStart,
  });

  List<String> _getIconsForCategory() {
    switch (category) {
      case 'all':
        return [
          'assets/icons/xcode.svg',
          'assets/icons/cursor.png',
          'assets/icons/vsc.png',
          'assets/icons/github.svg',
          'assets/icons/github-desktop.svg',
          'assets/icons/flutter.png',
          'assets/icons/testFlight.svg',
          'assets/icons/firebase.png',
          'assets/icons/simul.png',
          'assets/icons/figma.svg',
          'assets/icons/notion.svg',
          'assets/icons/slack-icon.svg',
          'assets/icons/discord.svg',
          'assets/icons/rive.webp',
          'assets/icons/ms_designer.png',
          'assets/icons/zeplin.svg',
        ];
      case 'programming':
        return [
          'assets/icons/flutter.png',
          'assets/icons/xcode.svg',
          'assets/icons/cursor.png',
          'assets/icons/vsc.png',
          'assets/icons/firebase.png',
          'assets/icons/github.svg',
          'assets/icons/github-desktop.svg',
        ];
      case 'testing':
        return ['assets/icons/testFlight.svg', 'assets/icons/simul.png'];
      case 'collaboration':
        return [
          'assets/icons/figma.svg',
          'assets/icons/notion.svg',
          'assets/icons/slack-icon.svg',
          'assets/icons/discord.svg',
          'assets/icons/rive.webp',
          'assets/icons/ms_designer.png',
          'assets/icons/zeplin.svg',
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SkillOverview(
        key: ValueKey('skill_overview_$category'),
        icons: _getIconsForCategory(),
        isAnimationStart: isAnimationStart,
      ),
    );
  }
}
