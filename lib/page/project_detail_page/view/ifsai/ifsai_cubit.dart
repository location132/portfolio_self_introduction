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

    const double titleFollowStart = 1500.0;
    double titleOffset = 0.0;

    if (scrollOffset > titleFollowStart) {
      titleOffset = -(scrollOffset - titleFollowStart);
    }

    double scrollDescriptionOpacity = 1.0;
    if (scrollOffset > 0 && scrollOffset < 200) {
      scrollDescriptionOpacity = 1.0 - (scrollOffset / 200);
    } else if (scrollOffset >= 200) {
      scrollDescriptionOpacity = 0.0;
    }

    double mainTitleOpacity = 0.0;
    double mainTitleTranslateY = 50.0;
    if (scrollOffset > 800 && scrollOffset < 1100) {
      final progress = (scrollOffset - 800) / 300;
      mainTitleOpacity = progress;
      mainTitleTranslateY = 50.0 * (1.0 - progress);
    } else if (scrollOffset >= 1100) {
      mainTitleOpacity = 1.0;
      mainTitleTranslateY = 0.0;
    }

    double descriptionOpacity = 0.0;
    double descriptionTranslateY = 50.0;
    if (scrollOffset > 1100 && scrollOffset < 1400) {
      final progress = (scrollOffset - 1100) / 300;
      descriptionOpacity = progress;
      descriptionTranslateY = 50.0 * (1.0 - progress);
    } else if (scrollOffset >= 1400) {
      descriptionOpacity = 1.0;
      descriptionTranslateY = 0.0;
    }

    double titleScale = 1.0;
    double titleOpacity = 1.0;
    if (scrollOffset > 0 && scrollOffset < 800) {
      final progress = scrollOffset / 800;
      titleScale = 1.0 + (0.5 * progress);
      titleOpacity = 1.0 - progress;
    } else if (scrollOffset >= 800) {
      titleScale = 1.5;
      titleOpacity = 0.0;
    }

    emit(
      state.copyWith(
        titleScale: titleScale,
        titleOpacity: titleOpacity,
        mainTitleOpacity: mainTitleOpacity,
        descriptionOpacity: descriptionOpacity,
        titleOffset: titleOffset,
        scrollDescriptionOpacity: scrollDescriptionOpacity,
        mainTitleTranslateY: mainTitleTranslateY,
        descriptionTranslateY: descriptionTranslateY,
      ),
    );
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
