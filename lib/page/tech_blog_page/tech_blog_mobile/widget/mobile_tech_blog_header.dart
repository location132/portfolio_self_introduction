import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileTechBlogHeader extends StatelessWidget {
  const MobileTechBlogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Text.rich(
            TextSpan(text: 'Flutter 개발 정리 노트'),
            style: GoogleFonts.montserrat(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Text.rich(
            TextSpan(
              text: '이 기술 블로그는 Flutter를 공부하고 있는 저와,\n',
              children: const [
                TextSpan(text: '백엔드 개발자로 취업한 여자친구가 함께 보는 개인 기록 공간입니다.'),
              ],
            ),
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade400,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Text.rich(
            TextSpan(
              text: '개발을 하며 자주 마주치는 구조나 반복되는 구현 방식을 정리하고,\n',
              children: const [
                TextSpan(text: '배운 내용을 다시 떠올릴 수 있도록 구성하려 노력하고 있습니다.'),
              ],
            ),
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade400,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: Text.rich(
            TextSpan(
              text:
                  '기억에만 의존하지 않고, 나만의 흐름대로 정리된 기술 내용을 통해 학습을 이어갈 수 있게 하는 것이 이 블로그의 목적입니다.\n',
              children: const [
                TextSpan(text: '시간이 지나도 다시 꺼내볼 수 있도록 실용적이고 단단한 기록을 남기려 합니다.'),
              ],
            ),
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade400,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
