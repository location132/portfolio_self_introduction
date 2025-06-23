import 'package:flutter/material.dart';

class ApproachImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const ApproachImageWidget({
    super.key,
    required this.imagePath,
    this.width = 319,
    this.height = 1095,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[600]!, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
