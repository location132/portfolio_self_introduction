import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class ImageTitleWith2 extends StatefulWidget {
  final MainPageState state;
  const ImageTitleWith2({super.key, required this.state});

  @override
  State<ImageTitleWith2> createState() => _ImageTitleWith2State();
}

class _ImageTitleWith2State extends State<ImageTitleWith2>
    with SingleTickerProviderStateMixin {
  late AnimationController _textAnimationController;

  late Animation<Offset> _slideTextAnimation;
  late Animation<double> _fadeTextAnimation;

  bool _isImageOpacirt = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 720),
    );

    _slideTextAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeOut,
    ));

    _fadeTextAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ImageTitleWith2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.profileModel.scrollCount == 2) {
      if (!_isAnimating) {
        _onImageOpacityChanged();
      }
    } else if (_isAnimating) {
      _isReverse();
    }
  }

  void _onImageOpacityChanged() async {
    setState(() {
      _isImageOpacirt = true;
    });

    await Future.delayed(const Duration(milliseconds: 300));
    await _textAnimationController.forward();
    setState(() {
      _isAnimating = true;
    });
  }

  void _isReverse() async {
    await _textAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedOpacity(
        opacity: VisibleorOpacityCondition.isOpacityWith2(
            widget.state.profileModel.scrollCount),
        duration: const Duration(milliseconds: 720),
        child: Padding(
          padding: EdgeInsets.only(left: 130.sw, right: 130.sw, top: 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 620.sw,
                    child: AnimatedOpacity(
                      opacity: _isImageOpacirt ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 720),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/Images/SeminarImage_groom.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: Text(
                              '판교 디지털센터 groom 강연',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 60),
                  FadeTransition(
                    opacity: _fadeTextAnimation,
                    child: SlideTransition(
                      position: _slideTextAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '매일 배우고, 매일 성장합니다.',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '하루하루 쌓아가는 작은 도전은\n'
                            '다가올 더 큰 도전을 두려워하지 않고, 결국 이겨낼 수 있을 것이라 믿고 있습니다.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.85),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
