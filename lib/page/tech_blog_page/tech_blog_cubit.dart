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
    emit(state.copyWith(isTabletMode: screenWidth <= 1200));
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
}
