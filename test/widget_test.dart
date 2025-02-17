import 'dart:math';
import 'package:flutter/material.dart';

class Waves extends StatefulWidget {
  const Waves({super.key});

  @override
  WavesState createState() => WavesState();
}

class WavesState extends State<Waves> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Color> colors = [
    const Color(0xFFF80000),
    const Color(0xFF00F800),
    const Color(0xFF0000F8),
  ];
  final int nodes = 3;
  final double waveHeight = 120;
  List<Wave> waves = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )
      ..addListener(() {
        setState(() {
          for (var wave in waves) {
            for (var node in wave.nodes) {
              double centerY = MediaQuery.of(context).size.height / 2;
              node[1] = waveHeight / 2 * sin(node[2] / 10) + centerY;
              node[2] += node[3];
            }
          }
        });
      })
      ..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;
    waves.clear();

    for (int i = 0; i < colors.length; i++) {
      waves.add(Wave(colors[i], nodes, screenWidth));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: WavePainter(waves, waveHeight),
    );
  }
}

class Wave {
  final Color color;
  List<List<double>> nodes = [];

  Wave(this.color, int nodes, double screenWidth) {
    for (int i = 0; i <= nodes + 3; i++) {
      this.nodes.add([
        (i - 1) * screenWidth / nodes, // x 좌표
        0, // y 좌표 (초기값)
        Random().nextDouble() * 200, // 랜덤한 시작값
        0.3 // 속도
      ]);
    }
  }
}

class WavePainter extends CustomPainter {
  final List<Wave> waves;
  final double waveHeight;

  WavePainter(this.waves, this.waveHeight);

  @override
  void paint(Canvas canvas, Size size) {
    // 배경 색상 추가
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = const Color(0xFFF8F8F8));

    // 각 웨이브에 대해
    for (var wave in waves) {
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = wave.color
        ..blendMode = BlendMode.overlay; // 각 웨이브마다 overlay 적용

      Path path = Path();
      path.moveTo(0, size.height); // 왼쪽 하단에서 시작

      // 첫 번째 노드로 이동
      path.lineTo(wave.nodes[0][0], wave.nodes[0][1]);

      // 나머지 노드들을 quadratic bezier curve로 연결
      for (int i = 0; i < wave.nodes.length - 1; i++) {
        double currentX = wave.nodes[i][0];
        double currentY = wave.nodes[i][1];
        double nextX = wave.nodes[i + 1][0];
        double nextY = wave.nodes[i + 1][1];

        // 중간점 계산
        double midX = (currentX + nextX) / 2;
        double midY = (currentY + nextY) / 2;

        path.quadraticBezierTo(currentX, currentY, midX, midY);
      }

      // 마지막 노드에서 오른쪽 하단으로
      path.lineTo(wave.nodes.last[0], wave.nodes.last[1]);
      path.lineTo(size.width, size.height);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


/////////00000000
/*
import 'dart:math';
import 'package:flutter/material.dart';

class Waves extends StatefulWidget {
  const Waves({super.key});

  @override
  WavesState createState() => WavesState();
}

class WavesState extends State<Waves> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Color> colors = [
    const Color(0xFFF80000),
    const Color(0xFF00F800),
    const Color(0xFF0000F8),
  ];
  final int nodes = 3;
  final double waveHeight = 120;
  List<Wave> waves = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _controller.addListener(() {
      for (var wave in waves) {
        for (var node in wave.nodes) {
          double centerY = MediaQuery.of(context).size.height / 2;
          node[1] = waveHeight / 2 * sin(node[2] / 10) + centerY;
          node[2] += node[3];
        }
      }
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;
    waves.clear();

    for (int i = 0; i < colors.length; i++) {
      waves.add(Wave(colors[i], nodes, screenWidth));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: WavePainter(waves, waveHeight),
    );
  }
}

class Wave {
  final Color color;
  List<List<double>> nodes = [];

  Wave(this.color, int nodes, double screenWidth) {
    for (int i = 0; i <= nodes + 3; i++) {
      this.nodes.add([
        (i - 1) * screenWidth / nodes,
        0,
        Random().nextDouble() * 200,
        0.15
      ]);
    }
  }
}

class WavePainter extends CustomPainter {
  final List<Wave> waves;
  final double waveHeight;

  WavePainter(this.waves, this.waveHeight);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = const Color(0xFFF8F8F8));

    for (var wave in waves) {
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = wave.color
        ..blendMode = BlendMode.overlay;

      Path path = Path();
      path.moveTo(0, size.height);
      path.lineTo(wave.nodes[0][0], wave.nodes[0][1]);

      for (int i = 0; i < wave.nodes.length - 1; i++) {
        double midX =
            (wave.nodes[i + 1][0] - wave.nodes[i][0]) / 2 + wave.nodes[i][0];
        double midY =
            (wave.nodes[i + 1][1] - wave.nodes[i][1]) / 2 + wave.nodes[i][1];

        path.quadraticBezierTo(wave.nodes[i][0], wave.nodes[i][1], midX, midY);
      }

      path.lineTo(wave.nodes.last[0], wave.nodes.last[1]);
      path.lineTo(size.width, size.height);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

*/