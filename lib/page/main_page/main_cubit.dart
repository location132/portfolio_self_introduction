import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:self_introduction_flutter/page/main_page/main_state.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState(scrollController: ScrollController()));

  @postConstruct
  void init() async {
    // 추후 데이터 연결
    emit(state.copyWith(status: MainPageStatus.loading));
    emit(state.copyWith(
      status: MainPageStatus.loaded,
    ));
    //TODO: 배포후 삭제
    // emit(state.copyWith(isScrolled: true, isAnimationStart: true));
  }

  void scrollListener() async {
    if (!state.isScrolled) {
      emit(state.copyWith(isScrolled: true, isAnimationStart: true));
    }
  }
}
