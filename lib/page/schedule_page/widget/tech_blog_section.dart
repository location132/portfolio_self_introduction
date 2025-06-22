import 'package:flutter/material.dart';

class TechBlogSection extends StatelessWidget {
  const TechBlogSection({super.key});

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '기술블로그 업로드 일정',
          style: TextStyle(
            color: Colors.white,
            fontSize: _isMobile(context) ? 24 : 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        const TechBlogScheduleItem(
          date: '6월 25일 22:00',
          title: '블록 시리즈 (9~13번)',
        ),
        const TechBlogScheduleItem(
          date: '6월 28일',
          title: '클린 아키텍처 시리즈 (14~17번)',
        ),
        const TechBlogScheduleItem(date: '7월 2일', title: '의존성 주입 시리즈 (18~24번)'),
        const TechBlogScheduleItem(
          date: '7월 7일',
          title: 'Flutter Web 시리즈 (25~32번)',
        ),
        const TechBlogScheduleItem(
          date: '7월 10일',
          title: 'Rive 애니메이션 시리즈 (32~42번)',
        ),
      ],
    );
  }
}

class TechBlogScheduleItem extends StatelessWidget {
  final String date;
  final String title;

  const TechBlogScheduleItem({
    super.key,
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
