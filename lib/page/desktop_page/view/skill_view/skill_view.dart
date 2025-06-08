import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/widget/skill_title.dart';
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
        SizedBox(
          height: 800,
          child: Visibility(
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
        ),
        SizedBox(height: 80.sh),

        Player(
          isPlayerAniOpacity:
              widget.state.mySkillModel.status == MySkillViewStatus.active,
          isPlayerText: 'Skill에 대해 더 알고 싶다면 Click!',
          duration: const Duration(milliseconds: 800),
          fontSize: 14,
          onTap: () {
            // 스킬 관련 액션 처리
          },
        ),
      ],
    );
  }
}
