import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidgetMobile extends StatelessWidget {
  const DividerWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 1.h,
      color: Colors.grey.shade200,
    );
  }
}
