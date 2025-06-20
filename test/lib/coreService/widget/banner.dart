import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final double height;
  final String imagePath;

  const BannerWidget({
    super.key,
    required this.height,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
