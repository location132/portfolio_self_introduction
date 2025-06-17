import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import '../animation/mobile_terminal_animation_controller.dart';

class MobileTerminalDisplay extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileTerminalDisplay({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  State<MobileTerminalDisplay> createState() => _MobileTerminalDisplayState();
}

class _MobileTerminalDisplayState extends State<MobileTerminalDisplay>
    with TickerProviderStateMixin {
  late MobileTerminalAnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = MobileTerminalAnimationController();
    _animationController.initializeAnimation(this);

    // 터미널 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.state.terminalOutput.isEmpty) {
        context.read<IfsaiCubit>().initializeTerminal();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<TextSpan> _buildTerminalText(String terminalOutput) {
    final lines = terminalOutput.split('\n');
    final List<TextSpan> spans = [];

    for (final line in lines) {
      if (line.contains('jung_won@Lee-Jungwon-MacBookAir IFSAI-Flutter %')) {
        spans.add(
          TextSpan(
            text: '$line\n',
            style: const TextStyle(color: Colors.white),
          ),
        );
      } else if (line.isNotEmpty) {
        spans.add(
          TextSpan(
            text: '$line\n',
            style: const TextStyle(color: Colors.greenAccent),
          ),
        );
      } else {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      height: 300.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12.w,
                height: 12.h,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 12.w,
                height: 12.h,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                width: 12.w,
                height: 12.h,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                TerminalTextConstants.terminalHeader,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: _buildTerminalText(widget.state.terminalOutput),
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                  if (widget.state.isTerminalExecuting)
                    Row(
                      children: [
                        Text(
                          TerminalTextConstants.executingText,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.yellow,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SizedBox(
                          width: 12.w,
                          height: 12.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!widget.state.isTerminalExecuting)
                    Row(
                      children: [
                        AnimatedBuilder(
                          animation: _animationController.cursorAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity:
                                  _animationController.cursorAnimation.value,
                              child: Text(
                                '▎',
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap:
                  widget.state.isTerminalExecuting
                      ? null
                      : () =>
                          context
                              .read<IfsaiCubit>()
                              .pasteAndExecuteTerminalCommand(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color:
                      widget.state.isTerminalExecuting
                          ? Colors.grey[700]
                          : Colors.green[700],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  TerminalTextConstants.executeButtonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
