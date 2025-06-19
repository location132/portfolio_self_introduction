import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';

class DataStoragePostList extends StatelessWidget {
  const DataStoragePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechPostTitle(
          number: 1,
          title: 'Isar 로컬 NoSQL DB',
          tags: '#Isar  #NoSQL  #Local Database',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 2,
          title: 'Hive 로컬 저장',
          tags: '#Hive  #Local Storage  #NoSQL',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 3,
          title: 'SharedPreferences\nFlutter Secure Storage 로컬 캐싱',
          tags: '#SharedPreferences  #SecureStorage  #Local Cache',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 4,
          title: 'MemoryCache\nDio Cache Interceptor - 메모리 및 네트워크 캐싱',
          tags: '#MemoryCache  #Dio  #Network Cache',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 5,
          title: 'dio 캐시 처리',
          tags: '#Dio  #Cache  #HTTP Cache  #Interceptor',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
      ],
    );
  }
}
