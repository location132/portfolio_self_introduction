import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

@injectable
class TechBlogPostDetailCubit extends Cubit<TechBlogPostDetailState> {
  TechBlogPostDetailCubit()
    : super(TechBlogPostDetailState(scrollController: ScrollController()));

  double? targetScrollOffset;

  // 메뉴 변경
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  // 플레이어 포커스
  void togglePlayerFocus(String title) async {
    if (!state.isPlayerClicked) {
      emit(state.copyWith(isPlayerClicked: true, isScreenFilter: true));

      emit(state.copyWith(showOptions: true));
    }
  }

  // 화면 필터
  void toggleScreenFilter() {
    emit(state.copyWith(isScreenFilter: !state.isScreenFilter));
  }

  // 플레이어 포커스 해제
  void clearPlayerFocus() {
    emit(
      state.copyWith(
        isPlayerClicked: false,
        showOptions: false,
        searchQuery: '',
        isScreenFilter: false,
      ),
    );
  }

  // 플레이어 직접 클릭 처리
  void handlePlayerClick() {
    if (!state.isPlayerClicked) {
      togglePlayerFocus('');
    }
  }

  // 검색어 업데이트
  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  // 플레이어 메뉴바
  void handleQuickAction(String action) {
    switch (action) {
      case 'code':
        emit(
          state.copyWith(
            isPlayerClicked: false,
            showOptions: false,
            isScreenFilter: false,
          ),
        );
        _scrollToCodeSection();
        break;
      case 'filter':
        emit(
          state.copyWith(
            isPlayerClicked: false,
            showOptions: false,
            isScreenFilter: false,
          ),
        );
        emit(
          state.copyWith(isBackgroundColorWhite: !state.isBackgroundColorWhite),
        );
        break;
    }

    if (action != 'filter') {
      clearPlayerFocus();
    }
  }

  // 스크롤 타겟 오프셋 설정
  void setScrollTargetOffset(double offset) {
    targetScrollOffset = offset;
  }

  void _scrollToCodeSection() {
    final controller = state.scrollController;

    if (controller != null) {
      double targetOffset = targetScrollOffset ?? 1200.0;

      if (controller.hasClients) {
        final maxScrollExtent = controller.position.maxScrollExtent;
        if (targetOffset > maxScrollExtent) {
          targetOffset = maxScrollExtent;
        }
      }

      controller
          .animateTo(
            targetOffset,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          )
          .then((_) {})
          .catchError((error) {});
    }
  }
}
