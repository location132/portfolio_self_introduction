import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:self_introduction_flutter/model/main_page/mySkill_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';

class MySkillRive extends StatefulWidget {
  final DesktopState? state;
  const MySkillRive({super.key, required this.state});

  @override
  State<MySkillRive> createState() => _MySkillRiveState();
}

class _MySkillRiveState extends State<MySkillRive> {
  StateMachineController? _controller;
  SMITrigger? _startAniTrigger;
  bool _hasStarted = false;

  void _onRiveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );

    if (_controller != null) {
      artboard.addController(_controller!);
      _startAniTrigger = _controller!.findSMI<SMITrigger>('start_ani');
    }
  }

  void _startAni() async {
    if (_hasStarted) return;
    _startAniTrigger?.fire();
    _hasStarted = true;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state?.mySkillModel.status == MySkillViewStatus.active &&
        !_hasStarted) {
      _startAni();
    }
    return RiveAnimation.asset(
      'assets/rive/mySkill.riv',
      artboard: 'Artboard',
      stateMachines: const ['State Machine 1'],
      onInit: _onRiveInit,
      antialiasing: true,
      isTouchScrollEnabled: true,
    );
  }
}
