import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/components/rive/scroll_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/widget/skill_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/widget/desktop_mobile_skill_view.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/aboutMe_view/widget/player.dart';

class SkillView extends StatefulWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;
  const SkillView({super.key, required this.state, required this.desktopCubit});

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkillTitle(
          status: widget.state.mySkillModel.status,
          currentTitleIndex: widget.state.mySkillModel.currentTitleIndex,
          isButtonVisible: widget.state.mySkillModel.isButtonVisible,
          onPrevious: () => widget.desktopCubit.skillTitlePrevious(),
          onNext: () => widget.desktopCubit.skillTitleNext(),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          height:
              widget.state.mySkillModel.status == MySkillViewStatus.active &&
                      widget.state.mySkillModel.currentTitleIndex == 0 &&
                      !widget.state.mySkillModel.isTitleChanging
                  ? 650
                  : 800,
          child: Stack(
            children: [
              Visibility(
                visible: widget.state.mySkillModel.isRiveVisible,
                child: AnimatedOpacity(
                  opacity: widget.state.mySkillModel.riveOpacity,
                  duration: const Duration(milliseconds: 600),
                  child: Center(
                    child: ClipRect(
                      child: MySkillRive(
                        isActive:
                            widget.state.mySkillModel.status ==
                                MySkillViewStatus.active &&
                            !widget.state.mySkillModel.isTitleChanging,
                      ),
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: widget.state.mySkillModel.isRiveVisible,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: DesktopMobileSkillView(
                      isVisible:
                          widget.state.mySkillModel.status ==
                              MySkillViewStatus.active &&
                          widget.state.mySkillModel.currentTitleIndex == 0 &&
                          !widget.state.mySkillModel.isTitleChanging,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 80.sh),

        Player(
          isPlayerAniOpacity:
              widget.state.mySkillModel.status == MySkillViewStatus.active &&
              widget.state.mySkillModel.currentTitleIndex != 0,
          isPlayerText: '  모니터에 마우스를 호버, 클릭해 더 알아보세요!  ',
          duration: const Duration(milliseconds: 800),
          fontSize: 14,
        ),
        SizedBox(height: 40.sh),
        AnimatedOpacity(
          opacity:
              widget.state.chapterModel.isChapterActive &&
                      !widget.state.chapterModel.isBlackBackgroundColor
                  ? 1
                  : 0,
          duration: const Duration(milliseconds: 600),
          child: SizedBox(width: 50, height: 50, child: ScrollRive()),
        ),
      ],
    );
  }
}
