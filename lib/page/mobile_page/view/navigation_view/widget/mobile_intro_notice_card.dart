import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mobileintronoticecard extends StatelessWidget {
  final Function() onTap;
  const Mobileintronoticecard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 234, 233, 233),
            padding: EdgeInsets.all(12.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '2025년 포트폴리오 모바일 버전에서는\n'
                  '최적화를 위해 데스크탑View보다 적은 애니메이션을 사용중입니다.\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11.0.sp),
                ),
                Text(
                  'Flutter 신입은 역시 Click!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
