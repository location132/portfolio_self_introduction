import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class SkillView extends StatefulWidget {
  final MainPageState? state;
  const SkillView({super.key, required this.state});

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height * 0.75),
        child: ClipRect(
          child: MySkillRive(state: widget.state),
        ),
      ),
    );
  }
}
