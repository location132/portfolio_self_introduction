import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'animation/terminal_animation_controller.dart';

class TerminalDisplay extends StatefulWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;
  final double? width;
  final double? height;

  const TerminalDisplay({
    super.key,
    required this.state,
    required this.cubit,
    this.width,
    this.height,
  });

  @override
  State<TerminalDisplay> createState() => _TerminalDisplayState();
}

class _TerminalDisplayState extends State<TerminalDisplay>
    with TickerProviderStateMixin {
  late TerminalAnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = TerminalAnimationController();
    _animationController.initializeAnimation(this);
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
    final screenWidth = MediaQuery.of(context).size.width;
    final terminalWidth =
        widget.width ?? (screenWidth > 1200 ? 1200.0 : screenWidth * 0.9);
    final terminalHeight = widget.height ?? 400.0;

    return Container(
      width: terminalWidth,
      padding: const EdgeInsets.all(16),
      height: terminalHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                TerminalTextConstants.terminalHeader,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: _buildTerminalText(widget.state.terminalOutput),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                  if (widget.state.isTerminalExecuting)
                    const Row(
                      children: [
                        Text(
                          TerminalTextConstants.executingText,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.yellow,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
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
                              child: const Text(
                                '▎',
                                style: TextStyle(
                                  fontFamily: 'monospace',
                                  color: Colors.white,
                                  fontSize: 16,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      widget.state.isTerminalExecuting
                          ? Colors.grey[700]
                          : Colors.green[700],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  TerminalTextConstants.executeButtonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
