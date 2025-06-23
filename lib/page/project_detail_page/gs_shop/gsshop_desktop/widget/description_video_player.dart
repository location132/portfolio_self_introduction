import 'package:flutter/material.dart';

class DescriptionVideoPlayer extends StatelessWidget {
  final String title;
  final String description;
  const DescriptionVideoPlayer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 435,
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              height: 1.3,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            description,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
