import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/start_page/start_state.dart';

@injectable
class StartPageCubit extends Cubit<StartPageState> {
  StartPageCubit()
      : super(StartPageState(scrollController: ScrollController()));

  void scrollListener() {
    if (!state.isScrolled) {
      emit(state.copyWith(isScrolled: true));
    }
  }

  @override
  Future<void> close() {
    state.scrollController?.dispose();
    return super.close();
  }
}
