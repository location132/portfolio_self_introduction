import 'package:flutter/material.dart';

import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/widget/Pages/page_1/widgets/chapter_card.dart';

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
  bool _isTipOpacity = false;
  bool _isUserClick = false;
  bool _isStartAnimation = false;
  bool _isChapterAnimation = false;

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
    if (_isStartAnimation) {
      return;
    }

    setState(() {
      _isStartAnimation = true;
      _isChapterAnimation = true;
    });
    await Future.delayed(const Duration(milliseconds: 420));
    _animationController.forward();
    await Future.delayed(const Duration(milliseconds: 720));
    setState(() {
      _isTipOpacity = true;
    });
  }

  void stopAnimation() async {
    if (!_isStartAnimation) {
      return;
    }

    setState(() {
      _isStartAnimation = false;
      _isTipOpacity = false;
      _isChapterAnimation = false;
    });
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Page1 oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.state.profileModel.scrollCount == 1 && !_isStartAnimation) {
      startAnimation();
    } else if (widget.state.profileModel.scrollCount == 0 &&
        widget.state.profileModel.previousCount == 1 &&
        _isStartAnimation) {
      stopAnimation();
    } else if (widget.state.profileModel.scrollCount == 2 &&
        _isStartAnimation) {
      stopAnimation();
    }

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

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.state.profileModel.scrollCount == 1 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 720),
      child: Stack(
        children: [
          // 회고 텍스트
          Positioned(
            bottom: 0,
            left: 40,
            child: AnimatedOpacity(
              opacity: _isTipOpacity ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: const Text(
                ProfilePage1Constants.retrospect1,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // 중앙 챕터
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _isChapterAnimation ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: ChapterCard(
                leftSlide: _leftSlide,
                rightSlide: _rightSlide,
                fadeAnimation: _fadeAnimation,
                isUserClick: _isUserClick,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
