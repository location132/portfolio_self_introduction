import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:self_introduction_flutter/%08core_service/provider.dart';

class RiveAniErrorCheck extends StatefulWidget {
  const RiveAniErrorCheck({super.key});

  @override
  State<RiveAniErrorCheck> createState() => _RiveAniErrorCheckState();
}

class _RiveAniErrorCheckState extends State<RiveAniErrorCheck> {
  late StateMachineController controller;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final _isSuccessScreen = Provider.of<ScreenChange>(context);
    if (_isSuccessScreen.isSuccessSimulator) {
      setState(() {
        check.fire();
      });
    }
    return SizedBox(
      width: 70,
      height: 70,
      child: RiveAnimation.asset(
        'assets/rive/check.riv', // 애니메이션 파일 경로
        onInit: (artboard) {
          StateMachineController controller = getRiveController(artboard);
          check = controller.findSMI("Check") as SMITrigger;
          error = controller.findSMI("Error") as SMITrigger;
          reset = controller.findSMI("Reset") as SMITrigger;
        },
      ),
    );
  }
}
