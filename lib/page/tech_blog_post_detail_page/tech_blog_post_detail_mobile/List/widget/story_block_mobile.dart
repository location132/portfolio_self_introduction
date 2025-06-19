import 'package:flutter/material.dart';

class StoryBlockMobile extends StatelessWidget {
  final String story;
  final bool isBackgroundColor;
  const StoryBlockMobile({
    super.key,
    required this.story,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        story,
        style: TextStyle(
          color: isBackgroundColor ? Colors.black : Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
