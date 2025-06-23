import 'package:flutter/material.dart';

class ApproachItemWidget extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final String reasonTitle;
  final String reason;

  const ApproachItemWidget({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.reasonTitle,
    required this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            reasonTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[100],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            reason,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
