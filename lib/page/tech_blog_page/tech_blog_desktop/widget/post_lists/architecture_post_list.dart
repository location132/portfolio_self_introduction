import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';

class ArchitecturePostList extends StatelessWidget {
  const ArchitecturePostList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechPostTitle(
          number: 1,
          title: 'MVVM',
          tags: '#MVVM  #ViewModel  #Model',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 2,
          title: 'Clean Architecture',
          tags:
              '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 3,
          title: 'Repository Pattern',
          tags: '#Repository  #Data Layer  #API',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 4,
          title: 'BLoC / Cubit',
          tags: '#BLoC  #Cubit  #State Management',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 5,
          title: 'Provider (보조 상태 관리로 사용)',
          tags: '#Provider  #State Management  #Context',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 6,
          title: 'Dependency Injection (GetIt + Injectable)',
          tags: '#GetIt  #Injectable  #DI',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 7,
          title: 'Freezed',
          tags: '#Freezed  #Immutable  #Code Generation',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 8,
          title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
          tags: '#json_serializable  #json_annotation  #Serialization',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 9,
          title: 'FutureBuilder',
          tags: '#FutureBuilder  #Async  #Future',
        ),
        SizedBox(height: 40),
        TechPostTitle(
          number: 10,
          title: 'Flutter 생명주기 정리',
          tags: '#Lifecycle  #StatefulWidget  #App Lifecycle',
        ),
      ],
    );
  }
}
