import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rive/rive.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState());

  @postConstruct
  void init() async {
    emit(state.copyWith(status: MainPageStatus.loading));
    await _loadStateMachine();
    emit(state.copyWith(status: MainPageStatus.loaded));
  }

  Future<void> _loadStateMachine() async {
    await RiveFile.initialize();
    final data = await rootBundle.load('assets/rive/banner.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
    }

    // 트리거 추가
    final buttonTriggers = [
      controller!.findInput<bool>('button 1'),
      controller.findInput<bool>('button 2'),
      controller.findInput<bool>('button 3'),
      controller.findInput<bool>('button 4'),
      controller.findInput<bool>('button 5'),
    ];

    emit(
        state.copyWith(controller: controller, buttonTriggers: buttonTriggers));
  }

  void handleHover(bool isHovering, int buttonIndex) {
    if (buttonIndex >= 0 && buttonIndex < state.buttonTriggers.length) {
      state.buttonTriggers[buttonIndex]!.value = isHovering;
    }
  }
}
