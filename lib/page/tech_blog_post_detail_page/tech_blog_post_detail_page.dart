import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TechBlogPostDetailPage extends StatelessWidget {
  final String postSlug;

  const TechBlogPostDetailPage({super.key, required this.postSlug});

  void _handleBackPress(BuildContext context) {
    context.go('/tech-blog');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _handleBackPress(context),
        ),
        title: Text(
          'Tech Blog',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: postSlug == 'mvvm',
              child: _buildPostContent(
                'MVVM',
                '#MVVM  #ViewModel  #Model',
                'MVVM 패턴에 대한 상세한 내용입니다...',
              ),
            ),

            Visibility(
              visible: postSlug == 'clean-architecture',
              child: _buildPostContent(
                'Clean Architecture',
                '#Clean Architecture  #Domain  #Presentation  #Repository pattern',
                'Clean Architecture에 대한 상세한 내용입니다...',
              ),
            ),

            Visibility(
              visible: postSlug == 'repository-pattern',
              child: _buildPostContent(
                'Repository Pattern',
                '#Repository  #Data Layer  #API',
                'Repository Pattern에 대한 상세한 내용입니다...',
              ),
            ),

            Visibility(
              visible: postSlug == 'bloc-cubit',
              child: _buildPostContent(
                'BLoC / Cubit',
                '#BLoC  #Cubit  #State Management',
                'BLoC / Cubit에 대한 상세한 내용입니다...',
              ),
            ),

            Visibility(
              visible: postSlug == 'provider',
              child: _buildPostContent(
                'Provider (보조 상태 관리로 사용)',
                '#Provider  #State Management  #Context',
                'Provider에 대한 상세한 내용입니다...',
              ),
            ),

            Visibility(
              visible: !_isValidSlug(postSlug),
              child: _buildPostContent(
                '포스트를 찾을 수 없습니다',
                '#Error',
                '요청하신 포스트를 찾을 수 없습니다.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidSlug(String slug) {
    final validSlugs = [
      'mvvm',
      'clean-architecture',
      'repository-pattern',
      'bloc-cubit',
      'provider',
      'dependency-injection',
      'freezed',
      'json-serializable',
      'isar',
      'local-storage',
      'memory-cache',
      'naver-login',
      'kakao-login',
      'navigation',
      'underline',
      'blur-background',
      'network-image',
      'kakao-map',
      'auto-scroll',
      'dialog',
      'random',
      'widget-size',
      'constraints',
      'server-connection',
      'lifecycle',
      'data-processing',
      'scroll',
      'future-builder',
      'bottom-sheet',
      'dropdown',
      'date-conversion',
      'hive',
      'dynamic-island',
      'icon-animation',
      'scroll-detection',
      'popup-menu',
      'cached-network-image',
      'dio-cache',
      'calendar',
      'naver-map',
      'bottom-navigation',
      'wave-animation',
      'gradient',
      'star-animation',
    ];
    return validSlugs.contains(slug);
  }

  Widget _buildPostContent(String title, String tags, String content) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            tags,
            style: GoogleFonts.montserrat(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          Container(height: 1, color: Colors.grey.shade800),
          const SizedBox(height: 32),
          Text(
            content,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
