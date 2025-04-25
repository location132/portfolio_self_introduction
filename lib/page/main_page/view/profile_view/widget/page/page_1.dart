import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/components/widget/animation/star_animation.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class Page1 extends StatefulWidget {
  final bool pageStart;
  final MainPageState state;
  const Page1({super.key, required this.pageStart, required this.state});

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageStart) {
      startAnimation();
    } else {
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
                            '지금의 저를 만들어준\n 소중한 시간들을 소개합니다.',
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildChapterBox('Chapter 1', '다양한 세미나 참여'),
                              const SizedBox(height: 16),
                              _buildChapterBox('Chapter 2', '경험이 가장 풍부했던 대학생활'),
                              const SizedBox(height: 16),
                              _buildChapterBox('Chapter 3', '진행중인 나의 이야기'),
                            ],
                          ),
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
          Positioned(
            bottom: 0,
            left: 40,
            child: AnimatedOpacity(
              opacity: _isTipOpacity ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 720),
              child: const Text(
                '회고: 빛나는 작은 별의 애니메이션을 100% 혼자 구현하지는 못하였지만, 문서화를 통해 이해할 수 있도록 노션에 세세하게 작성하였습니다.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChapterBox(String chapter, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            chapter,
            style: GoogleFonts.dancingScript(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
