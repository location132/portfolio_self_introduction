import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GsShopTitleSection extends StatelessWidget {
  final bool isMobile;
  const GsShopTitleSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      isMobile ? 'Gs Shop 분석 후 개선하기' : 'Gs Shop 분석 후 개선하기 (검색창)',
      style: TextStyle(
        fontSize: isMobile ? 42.sp : 42,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
