import 'dart:math';
import 'package:flutter/material.dart';

/*
해당 클래스는 4시간동안 만들다 실패,
인공지능의 도움으로 만들어졌으나 노션에 자세하게 문서화해 최대한 이해할 수 있도록 작업 진행 하였음
*/

// 사용 중

class StarAnimation extends StatefulWidget {
  final int scrollCount;
  const StarAnimation({super.key, required this.scrollCount});

  @override
  State<StarAnimation> createState() => _StarAnimationState();
}

class _StarAnimationState extends State<StarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _starsController;
  final List<StarData> _stars = [];
  final int _starCount = 80;

  @override
  void didUpdateWidget(StarAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scrollCount == 1) {
      _starsController.repeat(reverse: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _starsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    // 별 데이터 초기화
    _generateStars();
  }

  // 랜덤 별 데이터 생성
  void _generateStars() {
    final random = Random();
    for (int i = 0; i < _starCount; i++) {
      _stars.add(
        StarData(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: 1.0 + random.nextDouble() * 2.0,
          blinkDelay: random.nextDouble(),
          opacity: 0.3 + random.nextDouble() * 0.7,
        ),
      );
    }
  }

  @override
  void dispose() {
    _starsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _starsController,
      builder: (context, child) {
        return CustomPaint(
          painter: StarsPainter(
            stars: _stars,
            animation: _starsController.value,
          ),
        );
      },
    );
  }
}

// 별 데이터 클래스
class StarData {
  final double x;
  final double y;
  final double size;
  final double blinkDelay;
  final double opacity;

  StarData({
    required this.x,
    required this.y,
    required this.size,
    required this.blinkDelay,
    required this.opacity,
  });
}

// 별을 그리는 CustomPainter
class StarsPainter extends CustomPainter {
  final List<StarData> stars;
  final double animation;

  StarsPainter({required this.stars, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (var star in stars) {
      final x = star.x * size.width;
      final y = star.y * size.height;

      final blinkValue =
          sin((animation * 2 * pi) + (star.blinkDelay * 10 * pi));
      final opacity = (blinkValue * 0.5 + 0.5) * star.opacity;

      paint.color = Colors.white.withOpacity(opacity);

      if (opacity.isFinite && x.isFinite && y.isFinite && star.size > 0) {
        paint.color = Colors.white.withOpacity(opacity.clamp(0.0, 1.0));
        canvas.drawCircle(Offset(x, y), star.size, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant StarsPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
