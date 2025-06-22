import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_state.dart';

@injectable
class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(const ScheduleState());

  void initializePage() async {
    emit(state.copyWith(isLoading: false));
  }

  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }
}
