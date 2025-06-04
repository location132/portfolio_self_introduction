import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class SkillView extends StatefulWidget {
  final DesktopState state;
  final Function(int) onTap;

  const SkillView({super.key, required this.state, required this.onTap});

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120.sh),
        TitleText(
          title: TitleTextConstants.title3,
          subTitle: TitleTextConstants.subTitle3,
          description: TitleTextConstants.description3,
          isVisible:
              widget.state.mySkillModel.status == MySkillViewStatus.active,
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
            child: ClipRect(child: MySkillRive(state: widget.state)),
          ),
        ),

        SizedBox(height: 87.sh),
      ],
    );
  }
}
