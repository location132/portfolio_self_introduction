import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/List/widget/hash_tags_mobile.dart';

class PostHeaderMobile extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String content;
  final bool isBackgroundColor;

  const PostHeaderMobile({
    super.key,
    required this.title,
    required this.tags,
    required this.content,
    required this.isBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isBackgroundColor ? Colors.black : Colors.white,
            fontSize: 48.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.0.sp,
          ),
        ),
        SizedBox(height: 80.h),
        Text(
          '시작하기 전에',
          style: TextStyle(
            color: isBackgroundColor ? Colors.black : Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey.shade800, width: 1.w),
          ),
          child: Text(
            content,
            style: TextStyle(
              color: isBackgroundColor ? Colors.grey.shade300 : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.7,
            ),
          ),
        ),
        SizedBox(height: 48.h),

        Center(child: HashTagsMobile(tags: tags)),
        SizedBox(height: 28.h),

        Container(
          height: 2.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade800,
                Colors.grey.shade700,
                Colors.grey.shade800,
              ],
            ),
          ),
        ),
        SizedBox(height: 48.h),
      ],
    );
  }
}
