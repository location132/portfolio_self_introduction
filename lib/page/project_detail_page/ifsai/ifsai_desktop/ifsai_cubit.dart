import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:video_player/video_player.dart';

@injectable
class IfsaiCubit extends Cubit<IfsaiState> {
  bool _listenerAdded = false;

  IfsaiCubit() : super(IfsaiState(scrollController: ScrollController())) {
    _addScrollListener();
  }

  @protected
  void _addScrollListener() {
    if (!_listenerAdded && state.scrollController != null) {
      state.scrollController!.addListener(_onScroll);
      _listenerAdded = true;
    }
  }

  // Player
  void setPlayerVisible(bool isVisible) {
    if (isClosed) return;
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
    if (isClosed) return;
    if (isVisible) {
      emit(
        state.copyWith(
          isPlayerVisible: true,
          isPlayerLongText: true,
          playerText: '위 기능은 제 프로젝트의 백그라운드로 구현한 기능입니다.',
        ),
      );
    } else {
      emit(state.copyWith(isPlayerVisible: false));
    }
  }

  void hidePlayerForOtherSections() {
    if (isClosed) return;
    emit(state.copyWith(isPlayerVisible: false));
  }

  // Background Video Methods
  Future<void> initializeBackgroundVideo() async {
    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://kr.object.ncloudstorage.com/web0314/Web2025_ifsai.mp4',
      ),
    );

    await videoController.initialize();
    await videoController.setVolume(0.0);

    if (isClosed) return;
    emit(
      state.copyWith(
        backgroundVideoController: videoController,
        isBackgroundVideoInitialized: true,
      ),
    );

    videoController.addListener(_backgroundVideoListener);
  }

  void _backgroundVideoListener() {
    if (isClosed) return;
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

  // 라이브러리 관련 메서드
  void setLibraryCardsAnimationStarted(bool isStarted) {
    if (isClosed) return;
    if (state.isLibraryCardsAnimationStarted != isStarted) {
      emit(
        state.copyWith(
          isLibraryCardsAnimationStarted: isStarted,
          isLibraryDetailVisible: isStarted,
        ),
      );
    }
  }

  void setLibraryPlayerVisible(bool isVisible) {
    if (isClosed) return;
    if (isVisible) {
      emit(
        state.copyWith(
          isPlayerVisible: true,
          isPlayerLongText: false,
          playerText: '사진을 클릭해주세요',
        ),
      );
    } else {
      emit(state.copyWith(isPlayerVisible: false));
    }
  }

  void setLibraryPlayerText(String text) {
    if (isClosed) return;
    emit(
      state.copyWith(
        isPlayerVisible: true,
        isPlayerLongText: text.length > 20,
        playerText: text,
      ),
    );
  }

  void onBackgroundVisibilityChanged() {
    if (isClosed) return;
    emit(
      state.copyWith(
        isBackgroundVisible: true,
        hasBackgroundStartedPlaying: true,
      ),
    );
    state.backgroundVideoController?.play();
  }

  Future<void> replayBackgroundVideo() async {
    if (isClosed) return;
    if (!state.isBackgroundVideoInitialized ||
        state.backgroundVideoController == null) {
      return;
    }

    await state.backgroundVideoController!.pause();
    await state.backgroundVideoController!.seekTo(Duration.zero);

    if (isClosed) return;
    emit(
      state.copyWith(
        isBackgroundVideoCompleted: false,
        hasBackgroundStartedPlaying: true,
      ),
    );

    state.backgroundFadeController?.reset();

    await Future.delayed(const Duration(milliseconds: 100));
    if (isClosed) return;

    try {
      await state.backgroundVideoController!.play();
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      if (!isClosed) {
        _reinitializeBackgroundVideo();
      }
    }
  }

  Future<void> _reinitializeBackgroundVideo() async {
    if (isClosed) return;
    if (state.backgroundVideoController != null) {
      state.backgroundVideoController!.removeListener(_backgroundVideoListener);
      await state.backgroundVideoController!.dispose();
    }

    if (isClosed) return;
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
    if (isClosed) return;
    emit(
      state.copyWith(
        backgroundVideoController: videoController,
        isBackgroundVideoInitialized: true,
        isBackgroundVideoCompleted: false,
        hasBackgroundStartedPlaying: true,
      ),
    );

    videoController.addListener(_backgroundVideoListener);
    await videoController.setVolume(0.0);
    await videoController.play();
  }

  void setBackgroundFadeController(AnimationController controller) {
    if (isClosed) return;
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

    if (_shouldEmitState(newState) && !isClosed) {
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
    if (isClosed) return;
    if (state.isScrollEnabled != enabled) {
      emit(state.copyWith(isScrollEnabled: enabled));
    }
  }

  // 메뉴 토글 함수
  void toggleMenu() {
    if (isClosed) return;
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  // FAQ 관련 메서드들
  void onFaqVisibilityChanged(int titleIndex) {
    if (isClosed) return;
    if (state.currentFaqTitleIndex != titleIndex) {
      emit(
        state.copyWith(currentFaqTitleIndex: titleIndex, isInFaqSection: true),
      );
    }
  }

  void onFaqSectionVisibilityChanged(bool isVisible) {
    if (isClosed) return;
    if (state.isInFaqSection != isVisible) {
      emit(
        state.copyWith(
          isInFaqSection: isVisible,
          currentFaqTitleIndex: isVisible ? state.currentFaqTitleIndex : 0,
        ),
      );
    }
  }

  // 터미널
  void initializeTerminal() {
    if (isClosed) return;
    emit(state.copyWith(terminalOutput: TerminalTextConstants.terminalPrompt));
  }

  Future<void> copyToClipboard(String command) async {
    await Clipboard.setData(ClipboardData(text: command));
  }

  void setSelectedCommand(String command) {
    if (isClosed) return;
    emit(state.copyWith(selectedCommand: command));
  }

  Future<void> pasteAndExecuteTerminalCommand() async {
    if (isClosed) return;
    if (state.selectedCommand.isNotEmpty) {
      final command = state.selectedCommand;

      emit(
        state.copyWith(
          isTerminalExecuting: true,
          terminalOutput: '${state.terminalOutput}$command\n',
        ),
      );

      await Future.delayed(const Duration(milliseconds: 1000));
      if (isClosed) return;

      final output = _simulateCommandOutput(command);
      emit(
        state.copyWith(
          isTerminalExecuting: false,
          terminalOutput:
              '${state.terminalOutput}$output\n${TerminalTextConstants.terminalPrompt}',
        ),
      );
    }
  }

  String _simulateCommandOutput(String command) {
    if (command.contains('find lib -name "*.dart" | wc -l')) {
      return TerminalTextConstants.totalLinesOutput;
    } else if (command.contains('find lib -name "*.dart" | xargs wc -l')) {
      return TerminalTextConstants.detailedLinesOutput;
    } else if (command.contains('tree lib')) {
      return TerminalTextConstants.treeLibOutput;
    }
    return TerminalTextConstants.invalidCommandMessage;
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

  // -- 사용자가 스크롤 했을 시 인터렉션 효과 나오게 진행 = 6월 16일 시작

  // 1번 프로젝트 컨텐츠 카드
  void onProjectCardVisibilityChanged() {
    if (isClosed) return;
    emit(state.copyWith(isProjectCard1Visible: true));
  }

  // 2번 프로젝트 컨텐츠 카드
  void onProjectCard2VisibilityChanged() {
    if (isClosed) return;
    emit(state.copyWith(isProjectCard1Visible: true));
    emit(state.copyWith(isProjectCard2Visible: true));
  }

  // 3번 프로젝트 컨텐츠 카드
  void onProjectCard3VisibilityChanged() {
    if (isClosed) return;
    emit(state.copyWith(isProjectCard1Visible: true));
    emit(state.copyWith(isProjectCard2Visible: true));
    emit(state.copyWith(isProjectCard3Visible: true));
  }

  // 서비스 위젯
  void onServiceTabVisibilityChanged() {
    if (isClosed) return;
    emit(state.copyWith(isProjectCard1Visible: true));
    emit(state.copyWith(isProjectCard2Visible: true));
    emit(state.copyWith(isProjectCard3Visible: true));
    emit(state.copyWith(isServiceTabVisible: true));
  }

  // 백그라운드 위젯
  void onBackgroundWidgetVisibilityChanged() async {
    emit(state.copyWith(isProjectCard1Visible: true));
    emit(state.copyWith(isProjectCard2Visible: true));

    emit(state.copyWith(isProjectCard3Visible: true));
    emit(state.copyWith(isServiceTabVisible: true));
    emit(state.copyWith(isBackgrounTitleVisible: true));
    await Future.delayed(const Duration(milliseconds: 400));
    if (isClosed) {
      return;
    }
    emit(state.copyWith(isBackgroundContentVisible: true));
    await Future.delayed(const Duration(milliseconds: 400));
    if (isClosed) {
      return;
    }
    emit(state.copyWith(isBackgroundFeatureVisible: true));
  }

  void navigateToTechBlog(BuildContext context, String techName) {
    String route;
    switch (techName) {
      case 'MVVM':
        route = '/tech-blog/post/mvvm';
        break;
      case 'Clean Architecture':
        route = '/tech-blog/post/clean-architecture';
        break;
      case 'Repository Pattern':
        route = '/tech-blog/post/repository-pattern';
        break;
      case 'BLoC / Cubit':
        route = '/tech-blog/post/bloc-cubit';
        break;
      case 'Provider (단점만 모아보기?)':
        route = '/tech-blog/post/provider';
        break;
      case 'Dependency Injection (GetIt + Injectable)':
        route = '/tech-blog/post/dependency-injection';
        break;
      default:
        route = '/tech-blog';
        break;
    }
    context.go(route);
  }

  void navigateToTechBlogCard2(BuildContext context, String techName) {
    String route;
    switch (techName) {
      case 'Freezed':
        route = '/tech-blog/post/freezed';
        break;
      case 'json_serializable\n  json_annotation 자동 JSON 직렬화':
        route = '/tech-blog/post/json-serializable';
        break;
      case 'Isar 로컬 NoSQL DB':
        route = '/tech-blog/post/isar';
        break;
      case 'SharedPreferences\n  Flutter Secure Storage 로컬 캐싱':
      case 'MemoryCache\n  Dio Cache Interceptor - 메모리 및 네트워크 캐싱':
        route = '/schedule';
        break;
      default:
        route = '/tech-blog';
        break;
    }
    context.go(route);
  }
}
