import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/mobile_page/animation/intro_ani.dart';

class WidgetAnimation extends StatefulWidget {
  final bool isStart;
  final bool isReverse;
  final double? beginDy;
  final Widget child;

  const WidgetAnimation({
    super.key,
    required this.isStart,
    required this.child,
    this.isReverse = false,
    this.beginDy = 0.5,
  });

  @override
  State<WidgetAnimation> createState() => _WidgetAnimationState();
}

class _WidgetAnimationState extends State<WidgetAnimation>
    with TickerProviderStateMixin {
  late TextMoveAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animation = TextMoveAnimation(vsync: this, beginDy: widget.beginDy ?? 0.5);
  }

  @override
  void didUpdateWidget(covariant WidgetAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isStart && !_animation.showController.isCompleted) {
      _animation.forward();
    } else if (widget.isReverse && _animation.showController.isCompleted) {
      _animation.reverse();
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation.moveShow,
      child: FadeTransition(
        opacity: _animation.opacityShow,
        child: widget.child,
      ),
    );
  }
}
