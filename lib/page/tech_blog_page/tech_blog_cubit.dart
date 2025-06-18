import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

@injectable
class TechBlogCubit extends Cubit<TechBlogState> {
  TechBlogCubit() : super(const TechBlogState());

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

  // 사이드 사진 동작
  void sidePreviewOpacity() async {
    await Future.delayed(const Duration(seconds: 3));
    if (isClosed) return;
    emit(state.copyWith(sidePreviewOpacity: true));
  }

  void onWidgetUpdate(double screenWidth) {
    updateListenerState(screenWidth);
  }

  void toggleMenu() {
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  void initializeScrollListener(double screenWidth) {
    updateListenerState(screenWidth);
  }

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

  void updateSidePreviewTopSpace(double space) {
    emit(state.copyWith(sidePreviewTopSpace: space));
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

  void loadBlogPosts() {
    emit(state.copyWith(isLoading: true));

    final mockPosts = [
      const BlogPost(
        id: '1',
        title: 'Flutter와 Clean Architecture',
        description:
            'MVVM 패턴과 Clean Architecture를 적용한 실제 프로젝트 경험을 공유합니다. 대규모 프로젝트에서 코드 유지보수성을 높이는 방법들을 실제 사례와 함께 정리했습니다.',
        date: '2025.01.15',
        content: '블로그 내용...',
        tags: ['Flutter', 'Architecture', 'MVVM'],
        isPublished: false,
      ),
      const BlogPost(
        id: '2',
        title: 'BLoC 패턴 완전 정복',
        description:
            'BLoC/Cubit을 활용한 상태 관리 노하우와 팁들을 정리했습니다. 복잡한 앱 상태를 효율적으로 관리하는 방법을 다룹니다.',
        date: '2025.01.10',
        content: '블로그 내용...',
        tags: ['Flutter', 'Dart', 'BLoC'],
        isPublished: false,
      ),
      const BlogPost(
        id: '3',
        title: 'Flutter 애니메이션과 Rive',
        description:
            'Rive 애니메이션을 Flutter에 통합하는 과정과 최적화 방법을 다룹니다. 인터랙티브한 UI를 만드는 실전 노하우를 공유합니다.',
        date: '2025.01.05',
        content: '블로그 내용...',
        tags: ['Flutter', 'Animation', 'Rive'],
        isPublished: false,
      ),
      const BlogPost(
        id: '4',
        title: 'Dart 언어 심화 학습',
        description:
            'Dart 언어의 고급 기능들과 효율적인 코드 작성법을 알아봅니다. Null Safety부터 Extension까지 다양한 기능을 실습과 함께 학습합니다.',
        date: '2025.01.01',
        content: '블로그 내용...',
        tags: ['Dart', 'Language'],
        isPublished: false,
      ),
      const BlogPost(
        id: '5',
        title: '의존성 주입과 GetIt 활용법',
        description:
            '의존성 주입의 개념부터 GetIt을 사용한 실제 구현까지. 테스트 가능하고 유지보수가 쉬운 코드를 작성하는 방법을 알아봅니다.',
        date: '2024.12.28',
        content: '블로그 내용...',
        tags: ['Flutter', 'Architecture', 'DI'],
        isPublished: false,
      ),
      const BlogPost(
        id: '6',
        title: 'Flutter 성능 최적화 가이드',
        description:
            'Flutter 앱의 성능을 향상시키는 다양한 기법들을 알아봅니다. 렌더링 최적화부터 메모리 관리까지 실전에서 사용할 수 있는 팁들을 제공합니다.',
        date: '2024.12.20',
        content: '블로그 내용...',
        tags: ['Flutter', 'Performance'],
        isPublished: false,
      ),
    ];

    emit(
      state.copyWith(
        isLoading: false,
        blogPosts: mockPosts,
        filteredPosts: mockPosts,
      ),
    );
  }

  void searchPosts(String query) {
    emit(state.copyWith(searchQuery: query));
    _applyFilters();
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
    _applyFilters();
  }

  void _applyFilters() {
    List<BlogPost> filtered = state.blogPosts;

    if (state.selectedCategory != 'all') {
      filtered =
          filtered
              .where(
                (post) => post.tags.any(
                  (tag) => tag.toLowerCase().contains(
                    state.selectedCategory.toLowerCase(),
                  ),
                ),
              )
              .toList();
    }

    if (state.searchQuery.isNotEmpty) {
      final query = state.searchQuery.toLowerCase();
      filtered =
          filtered
              .where(
                (post) =>
                    post.title.toLowerCase().contains(query) ||
                    post.description.toLowerCase().contains(query) ||
                    post.tags.any((tag) => tag.toLowerCase().contains(query)),
              )
              .toList();
    }

    emit(state.copyWith(filteredPosts: filtered));
  }
}
