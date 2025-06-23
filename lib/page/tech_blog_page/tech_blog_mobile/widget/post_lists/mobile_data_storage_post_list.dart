import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_title.dart';

class MobileDataStoragePostList extends StatelessWidget {
  const MobileDataStoragePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MobileTechPostTitle(
          isUpload: true,
          number: 1,
          title: 'Isar 로컬 NoSQL DB',
          tags: '#Isar  #NoSQL  #Local Database',
          onTap: () => context.go('/tech-blog/post/isar'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 2,
          title: '하이브 로컬 저장',
          tags: '#Hive  #Local Storage  #NoSQL',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 7일',
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 3,
          title: 'SharedPreferences\nFlutter Secure Storage 로컬 캐싱',
          tags: '#SharedPreferences  #SecureStorage  #Local Cache',
          onTap: () => context.go('/schedule'),
          uploadDate: '6월 25일',
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 4,
          title: 'MemoryCache\nDio Cache Interceptor - 메모리 및 네트워크 캐싱',
          tags: '#MemoryCache  #Dio  #Network Cache',
          onTap: () => context.go('/schedule'),
          uploadDate: '6월 25일',
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 5,
          title: 'dio 캐시 처리',
          tags: '#Dio  #Cache  #HTTP Cache  #Interceptor',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 10일',
        ),
      ],
    );
  }
}
