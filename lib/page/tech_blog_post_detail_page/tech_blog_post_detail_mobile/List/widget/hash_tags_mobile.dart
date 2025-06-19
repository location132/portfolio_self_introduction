import 'package:flutter/material.dart';

class HashTags extends StatelessWidget {
  final List<String> tags;

  const HashTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: tags.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String tag) {
    return Text(
      tag,
      style: const TextStyle(
        color: Color.fromARGB(255, 151, 205, 246),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
    );
  }
}
