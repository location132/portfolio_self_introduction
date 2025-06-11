import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndividualProjectPage extends StatelessWidget {
  final String projectId;

  const IndividualProjectPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        title: Text(
          _getProjectTitle(projectId),
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/projects'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 100,
              color: Colors.white.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 20),
            Text(
              _getProjectTitle(projectId),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '프로젝트 상세 페이지 준비중입니다.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.go('/projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1a1a1a),
              ),
              child: const Text('프로젝트 목록으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }

  String _getProjectTitle(String projectId) {
    switch (projectId) {
      case 'ifsai':
        return 'IFSAI';
      case 'navermap':
        return 'NaverMap';
      case 'klang':
        return 'Klang';
      case 'groom':
        return 'Groom';
      case 'web-portfolio':
        return 'Web Portfolio';
      case 'gsshop':
        return 'GS Shop';
      case 'idus':
        return 'IDUS';
      case 'about-me':
        return 'About Me';
      case 'myskill':
        return 'My Skill';
      case 'detail-me':
        return 'Detail Me';
      default:
        return '프로젝트';
    }
  }
}
