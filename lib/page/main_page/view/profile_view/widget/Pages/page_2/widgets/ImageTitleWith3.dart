import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/condition_utils/visible_condition.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';

class ImageTitleWith3 extends StatefulWidget {
  final MainPageState state;
  const ImageTitleWith3({super.key, required this.state});

  @override
  State<ImageTitleWith3> createState() => _ImageTitleWith3State();
}

class _ImageTitleWith3State extends State<ImageTitleWith3>
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
  void didUpdateWidget(ImageTitleWith3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.profileModel.scrollCount == 3) {
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
        opacity: VisibleorOpacityCondition.isOpacityWith3(
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
                              'assets/Images/pdc_groom.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            child: Text(
                              '선배 개발자의 조언 with 커뮤니케이션',
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
                            '의견의 다름은 가능성의 씨앗입니다.',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            '예전엔 말하는 사람이 되길 원했습니다.\n'
                            '지금은 듣는 사람이 되길 노력하고 있습니다.\n\n'
                            '다른 의견 속에서 더 나은 성장 그리고 목표를 발견하게 되었기 때문입니다.\n\n'
                            '저는 믿고있습니다.\n의견의 다름은 가능성 그리고 성장할 수 있는 씨앗의 첫 단계라는 것을.',
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
