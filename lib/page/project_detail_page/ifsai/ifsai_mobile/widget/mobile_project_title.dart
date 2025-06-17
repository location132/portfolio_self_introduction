import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileProjectTitle extends StatelessWidget {
  const MobileProjectTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 사용자 프로필 사진을 중앙에 배치
                  SizedBox(
                    width: 200.w,

                    child: Image.asset(
                      'assets/Images/ifSai.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100, left: 20.w, right: 20.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '지루하지 않게 저에 관해서 궁금한 것만 보여드리겠습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
