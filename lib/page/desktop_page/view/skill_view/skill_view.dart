import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/chapter_view/widget/chapter_title.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/widget/skill_title.dart';

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
        Center(
          child: SizedBox(
            height: 800,
            child: ClipRect(
              child: MySkillRive(
                isActive:
                    widget.state.mySkillModel.status ==
                    MySkillViewStatus.active,
              ),
            ),
          ),
        ),
        Visibility(
          visible: MediaQuery.of(context).size.height > 900,
          child: ChapterTitle(
            isChapterActive: widget.state.chapterModel.isChapterActive,
            isBlackBackground: widget.state.chapterModel.isBlackBackgroundColor,
            currentTitleIndex: widget.state.chapterModel.currentTitleIndex,
            onPrevious: () => widget.desktopCubit.chapterTitlePrevious(),
            onNext: () => widget.desktopCubit.chapterTitleNext(),
          ),
        ),
      ],
    );
  }
}
