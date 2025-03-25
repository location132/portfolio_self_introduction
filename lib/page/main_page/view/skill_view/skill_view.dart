import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/my_skill_rive.dart';

class SkillView extends StatefulWidget {
  const SkillView({super.key});

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1480,
            maxHeight: 1154,
          ),
          child: const MySkillRive(),
        ),
      ),
    );
  }
}
