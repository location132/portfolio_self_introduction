import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoPlayer extends StatefulWidget {
  final IfsaiState state;

  const BackgroundVideoPlayer({super.key, required this.state});

  @override
  State<BackgroundVideoPlayer> createState() => _BackgroundVideoPlayerState();
}

class _BackgroundVideoPlayerState extends State<BackgroundVideoPlayer>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  double? _previousScreenWidth;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IfsaiCubit>().setBackgroundFadeController(_fadeController);
      context.read<IfsaiCubit>().initializeBackgroundVideo();
    });
  }

  @override
  void didUpdateWidget(BackgroundVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state.isBackgroundVideoCompleted &&
        !oldWidget.state.isBackgroundVideoCompleted) {
      _fadeController.forward();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (_previousScreenWidth != null && _previousScreenWidth != screenWidth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
    _previousScreenWidth = screenWidth;

    double videoWidth;
    double videoHeight;

    if (screenWidth > 1024) {
      videoWidth = 600;
      videoHeight = 340;
    } else if (screenWidth > 600) {
      videoWidth = 450;
      videoHeight = 255;
    } else {
      videoWidth = 320;
      videoHeight = 180;
    }

    return Column(
      children: [
        SizedBox(
          width: videoWidth,
          height: videoHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    'assets/Images/ifsai_img/cpu.png',
                    fit: BoxFit.cover,
                  ),
                ),

                if (widget.state.isBackgroundVideoInitialized &&
                    widget.state.backgroundVideoController != null &&
                    widget
                        .state
                        .backgroundVideoController!
                        .value
                        .isInitialized &&
                    widget.state.hasBackgroundStartedPlaying &&
                    !widget.state.isBackgroundVideoCompleted)
                  Stack(
                    children: [
                      SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width:
                                widget
                                    .state
                                    .backgroundVideoController!
                                    .value
                                    .size
                                    .width,
                            height:
                                widget
                                    .state
                                    .backgroundVideoController!
                                    .value
                                    .size
                                    .height,
                            child: VideoPlayer(
                              widget.state.backgroundVideoController!,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withValues(alpha: 0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        width: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.black.withValues(alpha: 0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                if (widget.state.isBackgroundVideoCompleted)
                  AnimatedBuilder(
                    animation: _fadeAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _fadeAnimation.value,
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                      );
                    },
                  ),

                if (!widget.state.hasBackgroundStartedPlaying ||
                    widget.state.isBackgroundVideoCompleted)
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: GestureDetector(
                      onTap:
                          () =>
                              context
                                  .read<IfsaiCubit>()
                                  .replayBackgroundVideo(),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.8),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),

                if (!widget.state.isBackgroundVideoInitialized)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '해당 영상은 잎사이(IFSAI)를 쉽게 설명하기 위해 제작하였습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: screenWidth > 600 ? 14 : 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
