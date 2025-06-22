import 'package:flutter/material.dart';

class FlutterWebDesktopItem extends StatefulWidget {
  const FlutterWebDesktopItem({super.key});

  @override
  State<FlutterWebDesktopItem> createState() => _FlutterWebDesktopItemState();
}

class _FlutterWebDesktopItemState extends State<FlutterWebDesktopItem> {
  bool _isHovered = false;

  String _getImagePath(bool isHovered) {
    return isHovered
        ? 'assets/Images/project_img/web_project_2.png'
        : 'assets/Images/project_img/web_project_1.png';
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '10월 20일',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Text(
                  'Flutter Web',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Transform.translate(
            offset: const Offset(0, -10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 1030 / 580,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedOpacity(
                        opacity: _isHovered ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          _getImagePath(false),
                          key: const ValueKey('flutter_web_default'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isHovered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          _getImagePath(true),
                          key: const ValueKey('flutter_web_hover'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '모바일과 웹 두 플랫폼을 하나의 코드로 구현하는 크로스 플랫폼의 매력.\n포트폴리오를 통해 Flutter Web의 성능과 가능성을 보여드리겠습니다.',
            style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
          ),
        ],
      ),
    );
  }
}
