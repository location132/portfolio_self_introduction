import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/components/widget/description_button.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';

class SkillView extends StatefulWidget {
  final MainPageState state;
  final Function(int) onTap;
  const SkillView({
    super.key,
    required this.state,
    required this.onTap,
  });

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleText(
          title: TitleTextConstants.title3,
          subTitle: TitleTextConstants.subTitle3,
          description: TitleTextConstants.description3,
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * 0.75),
            child: ClipRect(
              child: MySkillRive(state: widget.state),
            ),
          ),
        ),
        DescriptionButton(
          onTap: () {
            widget.onTap(1);
          },
          state: widget.state,
        ),
      ],
    );
  }
}
