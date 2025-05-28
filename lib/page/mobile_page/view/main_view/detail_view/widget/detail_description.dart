import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '기초 위에 실전을 더했고\n'
                '실전 위에 퍼포먼스를 쌓았습니다',

                style: TextStyle(fontSize: 14.sp, color: Colors.black87),
              ),
              const SizedBox(height: 3),
              Text(
                '이제 저만의 개발 스타일을 소개하겠습니다.',

                style: TextStyle(
                  fontSize: 14.sp,
                  height: 1.6,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
