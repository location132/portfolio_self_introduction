import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileTechCategoryNav extends StatelessWidget {
  const MobileTechCategoryNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MobileTechCategoryText(label: 'All Posts'),
          SizedBox(width: 40.w),
          const MobileTechCategoryText(label: 'Flutter'),
          SizedBox(width: 40.w),
          const MobileTechCategoryText(label: 'Dart'),
        ],
      ),
    );
  }
}

class MobileTechCategoryText extends StatefulWidget {
  final String label;

  const MobileTechCategoryText({super.key, required this.label});

  @override
  State<MobileTechCategoryText> createState() => _MobileTechCategoryTextState();
}

class _MobileTechCategoryTextState extends State<MobileTechCategoryText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
