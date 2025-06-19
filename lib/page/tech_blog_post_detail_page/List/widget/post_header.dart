import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/List/widget/hash_tags.dart';

class PostHeader extends StatelessWidget {
  final String title;
  final List<String> tags;
  final String content;
  final bool isBackgroundColor;

  const PostHeader({
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
            fontSize: 48,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 80),
        Text(
          '시작하기 전에',
          style: TextStyle(
            color: isBackgroundColor ? Colors.black : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade800, width: 1),
          ),
          child: Text(
            content,
            style: TextStyle(
              color: isBackgroundColor ? Colors.grey.shade300 : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 48),

        Center(child: HashTags(tags: tags)),
        const SizedBox(height: 28),

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
        const SizedBox(height: 48),
      ],
    );
  }
}
