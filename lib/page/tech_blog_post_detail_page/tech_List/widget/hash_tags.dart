import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HashTags extends StatelessWidget {
  final List<String> tags;
  final bool isMobile;

  const HashTags({super.key, required this.tags, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: tags.map((tag) => _buildTag(tag)).toList(),
    );
  }

  Widget _buildTag(String tag) {
    return Text(
      tag,
      style: TextStyle(
        color: Color.fromARGB(255, 151, 205, 246),
        fontSize: isMobile ? 15.sp : 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
    );
  }
}
