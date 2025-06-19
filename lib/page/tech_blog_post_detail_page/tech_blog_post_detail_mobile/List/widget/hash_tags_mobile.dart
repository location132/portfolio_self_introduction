import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HashTagsMobile extends StatelessWidget {
  final List<String> tags;

  const HashTagsMobile({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 8.h,
      children: tags.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String tag) {
    return Text(
      tag,
      style: TextStyle(
        color: const Color.fromARGB(255, 151, 205, 246),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2.sp,
      ),
    );
  }
}
