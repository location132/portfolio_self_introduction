import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/model/tech_note/tech_preview_model.dart';

@injectable
class TechBlogCubit extends Cubit<TechBlogState> {
  TechBlogCubit() : super(const TechBlogState()) {
    _initializeTechPreviews();
  }

  final ScrollController scrollController = ScrollController();
  final GlobalKey dividerKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool _isListenerActive = false;

  @postConstruct
  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dividerKey.currentContext != null) {
        final screenWidth =
            MediaQuery.of(dividerKey.currentContext!).size.width;
        updateListenerState(screenWidth);
      }
      sidePreviewOpacity();
    });
  }

  // 화면 필터 색상
  void toggleSearchExpansion(bool isFocused) {
    emit(state.copyWith(isScreenFilter: isFocused));
  }

  // 카테고리 선택
  void selectCategory(int index) {
    if (state.selectedCategoryIndex == index) {
      return;
    }
    emit(state.copyWith(selectedCategoryIndex: index));
  }

  // 사이드 사진 동작
  void sidePreviewOpacity() async {
    await Future.delayed(const Duration(seconds: 3));
    if (isClosed) return;
    emit(state.copyWith(sidePreviewOpacity: true));
  }

  // 데스크탑 모드 확인
  void onWidgetUpdate(double screenWidth) {
    updateListenerState(screenWidth);
    emit(state.copyWith(isTabletMode: screenWidth <= 1200));
  }

  // 메뉴 변경
  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  // 스크롤 리스너 업데이트 (프리뷰 위치 조절한다고 제작함)
  void updateListenerState(double screenWidth) {
    final shouldBeActive = screenWidth >= 1000;

    if (shouldBeActive && !_isListenerActive) {
      scrollController.addListener(onScroll);
      _isListenerActive = true;
    } else if (!shouldBeActive && _isListenerActive) {
      scrollController.removeListener(onScroll);
      _isListenerActive = false;
      emit(state.copyWith(sidePreviewTopSpace: 0));
    }
  }

  // 스크롤 리스너 이벤트
  void onScroll() {
    if (!_isListenerActive) return;

    final RenderBox? dividerBox =
        dividerKey.currentContext?.findRenderObject() as RenderBox?;
    if (dividerBox != null) {
      final dividerPosition = dividerBox.localToGlobal(Offset.zero);
      final dividerBottom = dividerPosition.dy + dividerBox.size.height;

      final space =
          dividerBottom < 300
              ? (300 - dividerBottom).clamp(0.0, double.infinity)
              : 0.0;

      emit(state.copyWith(sidePreviewTopSpace: space));
    }
  }

  // 프리뷰 데이터
  void _initializeTechPreviews() {
    final previews = [
      const TechPreviewModel(
        title: 'MVVM',
        imagePath: 'assets/Images/preview_tech/MVVM_pre.png',
        keyValue: 'mvvm_preview',
      ),
      const TechPreviewModel(
        title: 'Clean Architecture',
        imagePath: 'assets/Images/preview_tech/clean_pre.png',
        keyValue: 'clean_preview',
      ),
      const TechPreviewModel(
        title: 'Repository Pattern',
        imagePath: 'assets/Images/preview_tech/Repository_pre.png',
        keyValue: 'repository_preview',
      ),
      const TechPreviewModel(
        title: 'BLoC / Cubit',
        imagePath: 'assets/Images/preview_tech/Bloc_pre.png',
        keyValue: 'bloc_preview',
      ),
      const TechPreviewModel(
        title: 'Provider (단점만 모아보기?)',
        imagePath: 'assets/Images/preview_tech/provider_pre.png',
        keyValue: 'provider_preview',
      ),
      const TechPreviewModel(
        title: 'Dependency Injection (GetIt + Injectable)',
        imagePath: 'assets/Images/preview_tech/DI_pre.png',
        keyValue: 'di_preview',
      ),
      const TechPreviewModel(
        title: 'Freezed',
        imagePath: 'assets/Images/preview_tech/Freezed_pre.png',
        keyValue: 'freezed_preview',
      ),
      const TechPreviewModel(
        title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
        imagePath: 'assets/Images/preview_tech/json_pre.png',
        keyValue: 'json_preview',
      ),
      const TechPreviewModel(
        title: 'Isar 로컬 NoSQL DB',
        imagePath: 'assets/Images/preview_tech/isar_pre.png',
        keyValue: 'isar_preview',
      ),
      const TechPreviewModel(
        title: 'SharedPreferences\nFlutter Secure Storage 로컬 캐싱',
        imagePath: 'assets/Images/preview_tech/local_storage_pre.png',
        keyValue: 'local_storage_preview',
      ),
      const TechPreviewModel(
        title: 'MemoryCache\nDio Cache Interceptor - 메모리 및 네트워크 캐싱',
        imagePath: 'assets/Images/preview_tech/memory_cache_pre.png',
        keyValue: 'memory_cache_preview',
      ),
      const TechPreviewModel(
        title: '네이버 로그인',
        imagePath: 'assets/Images/preview_tech/naver_login.png',
        keyValue: 'naver_login_preview',
      ),
      const TechPreviewModel(
        title: '카카오 로그인',
        imagePath: 'assets/Images/preview_tech/kakao_login.png',
        keyValue: 'kakao_login_preview',
      ),
    ];

    emit(state.copyWith(techPreviewList: previews));
  }

  // 기술블로그에 사용자가 마우스 올리면
  void onPostHover(String postTitle) {
    final preview = state.techPreviewList.firstWhere(
      (preview) => preview.title == postTitle,
      orElse:
          () => const TechPreviewModel(
            title: '',
            imagePath: '',
            keyValue: 'default_content',
          ),
    );

    emit(
      state.copyWith(
        isPostHovered: true,
        hoveredPostTitle: postTitle,
        currentPreview: preview.title.isNotEmpty ? preview : null,
      ),
    );
  }

  // 기술블로그에 사용자가 마우스 벗어나면
  void onPostHoverExit() {
    emit(
      state.copyWith(
        isPostHovered: false,
        hoveredPostTitle: '',
        currentPreview: null,
      ),
    );
  }

  @override
  Future<void> close() {
    if (_isListenerActive) {
      scrollController.removeListener(onScroll);
    }
    scrollController.dispose();
    searchController.dispose();
    searchFocusNode.dispose();
    return super.close();
  }
}
