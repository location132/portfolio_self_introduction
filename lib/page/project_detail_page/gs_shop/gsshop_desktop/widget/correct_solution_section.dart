import 'package:flutter/material.dart';
import 'solution_content_widget.dart';

class CorrectSolutionSection extends StatelessWidget {
  const CorrectSolutionSection({super.key});

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
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.grey[100],
                height: 1.3,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  '올바른 접근 방법',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(width: double.infinity, height: 2, color: Colors.grey[600]),

        const Divider(height: 1, color: Colors.transparent),

        const SizedBox(height: 100),

        const SolutionContentWidget(),
      ],
    );
  }
}
