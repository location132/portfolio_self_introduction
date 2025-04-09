import 'package:flutter/material.dart';

class TextFadeAnimation extends StatefulWidget {
  final String text;
  const TextFadeAnimation({super.key, required this.text});

  @override
  State<TextFadeAnimation> createState() => _TextFadeAnimationState();
}

class _TextFadeAnimationState extends State<TextFadeAnimation>
    with TickerProviderStateMixin {
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<String> characters = [];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    for (int i = 0; i < widget.text.length; i++) {
      characters.add(widget.text[i]);
    }
    _createAnimation();
  }

  void _createAnimation() {
    for (int i = 0; i < characters.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 520),
      );

      final animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      );
      controllers.add(controller);
      animations.add(animation);

      Future.delayed(Duration(milliseconds: i * 8), () {
        if (mounted) {
          controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgets = []; // 최종 텍스트 위젯

    for (int i = 0; i < characters.length; i++) {
      textWidgets.add(
        FadeTransition(
          opacity: controllers[i],
          child: Text(
            characters[i],
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Pretendard',
            ),
          ),
        ),
      );
    }
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 2,
      runSpacing: 4,
      children: textWidgets,
    );
  }
}
