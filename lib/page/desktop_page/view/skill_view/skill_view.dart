import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class SkillView extends StatefulWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;
  final bool isActive;
  const SkillView({
    super.key,
    required this.isActive,
    required this.state,
    required this.desktopCubit,
  });

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
          isVisible: widget.isActive,
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: 975,
              minHeight: 800,
            ),
            child: ClipRect(child: MySkillRive(isActive: widget.isActive)),
          ),
        ),

        SizedBox(height: 80.sh),
      ],
    );
  }
}
