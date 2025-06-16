import 'package:flutter/material.dart';

class ProjectRowCard extends StatelessWidget {
  final List<String> items;
  final String title;
  const ProjectRowCard({super.key, required this.items, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Text(
                '• ${items[index]}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.4,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
