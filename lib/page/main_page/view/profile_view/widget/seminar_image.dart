import 'package:flutter/material.dart';
import 'dart:ui';

class SeminarImage extends StatefulWidget {
  final bool pageStart;
  const SeminarImage({super.key, required this.pageStart});

  @override
  State<SeminarImage> createState() => _SeminarImageState();
}

class _SeminarImageState extends State<SeminarImage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _imageAnimationControllerWithLeft;
  late AnimationController _imageAnimationControllerWithRight;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _leftSlide;
  late Animation<Offset> _rightSlide;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _imageAnimationControllerWithLeft = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _imageAnimationControllerWithRight = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _leftSlide = Tween<Offset>(
      begin: const Offset(-1.2, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _rightSlide = Tween<Offset>(
      begin: const Offset(1.2, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void startAnimation() async {
    _animationController.forward();
    await Future.delayed(const Duration(milliseconds: 420));
    _imageAnimationControllerWithLeft.forward();
    await Future.delayed(const Duration(milliseconds: 420));
    _imageAnimationControllerWithRight.forward();
  }

  void stopAnimation() {
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _imageAnimationControllerWithLeft.dispose();
    _imageAnimationControllerWithRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageStart) {
      startAnimation();
    }
    return AnimatedOpacity(
      opacity: widget.pageStart ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 420),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: AnimatedBuilder(
                animation: _imageAnimationControllerWithLeft,
                builder: (context, child) {
                  final screenHeight = MediaQuery.of(context).size.height;
                  final offsetY = lerpDouble(
                      screenHeight + 100,
                      -screenHeight - 100,
                      _imageAnimationControllerWithLeft.value)!;
                  return Transform.translate(
                    offset: Offset(0, offsetY),
                    child: Column(
                      children: [
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 100),
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 100),
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SlideTransition(
                  position: _leftSlide,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      '테스트 입니당 제목',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _rightSlide,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      '테스트 입니당 내용',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedBuilder(
                animation: _imageAnimationControllerWithRight,
                builder: (context, child) {
                  final screenHeight = MediaQuery.of(context).size.height;
                  final offsetY = lerpDouble(
                      screenHeight + 100,
                      -screenHeight - 100,
                      _imageAnimationControllerWithRight.value)!;
                  return Transform.translate(
                    offset: Offset(0, offsetY),
                    child: Column(
                      children: [
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 100),
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 100),
                        Text(
                          '테스트',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
