import 'package:flutter/material.dart';

class GsShopTitleSection extends StatelessWidget {
  const GsShopTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Gs Shop 분석 후 개선점 (검색창)',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
