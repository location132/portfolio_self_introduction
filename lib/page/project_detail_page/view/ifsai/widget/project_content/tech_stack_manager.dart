import 'package:flutter/material.dart';
import 'animation/tech_stack_animation_controller.dart';
import 'responsive/large_screen_layout.dart';
import 'responsive/medium_screen_layout.dart';
import 'responsive/small_screen_layout.dart';

class TechStackManager extends StatefulWidget {
  final List<Map<String, dynamic>> techStacks;
  final bool isCardStarted;

  const TechStackManager({
    super.key,
    required this.techStacks,
    required this.isCardStarted,
  });

  @override
  State<TechStackManager> createState() => _TechStackManagerState();
}

class _TechStackManagerState extends State<TechStackManager>
    with TickerProviderStateMixin {
  late TechStackAnimationController _animationController;
  bool _showAll = false;

  @override
  void initState() {
    super.initState();
    _animationController = TechStackAnimationController();
    _animationController.initializeAnimation(this);

    if (widget.isCardStarted) {
      _animationController.startAnimation();
    }
  }

  @override
  void didUpdateWidget(TechStackManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isCardStarted && !oldWidget.isCardStarted) {
      _animationController.startAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1250) {
      return LargeScreenLayout.build(
        widget.techStacks,
        _animationController.fadeAnimation,
        _animationController.slideAnimation,
      );
    } else if (screenWidth > 800) {
      return MediumScreenLayout.build(
        widget.techStacks,
        _animationController.fadeAnimation,
        _animationController.slideAnimation,
        _showAll,
        _toggleShowAll,
      );
    } else {
      return SmallScreenLayout.build(
        widget.techStacks,
        _animationController.fadeAnimation,
        _animationController.slideAnimation,
        _showAll,
        _toggleShowAll,
      );
    }
  }

  void _toggleShowAll() {
    setState(() {
      _showAll = !_showAll;
    });
  }
}
