import 'package:flutter/material.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key}); // 수정된 부분

  @override
  State<LoadingBar> createState() => _LoadingBar();
}

class _LoadingBar extends State<LoadingBar> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  late AnimationController _controller3;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 1.8).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 366), () {
      _controller.repeat(reverse: false);
    });

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _animation2 = Tween<double>(begin: -1.0, end: 1.8).animate(_controller2)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 600), () {
      _controller2.repeat(reverse: false);
    });

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _animation3 = Tween<double>(begin: -1.0, end: 1.8).animate(_controller3)
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 900), () {
      _controller3.repeat(reverse: false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 95,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPaint(
                  painter: LoadingBarPainter(animationValue: _animation.value),
                  child: const SizedBox(width: 360, height: 15),
                ),
                CustomPaint(
                  painter: LoadingBarPainter(animationValue: _animation2.value),
                  child: const SizedBox(width: 360, height: 15),
                ),
                CustomPaint(
                  painter: LoadingBarPainter(animationValue: _animation3.value),
                  child: const SizedBox(width: 280, height: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingBarPainter extends CustomPainter {
  final double animationValue;

  LoadingBarPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: const [
        Color.fromARGB(255, 172, 213, 246),
        Color.fromARGB(255, 214, 173, 247),
        Color.fromARGB(70, 255, 255, 255)
      ],
      stops: [animationValue, animationValue + 0.5, animationValue + 1.2],
    );

    var paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(10.0)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
