import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_title.dart';

class MobileArchitecturePostList extends StatelessWidget {
  const MobileArchitecturePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MobileTechPostTitle(
          isUpload: true,
          number: 1,
          title: 'MVVM',
          tags: '#MVVM  #ViewModel  #Model',
          onTap: () => context.go('/tech-blog/post/mvvm'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 2,
          title: 'Clean Architecture',
          tags:
              '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
          onTap: () => context.go('/tech-blog/post/clean-architecture'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 3,
          title: 'Repository Pattern',
          tags: '#Repository  #Data Layer  #API',
          onTap: () => context.go('/tech-blog/post/repository-pattern'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 4,
          title: 'BLoC / Cubit',
          tags: '#BLoC  #Cubit  #State Management',
          onTap: () => context.go('/tech-blog/post/bloc-cubit'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 5,
          title: 'Provider (단점만 모아보기?)',
          tags: '#Provider  #State Management  #Context',
          onTap: () => context.go('/tech-blog/post/provider'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 6,
          title: 'Dependency Injection (GetIt + Injectable)',
          tags: '#GetIt  #Injectable  #DI',
          onTap: () => context.go('/tech-blog/post/dependency-injection'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 7,
          title: 'Freezed',
          tags: '#Freezed  #Immutable  #Code Generation',
          onTap: () => context.go('/tech-blog/post/freezed'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          isUpload: true,
          number: 8,
          title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
          tags: '#json_serializable  #json_annotation  #Serialization',
          onTap: () => context.go('/tech-blog/post/json-serializable'),
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 9,
          title: 'FutureBuilder',
          tags: '#FutureBuilder  #Async  #Future',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 7일',
        ),
        SizedBox(height: 30.h),
        MobileTechPostTitle(
          number: 10,
          title: 'Flutter 생명주기 정리',
          tags: '#Lifecycle  #StatefulWidget  #App Lifecycle',
          onTap: () => context.go('/schedule'),
          uploadDate: '7월 7일',
        ),
      ],
    );
  }
}
