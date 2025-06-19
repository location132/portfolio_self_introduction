import 'package:flutter/material.dart';

class StoryBlock extends StatelessWidget {
  final String story;
  const StoryBlock({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        story,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
