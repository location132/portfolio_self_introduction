import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_title.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

class ArchitecturePostList extends StatelessWidget {
  const ArchitecturePostList({super.key});

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
              title: 'MVVM',
              tags: '#MVVM  #ViewModel  #Model',
              onTap: () => context.go('/tech-blog/post/mvvm'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 2,
              title: 'Clean Architecture',
              tags:
                  '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
              onTap: () => context.go('/tech-blog/post/clean-architecture'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 3,
              title: 'Repository Pattern',
              tags: '#Repository  #Data Layer  #API',
              onTap: () => context.go('/tech-blog/post/repository-pattern'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 4,
              title: 'BLoC / Cubit',
              tags: '#BLoC  #Cubit  #State Management',
              onTap: () => context.go('/tech-blog/post/bloc-cubit'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 5,
              title: 'Provider (단점만 모아보기?)',
              tags: '#Provider  #State Management  #Context',
              onTap: () => context.go('/tech-blog/post/provider'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 6,
              title: 'Dependency Injection (GetIt + Injectable)',
              tags: '#GetIt  #Injectable  #DI',
              onTap: () => context.go('/tech-blog/post/dependency-injection'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 7,
              title: 'Freezed',
              tags: '#Freezed  #Immutable  #Code Generation',
              onTap: () => context.go('/tech-blog/post/freezed'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              isUpload: true,
              number: 8,
              title: 'json_serializable\njson_annotation 자동 JSON 직렬화',
              tags: '#json_serializable  #json_annotation  #Serialization',
              onTap: () => context.go('/tech-blog/post/json-serializable'),
              onHover: (title) => cubit.onPostHover(title),
              onHoverExit: () => cubit.onPostHoverExit(),
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              number: 9,
              title: 'FutureBuilder',
              tags: '#FutureBuilder  #Async  #Future',
              onTap: () => context.go('/schedule'),
              uploadDate: '7월 7일',
            ),
            const SizedBox(height: 40),
            TechPostTitle(
              number: 10,
              title: 'Flutter 생명주기 정리',
              tags: '#Lifecycle  #StatefulWidget  #App Lifecycle',
              onTap: () => context.go('/schedule'),
              uploadDate: '7월 7일',
            ),
          ],
        );
      },
    );
  }
}
