import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'approach_image_widget.dart';
import 'wrong_approach_list_widget.dart';

class ProblemSolutionSection extends StatelessWidget {
  final bool isMobile;
  const ProblemSolutionSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문제의 원인을 분석했다면',
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
                  '이제 실력으로 해결해보겠습니다.',
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
        SizedBox(height: isMobile ? 100.h : 100),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: WrongApproachListWidget(isMobile: isMobile)),
            SizedBox(width: isMobile ? 40.w : 40),

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
