import 'package:flutter/material.dart';

class ProjectPlayer extends StatefulWidget {
  final bool isPlayerAniOpacity;
  final String isPlayerText;
  final Duration? duration;
  final bool isLongText;
  final bool isWhiteBackground;

  const ProjectPlayer({
    super.key,
    required this.isPlayerAniOpacity,
    required this.isPlayerText,
    this.duration = const Duration(milliseconds: 500),
    this.isLongText = false,
    this.isWhiteBackground = false,
  });

  @override
  State<ProjectPlayer> createState() => _ProjectPlayerState();
}

class _ProjectPlayerState extends State<ProjectPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _width;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    const appleCurve = Cubic(0.2, 0.0, 0.2, 1.0);

    _width = Tween<double>(
      begin: 0,
      end: widget.isLongText ? 700 : 320,
    ).animate(CurvedAnimation(parent: _controller, curve: appleCurve));

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: appleCurve),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ProjectPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isLongText != widget.isLongText) {
      _width = Tween<double>(
        begin: 0,
        end: widget.isLongText ? 500 : 320,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Cubic(0.2, 0.0, 0.2, 1.0),
        ),
      );
    }

    if (oldWidget.isPlayerAniOpacity != widget.isPlayerAniOpacity) {
      if (widget.isPlayerAniOpacity) {
        if (_controller.status != AnimationStatus.forward &&
            _controller.status != AnimationStatus.completed) {
          _controller.forward();
        }
      } else {
        if (_controller.status != AnimationStatus.reverse &&
            _controller.status != AnimationStatus.dismissed) {
          _controller.reverse();
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (_width.value <= 0) return const SizedBox.shrink();

        return Opacity(
          opacity: _opacity.value,
          child: Center(
            child: Container(
              width: _width.value,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4D000000),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    spreadRadius: -1,
                  ),
                ],
                border: Border.all(color: const Color(0x4DFFFFFF), width: 1),
                color: Colors.transparent,
              ),
              child: Text(
                widget.isPlayerText,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
