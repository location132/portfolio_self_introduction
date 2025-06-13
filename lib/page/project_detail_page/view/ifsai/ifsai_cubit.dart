import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:video_player/video_player.dart';

@injectable
class IfsaiCubit extends Cubit<IfsaiState> {
  bool _listenerAdded = false;

  IfsaiCubit() : super(IfsaiState(scrollController: ScrollController())) {
    _addScrollListener();
  }

  void _addScrollListener() {
    if (!_listenerAdded && state.scrollController != null) {
      state.scrollController!.addListener(_onScroll);
      _listenerAdded = true;
    }
  }

  // Player
  void setPlayerVisible(bool isVisible) {
    if (state.isPlayerVisible != isVisible) {
      emit(
        state.copyWith(
          isPlayerVisible: isVisible,
          isPlayerLongText: false,
          playerText: isVisible ? '궁금한 기술을 클릭해주세요' : state.playerText,
        ),
      );
    }
  }

  void setBackgroundSectionVisible(bool isVisible) {
    if (isVisible) {
      emit(
        state.copyWith(
          isPlayerVisible: true,
          isPlayerLongText: true,
          playerText: '위 기능은 실제 백그라운드로 구현한 기능입니다.',
        ),
      );
    } else {
      emit(state.copyWith(isPlayerVisible: false));
    }
  }

  // Background Video Methods
  Future<void> initializeBackgroundVideo() async {
    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://kr.object.ncloudstorage.com/web0314/Web2025_ifsai.mp4',
      ),
    );

    await videoController.initialize();
    emit(
      state.copyWith(
        backgroundVideoController: videoController,
        isBackgroundVideoInitialized: true,
      ),
    );

    videoController.addListener(_backgroundVideoListener);
  }

  void _backgroundVideoListener() {
    if (state.backgroundVideoController != null &&
        state.backgroundVideoController!.value.position >=
            state.backgroundVideoController!.value.duration &&
        state.backgroundVideoController!.value.duration > Duration.zero) {
      if (!state.isBackgroundVideoCompleted) {
        emit(state.copyWith(isBackgroundVideoCompleted: true));
        state.backgroundFadeController?.forward();
      }
    }
  }

  // Library Cards Animation
  void setLibraryCardsAnimationStarted(bool isStarted) {
    if (state.isLibraryCardsAnimationStarted != isStarted) {
      emit(
        state.copyWith(
          isLibraryCardsAnimationStarted: isStarted,
          isLibraryDetailVisible: isStarted,
        ),
      );
    }
  }

  void onBackgroundVisibilityChanged() {
    emit(
      state.copyWith(
        isBackgroundVisible: true,
        hasBackgroundStartedPlaying: true,
      ),
    );
    state.backgroundVideoController?.play();
  }

  Future<void> replayBackgroundVideo() async {
    if (!state.isBackgroundVideoInitialized ||
        state.backgroundVideoController == null) {
      return;
    }

    await state.backgroundVideoController!.pause();
    await state.backgroundVideoController!.seekTo(Duration.zero);

    emit(
      state.copyWith(
        isBackgroundVideoCompleted: false,
        hasBackgroundStartedPlaying: true,
      ),
    );

    state.backgroundFadeController?.reset();

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      await state.backgroundVideoController!.play();
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      _reinitializeBackgroundVideo();
    }
  }

  Future<void> _reinitializeBackgroundVideo() async {
    if (state.backgroundVideoController != null) {
      state.backgroundVideoController!.removeListener(_backgroundVideoListener);
      await state.backgroundVideoController!.dispose();
    }

    emit(
      state.copyWith(
        backgroundVideoController: null,
        isBackgroundVideoInitialized: false,
      ),
    );

    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://kr.object.ncloudstorage.com/web0314/Web2025_ifsai.mp4',
      ),
    );

    await videoController.initialize();
    emit(
      state.copyWith(
        backgroundVideoController: videoController,
        isBackgroundVideoInitialized: true,
        isBackgroundVideoCompleted: false,
        hasBackgroundStartedPlaying: true,
      ),
    );

    videoController.addListener(_backgroundVideoListener);
    await videoController.play();
  }

  void setBackgroundFadeController(AnimationController controller) {
    emit(state.copyWith(backgroundFadeController: controller));
  }

  // Scroll 처음 시작 시, 스크롤에 따른 애니메이션 정의 한거, 나중에 리펙 들어가자
  void _onScroll() {
    if (isClosed ||
        state.scrollController == null ||
        !state.scrollController!.hasClients) {
      return;
    }

    final scrollOffset = state.scrollController!.offset;

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

    double backgroundDarkness = 0.0;
    Color textColor = Colors.black;
    if (scrollOffset > 800 && scrollOffset < 1400) {
      backgroundDarkness = (scrollOffset - 800) / 600;
      final colorProgress = backgroundDarkness;
      textColor =
          Color.lerp(Colors.black, Colors.white, colorProgress) ?? Colors.black;
    } else if (scrollOffset >= 1400) {
      backgroundDarkness = 1.0;
      textColor = Colors.white;
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

    final newState = state.copyWith(
      titleScale: titleScale,
      titleOpacity: titleOpacity,
      mainTitleOpacity: mainTitleOpacity,
      descriptionOpacity: descriptionOpacity,
      titleOffset: titleOffset,
      scrollDescriptionOpacity: scrollDescriptionOpacity,
      mainTitleTranslateY: mainTitleTranslateY,
      descriptionTranslateY: descriptionTranslateY,
      backgroundDarkness: backgroundDarkness,
      textColor: textColor,
    );

    if (_shouldEmitState(newState)) {
      emit(newState);
    }
  }

  bool _shouldEmitState(IfsaiState newState) {
    const double epsilon = 0.001;

    return (state.titleScale - newState.titleScale).abs() > epsilon ||
        (state.titleOpacity - newState.titleOpacity).abs() > epsilon ||
        (state.mainTitleOpacity - newState.mainTitleOpacity).abs() > epsilon ||
        (state.descriptionOpacity - newState.descriptionOpacity).abs() >
            epsilon ||
        (state.titleOffset - newState.titleOffset).abs() > epsilon ||
        (state.scrollDescriptionOpacity - newState.scrollDescriptionOpacity)
                .abs() >
            epsilon ||
        (state.mainTitleTranslateY - newState.mainTitleTranslateY).abs() >
            epsilon ||
        (state.descriptionTranslateY - newState.descriptionTranslateY).abs() >
            epsilon ||
        (state.backgroundDarkness - newState.backgroundDarkness).abs() >
            epsilon ||
        state.textColor != newState.textColor;
  }

  void setScrollEnabled(bool enabled) {
    if (state.isScrollEnabled != enabled) {
      emit(state.copyWith(isScrollEnabled: enabled));
    }
  }

  // FAQ 관련 메서드들
  void onFaqVisibilityChanged(int titleIndex) {
    if (state.currentFaqTitleIndex != titleIndex) {
      emit(
        state.copyWith(currentFaqTitleIndex: titleIndex, isInFaqSection: true),
      );
    }
  }

  void onFaqSectionVisibilityChanged(bool isVisible) {
    if (state.isInFaqSection != isVisible) {
      emit(
        state.copyWith(
          isInFaqSection: isVisible,
          currentFaqTitleIndex: isVisible ? state.currentFaqTitleIndex : 0,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    if (_listenerAdded && state.scrollController != null) {
      state.scrollController!.removeListener(_onScroll);
      _listenerAdded = false;
    }
    state.scrollController?.dispose();
    return super.close();
  }
}
