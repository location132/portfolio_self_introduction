import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';

@injectable
class IfsaiCubit extends Cubit<IfsaiState> {
  IfsaiCubit() : super(IfsaiState(scrollController: ScrollController())) {
    _addScrollListener();
  }

  void _addScrollListener() {
    state.scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    if (isClosed) return;

    final scrollOffset = state.scrollController?.offset ?? 0.0;

    if (scrollOffset <= 0) {
      emit(
        state.copyWith(
          titleScale: 1.0,
          titleOpacity: 1.0,
          mainTitleOpacity: 0.0,
          descriptionOpacity: 0.0,
        ),
      );
    } else if (scrollOffset < 800) {
      final progress = scrollOffset / 800;
      emit(
        state.copyWith(
          titleScale: 1.0 + (0.5 * progress),
          titleOpacity: 1.0 - progress,
          mainTitleOpacity: 0.0,
          descriptionOpacity: 0.0,
        ),
      );
    } else if (scrollOffset < 1000) {
      final progress = (scrollOffset - 800) / 200;
      emit(
        state.copyWith(
          titleScale: 1.5,
          titleOpacity: 0.0,
          mainTitleOpacity: progress,
          descriptionOpacity: 0.0,
        ),
      );
    } else if (scrollOffset < 1200) {
      final progress = (scrollOffset - 1000) / 200;
      emit(
        state.copyWith(
          titleScale: 1.5,
          titleOpacity: 0.0,
          mainTitleOpacity: 1.0,
          descriptionOpacity: progress,
        ),
      );
    } else {
      emit(
        state.copyWith(
          titleScale: 1.5,
          titleOpacity: 0.0,
          mainTitleOpacity: 1.0,
          descriptionOpacity: 1.0,
        ),
      );
    }
  }

  void setScrollEnabled(bool enabled) {
    emit(state.copyWith(isScrollEnabled: enabled));
  }

  @override
  Future<void> close() {
    // 페이지 나갈 때 리스너 정리 및 메모리 해제
    state.scrollController?.removeListener(_onScroll);
    state.scrollController?.dispose();
    return super.close();
  }
}
