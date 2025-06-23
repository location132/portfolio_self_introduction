import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'solution_content_widget.dart';

class CorrectSolutionSection extends StatelessWidget {
  final bool isMobile;
  const CorrectSolutionSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문제를 해결한',
              style: TextStyle(
                fontSize: isMobile ? 28.sp : 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey[100],
                height: 1.3,
              ),
            ),
            Row(
              children: [
                SizedBox(width: isMobile ? 30.w : 30),
                Text(
                  '올바른 접근 방법',
                  style: TextStyle(
                    fontSize: isMobile ? 28.sp : 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: isMobile ? 20.h : 20),
        Container(width: double.infinity, height: 2, color: Colors.grey[600]),

        Divider(height: 1, color: Colors.transparent),

        SizedBox(height: isMobile ? 100.h : 100),

        SolutionContentWidget(isMobile: isMobile),
      ],
    );
  }
}
