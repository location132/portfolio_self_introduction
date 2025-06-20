import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';

class ArchitecturePostList extends StatelessWidget {
  const ArchitecturePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechPostTitle(
          number: 1,
          title: 'MVVM',
          tags: '#MVVM  #ViewModel  #Model',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 2,
          title: 'Clean Architecture',
          tags:
              '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 3,
          title: 'Repository Pattern',
          tags: '#Repository  #Data Layer  #API',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 4,
          title: 'BLoC / Cubit',
          tags: '#BLoC  #Cubit  #State Management',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 5,
          title: 'Provider (단점만 모아보기?)',
          tags: '#Provider  #State Management  #Context',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 6,
          title: 'Dependency Injection (GetIt + Injectable)',
          tags: '#GetIt  #Injectable  #DI',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 7,
          title: 'Freezed',
          tags: '#Freezed  #Immutable  #Code Generation',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 8,
          title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
          tags: '#json_serializable  #json_annotation  #Serialization',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 9,
          title: 'FutureBuilder',
          tags: '#FutureBuilder  #Async  #Future',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
        const SizedBox(height: 40),
        TechPostTitle(
          number: 10,
          title: 'Flutter 생명주기 정리',
          tags: '#Lifecycle  #StatefulWidget  #App Lifecycle',
          onTap: () => context.push('/tech-blog/post/clean-architecture'),
        ),
      ],
    );
  }
}
