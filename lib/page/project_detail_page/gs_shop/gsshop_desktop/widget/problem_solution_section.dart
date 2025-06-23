import 'package:flutter/material.dart';
import 'approach_image_widget.dart';
import 'wrong_approach_list_widget.dart';

class ProblemSolutionSection extends StatelessWidget {
  const ProblemSolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문제의 원인을 분석했다면',
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
                  '이제 실력으로 해결해보겠습니다.',
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
        const SizedBox(height: 100),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: WrongApproachListWidget()),
            SizedBox(width: 40),

            Visibility(
              visible: MediaQuery.of(context).size.width > 800,
              child: ApproachImageWidget(
                imagePath: 'assets/Images/gs_img/search_gs.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
