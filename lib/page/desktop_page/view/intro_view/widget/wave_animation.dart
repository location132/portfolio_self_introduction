import 'dart:math';
import 'package:flutter/material.dart';

class Waves extends StatefulWidget {
  final String deviceType;
  const Waves({
    super.key,
    required this.deviceType,
  });

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
  late double waveHeight;
  List<Wave> waves = [];

  @override
  void initState() {
    super.initState();

    if (widget.deviceType == 'desktop') {
      waveHeight = 120;
    } else {
      waveHeight = 60;
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _controller.addListener(() {
      if (!mounted) return;
      setState(() {
        for (var wave in waves) {
          for (var node in wave.nodes) {
            double centerY = MediaQuery.of(context).size.height / 2;
            node[1] = waveHeight / 2 * sin(node[2] / 10) + centerY;
            node[2] += node[3];
          }
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (waves.isEmpty) {
      final screenWidth = MediaQuery.of(context).size.width;
      for (int i = 0; i < colors.length; i++) {
        waves.add(Wave(colors[i], nodes, screenWidth));
      }
    } else {
      final screenWidth = MediaQuery.of(context).size.width;
      for (var wave in waves) {
        for (int i = 0; i < wave.nodes.length; i++) {
          wave.nodes[i][0] = (i - 1) * screenWidth / nodes;
        }
      }
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
