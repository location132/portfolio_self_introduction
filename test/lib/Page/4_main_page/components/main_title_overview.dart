/*
메인화면의 타이틀과 전체보기 버튼을 포함한 위젯입니다.
*/

import 'package:flutter/material.dart';

class MainTitleOverview extends StatelessWidget {
  final String title;
  final bool? isShowMore;
  final Function()? onTap;
  const MainTitleOverview(
      {super.key, required this.title, this.isShowMore = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.041,
          right: screenWidth * 0.041,
          bottom: screenWidth * 0.004),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff111111),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          if (isShowMore == true) ...[
            GestureDetector(
              onTap: onTap,
              child: const Text(
                '전체보기',
                style: TextStyle(
                  color: Color(0xff8e8e8e),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
              height: 16,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff8e8e8e),
                size: 17,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
