import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

class DataStoragePostList extends StatelessWidget {
  const DataStoragePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBlogCubit, TechBlogState>(
      builder: (context, state) {
        final cubit = context.read<TechBlogCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechPostTitle(
              isUpload: true,
              number: 1,
              title: 'Isar 로컬 NoSQL DB',
              tags: '#Isar  #NoSQL  #Local Database',
              onTap: () => context.go('/tech-blog/post/isar'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              number: 2,
              title: '하이브 로컬 저장',
              tags: '#Hive  #Local Storage  #NoSQL',
              onTap: () => context.go('/schedule'),
              uploadDate: '7월 7일',
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 3,
              title: 'SharedPreferences\nFlutter Secure Storage 로컬 캐싱',
              tags: '#SharedPreferences  #SecureStorage  #Local Cache',
              onTap: () => context.go('/tech-blog/post/local-storage'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 4,
              title: 'MemoryCache\nDio Cache Interceptor - 메모리 및 네트워크 캐싱',
              tags: '#MemoryCache  #Dio  #Network Cache',
              onTap: () => context.go('/tech-blog/post/memory-cache'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              number: 5,
              title: 'dio 캐시 처리',
              tags: '#Dio  #Cache  #HTTP Cache  #Interceptor',
              onTap: () => context.go('/schedule'),
              uploadDate: '7월 10일',
            ),
          ],
        );
      },
    );
  }
}
