import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'gsshop_state.dart';

@injectable
class GsShopCubit extends Cubit<GsShopState> {
  Timer? _controlsTimer;

  GsShopCubit() : super(const GsShopState());

  void toggleMenu() {
    if (isClosed) return;
    emit(state.copyWith(isMenuClicked: !state.isMenuClicked));
  }

  /// 비디오 초기화
  Future<void> initializeVideo(String videoUrl) async {
    if (isClosed) return;

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await controller.initialize();

      controller.addListener(() => _onVideoStateChanged());

      emit(
        state.copyWith(
          videoController: controller,
          isVideoInitialized: true,
          isVideoPlaying: controller.value.isPlaying,
        ),
      );
    } catch (error) {
      print('비디오 로딩 에러: $error');
    }
  }

  void _onVideoStateChanged() {
    if (isClosed || state.videoController == null) return;

    final isPlaying = state.videoController!.value.isPlaying;
    if (state.isVideoPlaying != isPlaying) {
      emit(state.copyWith(isVideoPlaying: isPlaying));
    }
  }

  /// 비디오 재생/일시정지 토글
  void toggleVideoPlayPause() {
    if (isClosed || state.videoController == null || !state.isVideoInitialized)
      return;

    if (state.videoController!.value.isPlaying) {
      state.videoController!.pause();
    } else {
      state.videoController!.play();
    }
  }

  /// 비디오 컨트롤 표시/숨김 토글
  void toggleVideoControls() {
    if (isClosed) return;

    emit(state.copyWith(showVideoControls: !state.showVideoControls));

    if (state.showVideoControls) {
      _startControlsTimer();
    }
  }

  void _startControlsTimer() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      if (!isClosed) {
        emit(state.copyWith(showVideoControls: false));
      }
    });
  }

  @override
  Future<void> close() {
    _controlsTimer?.cancel();
    if (state.videoController != null) {
      state.videoController!.dispose();
    }
    return super.close();
  }
}
