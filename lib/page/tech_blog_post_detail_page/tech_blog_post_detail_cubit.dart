import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

@injectable
class TechBlogPostDetailCubit extends Cubit<TechBlogPostDetailState> {
  TechBlogPostDetailCubit() : super(const TechBlogPostDetailState());

  // 메뉴 변경
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  // 플레이어 포커스
  void togglePlayerFocus(String title) {
    emit(
      state.copyWith(
        isPlayerClicked: true,
        isScreenFilter: true,
        showOptions: true,
      ),
    );
  }

  // 화면 필터
  void toggleScreenFilter() {
    emit(state.copyWith(isScreenFilter: !state.isScreenFilter));
  }

  // 플레이어 포커스 해제
  void clearPlayerFocus() {
    emit(
      state.copyWith(
        playerTitle: '',
        isPlayerClicked: false,
        showOptions: false,
        searchQuery: '',
        isScreenFilter: false,
      ),
    );
  }

  // 플레이어 클릭 처리
  void handlePlayerClick() {
    if (!state.isPlayerClicked) {
      emit(state.copyWith(isPlayerClicked: true, isScreenFilter: true));

      Future.delayed(const Duration(milliseconds: 400), () {
        if (!isClosed && state.isPlayerClicked) {
          emit(state.copyWith(showOptions: true));
        }
      });
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
        // TODO: 코드 예제로 이동
        break;
      case 'filter':
        // TODO: 구현 해야함
        break;
    }

    if (action != 'filter') {
      clearPlayerFocus();
    }
  }
}
