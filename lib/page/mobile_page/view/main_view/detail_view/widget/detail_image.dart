import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final double width;
  const DetailImage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/Images/story_3.png'),
      ),
    );
  }
}
