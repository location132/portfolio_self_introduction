import 'package:flutter/material.dart';

import 'package:self_introduction_flutter/components/widget/animation/star_animation.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/widgets/chapter_with_blur.dart';

class Page1 extends StatefulWidget {
  final MainPageState state;
  const Page1({super.key, required this.state});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _leftSlide;
  late Animation<Offset> _rightSlide;
  bool _isStarAnimationStart = false;
  bool _isTipOpacity = false;
  bool _isUserClick = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
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
      begin: const Offset(0.2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void startAnimation() async {
    setState(() {
      _isStarAnimationStart = true;
    });
    await Future.delayed(const Duration(milliseconds: 420));
    _animationController.forward();
    await Future.delayed(const Duration(milliseconds: 720));
    setState(() {
      _isTipOpacity = true;
    });
  }

  void stopAnimation() async {
    setState(() {
      _isStarAnimationStart = false;
    });
    await Future.delayed(const Duration(milliseconds: 420));
    _animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 120));
    setState(() {
      _isTipOpacity = false;
    });
  }

  void changePageNumber() {}

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Page1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_animationController.status == AnimationStatus.forward) {
      return;
    } else {
      if (widget.state.profileModel.isUserClick) {
        setState(() {
          _isUserClick = true;
        });
      } else {
        setState(() {
          _isUserClick = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.profileModel.scrollCount == 1) {
      startAnimation();
    } else if (widget.state.profileModel.scrollCount == 2) {
      changePageNumber();
    } else if (widget.state.profileModel.scrollCount == 3 ||
        widget.state.profileModel.scrollCount == 0) {
      stopAnimation();
    }

    return Visibility(
      visible: widget.state.profileModel.scrollCount < 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _isStarAnimationStart ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: const StarAnimation(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 40,
            child: AnimatedOpacity(
              opacity: _isTipOpacity ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: const Text(
                ProfilePage1Constants.retrospect,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
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
                          child: ChapterWithBlur(isUserClick: _isUserClick),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(color: Colors.transparent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
