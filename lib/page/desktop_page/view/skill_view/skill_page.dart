import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/skill_view/skill_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillPage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;
  const SkillPage({super.key, required this.state, required this.desktopCubit});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skill-view'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.7 &&
            state.mySkillModel.status == MySkillViewStatus.inactive) {
          context.read<DesktopCubit>().viewListener('skill');
        }
      },
      child: SkillView(
        isActive: state.mySkillModel.status == MySkillViewStatus.active,
      ),
    );
  }
}
