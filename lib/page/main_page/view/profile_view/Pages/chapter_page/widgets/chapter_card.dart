import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/Pages/chapter_page/widgets/chapter_with_blur.dart';

class ChapterCard extends StatefulWidget {
  final int scrollCount;
  final int previousCount;
  final bool isUserClick;
  const ChapterCard({
    super.key,
    required this.scrollCount,
    required this.previousCount,
    required this.isUserClick,
  });

  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _leftSlide;
  late Animation<Offset> _rightSlide;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _leftSlide = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _rightSlide = Tween<Offset>(
      begin: const Offset(0.1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 420));
    _animationController.forward();
  }

  void stopAnimation() async {
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChapterCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scrollCount == 1 || widget.scrollCount == 2) {
      startAnimation();
    } else if (widget.scrollCount == 0 && widget.previousCount == 1) {
      _animationController.reverse();
    } else if (widget.scrollCount == 3) {
      stopAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _leftSlide,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                ProfilePage1Constants.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SlideTransition(
            position: _rightSlide,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ChapterWithBlur(
                isUserClick: widget.isUserClick,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
