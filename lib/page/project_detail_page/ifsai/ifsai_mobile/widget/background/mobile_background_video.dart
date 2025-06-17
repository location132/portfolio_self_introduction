import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'package:video_player/video_player.dart';

class MobileBackgroundVideo extends StatefulWidget {
  final IfsaiState state;

  const MobileBackgroundVideo({super.key, required this.state});

  @override
  State<MobileBackgroundVideo> createState() => _MobileBackgroundVideoState();
}

class _MobileBackgroundVideoState extends State<MobileBackgroundVideo>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

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
  void didUpdateWidget(MobileBackgroundVideo oldWidget) {
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
    return Column(
      children: [
        SizedBox(
          width: 320.w,
          height: 180.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    'assets/Images/ifsai_img/cpu.png',
                    fit: BoxFit.cover,
                  ),
                ),

                if (widget.state.backgroundVideoController != null &&
                    widget.state.isBackgroundVideoInitialized &&
                    widget
                        .state
                        .backgroundVideoController!
                        .value
                        .isInitialized &&
                    widget.state.hasBackgroundStartedPlaying)
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

                if (widget.state.backgroundVideoController != null &&
                    widget.state.isBackgroundVideoInitialized &&
                    widget
                        .state
                        .backgroundVideoController!
                        .value
                        .isInitialized &&
                    widget.state.hasBackgroundStartedPlaying &&
                    !widget.state.isBackgroundVideoCompleted &&
                    widget.state.backgroundVideoController!.value.isPlaying)
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        width: 50.w,
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
                        width: 50.w,
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
                    widget.state.isBackgroundVideoCompleted ||
                    (widget.state.backgroundVideoController != null &&
                        !widget
                            .state
                            .backgroundVideoController!
                            .value
                            .isPlaying))
                  Positioned(
                    right: 20.w,
                    bottom: 20.h,
                    child: GestureDetector(
                      onTap:
                          () =>
                              context
                                  .read<IfsaiCubit>()
                                  .replayBackgroundVideo(),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.8),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 25.sp,
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
        SizedBox(height: 12.h),
        Text(
          '해당 영상은 잎사이(IFSAI)를 쉽게 설명하기 위해 제작하였습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
