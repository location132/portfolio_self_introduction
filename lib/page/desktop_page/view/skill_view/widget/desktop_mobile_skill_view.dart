// TODO: 클래스 분리

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/animation/desktop_skill_animation.dart';

class DesktopMobileSkillView extends StatelessWidget {
  final bool isVisible;

  const DesktopMobileSkillView({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  isScrollable: false,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabAlignment: TabAlignment.center,
                  tabs: [
                    Tab(text: '전체'),
                    Tab(text: '프로그래밍 스택'),
                    Tab(text: '테스트도구'),
                    Tab(text: '협업 & 디자인'),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: 600,
                  child: TabBarView(
                    children: [
                      DesktopSkillTabItem(
                        key: const ValueKey('all'),
                        category: 'all',
                        isAnimationStart: isVisible,
                      ),
                      DesktopSkillTabItem(
                        key: const ValueKey('programming'),
                        category: 'programming',
                        isAnimationStart: isVisible,
                      ),
                      DesktopSkillTabItem(
                        key: const ValueKey('testing'),
                        category: 'testing',
                        isAnimationStart: isVisible,
                      ),
                      DesktopSkillTabItem(
                        key: const ValueKey('collaboration'),
                        category: 'collaboration',
                        isAnimationStart: isVisible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class DesktopSkillTabItem extends StatelessWidget {
  final String category;
  final bool isAnimationStart;

  const DesktopSkillTabItem({
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
      child: DesktopSkillOverview(
        key: ValueKey('skill_overview_$category'),
        icons: _getIconsForCategory(),
        isAnimationStart: isAnimationStart,
      ),
    );
  }
}

class DesktopSkillOverview extends StatefulWidget {
  final List<String> icons;
  final bool isAnimationStart;
  const DesktopSkillOverview({
    super.key,
    required this.icons,
    required this.isAnimationStart,
  });

  @override
  State<DesktopSkillOverview> createState() => _DesktopSkillOverviewState();
}

class _DesktopSkillOverviewState extends State<DesktopSkillOverview>
    with TickerProviderStateMixin {
  final List<DesktopSkillAnimation> _skillAnimations = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      }
    });
  }

  void _initializeAnimations() {
    for (var animation in _skillAnimations) {
      animation.dispose();
    }
    _skillAnimations.clear();

    for (int i = 0; i < widget.icons.length; i++) {
      _skillAnimations.add(DesktopSkillAnimation(vsync: this));
    }
  }

  @override
  void didUpdateWidget(DesktopSkillOverview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.icons.length != widget.icons.length) {
      _initializeAnimations();
      if (widget.isAnimationStart) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startSequentialAnimation();
        });
      }
    } else if (oldWidget.isAnimationStart != widget.isAnimationStart) {
      if (widget.isAnimationStart) {
        _startSequentialAnimation();
      } else {
        _resetAnimations();
      }
    }
  }

  void _startSequentialAnimation() async {
    for (var animation in _skillAnimations) {
      animation.reset();
    }

    await Future.delayed(const Duration(milliseconds: 100));

    for (int i = 0; i < _skillAnimations.length; i++) {
      Future.delayed(Duration(milliseconds: i * 120), () {
        if (mounted) {
          _skillAnimations[i].forward();
        }
      });
    }
  }

  void _resetAnimations() {
    for (var animation in _skillAnimations) {
      animation.reset();
    }
  }

  @override
  void dispose() {
    for (var animation in _skillAnimations) {
      animation.dispose();
    }
    super.dispose();
  }

  Widget _buildIcon(String iconPath, int index) {
    Widget iconWidget;

    if (iconPath.endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        iconPath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      );
    } else {
      iconWidget = Image.asset(
        iconPath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      );
    }

    return ScaleTransition(
      scale: _skillAnimations[index].scaleShow,
      child: FadeTransition(
        opacity: _skillAnimations[index].opacityShow,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: iconWidget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withValues(alpha: 0.05),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children:
              widget.icons.asMap().entries.map((entry) {
                return _buildIcon(entry.value, entry.key);
              }).toList(),
        ),
      ),
    );
  }
}
