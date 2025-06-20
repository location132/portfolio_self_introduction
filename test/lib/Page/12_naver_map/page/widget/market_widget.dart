import 'package:flutter/material.dart';

class SingleMarkerIconWidget extends StatelessWidget {
  final String type;

  const SingleMarkerIconWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 27,
          height: 27,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xff6fbf8a),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIconData(type),
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getIconData(String type) {
    switch (type) {
      case '음식점':
        return Icons.restaurant;
      case 'BAR':
        return Icons.sports_bar_outlined;
      case '카페':
        return Icons.local_cafe;
      case '생활/문화':
        return Icons.self_improvement;
      case '쇼핑':
        return Icons.local_mall_outlined;
      case '여가':
        return Icons.golf_course_rounded;
      case '숙박':
        return Icons.bed_rounded;
      default:
        return Icons.error;
    }
  }
}
