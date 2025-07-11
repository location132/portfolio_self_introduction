import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/clean_architecture.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/dependency_injection_view.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/isar.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/local_storage.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/memory_cache.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/naver_login.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/kakao_login.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/mvvm.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/repository_pattern.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/bloc_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/provider.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/freezed.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_List/json_serializable.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';

class TechDetailPostSlug extends StatelessWidget {
  final Function(bool) isFocused;
  final String postSlug;
  final bool isBackgroundColor;
  final bool isMobile;

  const TechDetailPostSlug({
    super.key,
    required this.postSlug,
    required this.isFocused,
    required this.isBackgroundColor,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: isBackgroundColor ? Colors.white : Colors.black,
        child: _buildPostContent(),
      ),
    );
  }

  Widget _buildPostContent() {
    switch (postSlug) {
      case 'mvvm':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return Mvvm(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController,
            );
          },
        );

      case 'clean-architecture':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return CleanArchitecture(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController,
            );
          },
        );
      case 'repository-pattern':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return RepositoryPatternPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController,
            );
          },
        );
      case 'bloc-cubit':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return BlocCubitPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController,
            );
          },
        );
      case 'provider':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return ProviderPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController,
            );
          },
        );
      case 'dependency-injection':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return DependencyInjectionView(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'freezed':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return FreezedPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'json-serializable':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return JsonSerializablePage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'isar':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return Isar(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'local-storage':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return LocalStorage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'memory-cache':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return MemoryCache(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'naver-login':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return NaverLoginPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'kakao-login':
        return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
          builder: (context, state) {
            return KakaoLoginPage(
              isMobile: isMobile,
              isFocused: (isFocused) {
                this.isFocused(isFocused);
              },
              scrollController: state.scrollController ?? ScrollController(),
            );
          },
        );
      case 'navigation':
        return _buildPlaceholderPost('Navigation');
      case 'underline':
        return _buildPlaceholderPost('Underline');
      case 'blur-background':
        return _buildPlaceholderPost('Blur Background');
      case 'network-image':
        return _buildPlaceholderPost('Network Image');
      case 'kakao-map':
        return _buildPlaceholderPost('Kakao Map');
      case 'auto-scroll':
        return _buildPlaceholderPost('Auto Scroll');
      case 'dialog':
        return _buildPlaceholderPost('Dialog');
      case 'random':
        return _buildPlaceholderPost('Random');
      case 'widget-size':
        return _buildPlaceholderPost('Widget Size');
      case 'constraints':
        return _buildPlaceholderPost('Constraints');
      case 'server-connection':
        return _buildPlaceholderPost('Server Connection');
      case 'lifecycle':
        return _buildPlaceholderPost('Lifecycle');
      case 'data-processing':
        return _buildPlaceholderPost('Data Processing');
      case 'scroll':
        return _buildPlaceholderPost('Scroll');
      case 'future-builder':
        return _buildPlaceholderPost('Future Builder');
      case 'bottom-sheet':
        return _buildPlaceholderPost('Bottom Sheet');
      case 'dropdown':
        return _buildPlaceholderPost('Dropdown');
      case 'date-conversion':
        return _buildPlaceholderPost('Date Conversion');
      case 'hive':
        return _buildPlaceholderPost('Hive');
      case 'dynamic-island':
        return _buildPlaceholderPost('Dynamic Island');
      case 'icon-animation':
        return _buildPlaceholderPost('Icon Animation');
      case 'scroll-detection':
        return _buildPlaceholderPost('Scroll Detection');
      case 'popup-menu':
        return _buildPlaceholderPost('Popup Menu');
      case 'cached-network-image':
        return _buildPlaceholderPost('Cached Network Image');
      case 'dio-cache':
        return _buildPlaceholderPost('Dio Cache');
      case 'calendar':
        return _buildPlaceholderPost('Calendar');
      case 'naver-map':
        return _buildPlaceholderPost('Naver Map');
      case 'bottom-navigation':
        return _buildPlaceholderPost('Bottom Navigation');
      case 'wave-animation':
        return _buildPlaceholderPost('Wave Animation');
      case 'gradient':
        return _buildPlaceholderPost('Gradient');
      case 'star-animation':
        return _buildPlaceholderPost('Star Animation');
      default:
        return _buildNotFoundPost();
    }
  }

  Widget _buildPlaceholderPost(String title) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade700),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '이 포스트의 내용은 준비 중입니다.',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '// TODO: $title 관련 내용 작성 예정',
                    style: TextStyle(
                      color: Colors.green.shade300,
                      fontSize: 14,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFoundPost() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade900.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red.shade700),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '포스트를 찾을 수 없습니다',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '요청하신 포스트 "$postSlug"를 찾을 수 없습니다.',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
