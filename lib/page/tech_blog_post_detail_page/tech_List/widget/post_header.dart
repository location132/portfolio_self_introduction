import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/widget/hash_tags.dart';

class PostHeader extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String content;
  final bool isBackgroundColor;
  final bool isMobile;

  const PostHeader({
    super.key,
    required this.title,
    required this.tags,
    required this.content,
    required this.isBackgroundColor,
    required this.isMobile,
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
            fontSize: isMobile ? 48.sp : 48,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.0,
          ),
        ),
        SizedBox(height: isMobile ? 80.h : 80),
        Text(
          '시작하기 전에',
          style: TextStyle(
            color: isBackgroundColor ? Colors.black : Colors.white,
            fontSize: isMobile ? 16.sp : 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: isMobile ? 16.h : 16),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 24.w : 24),
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade800, width: 1),
          ),
          child: Text(
            content,
            style: TextStyle(
              color: isBackgroundColor ? Colors.grey.shade300 : Colors.white,
              fontSize: isMobile ? 16.sp : 16,
              fontWeight: FontWeight.w400,
              height: 1.7,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 48.h : 48),

        Center(child: HashTags(tags: tags, isMobile: isMobile)),
        SizedBox(height: isMobile ? 28.h : 28),

        Container(
          height: 2,
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
        SizedBox(height: isMobile ? 48.h : 48),
      ],
    );
  }
}
