import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApproachItemWidget extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final String reasonTitle;
  final String reason;
  final bool isMobile;

  const ApproachItemWidget({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.reasonTitle,
    required this.reason,
    this.isMobile = false,
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
              fontSize: isMobile ? 20.sp : 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              height: 1.4,
            ),
          ),
          SizedBox(height: isMobile ? 16.h : 16),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 16.sp : 16,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
          SizedBox(height: isMobile ? 20.h : 20),
          Text(
            reasonTitle,
            style: TextStyle(
              fontSize: isMobile ? 18.sp : 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[100],
              height: 1.4,
            ),
          ),
          SizedBox(height: isMobile ? 12.h : 12),
          Text(
            reason,
            style: TextStyle(
              fontSize: isMobile ? 16.sp : 16,
              color: Colors.grey[300],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
