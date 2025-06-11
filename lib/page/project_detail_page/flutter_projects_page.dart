import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/project_view/widget/containers/flutter_projects_container.dart';

class FlutterProjectsPage extends StatelessWidget {
  const FlutterProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/'),
        ),
        title: const Text(
          'Flutter 프로젝트',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.grey.shade900, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter 개발 프로젝트',
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Flutter를 활용하여 개발한 모바일 및 웹 애플리케이션 프로젝트들입니다.\n다양한 기능과 사용자 경험을 제공하는 프로젝트들을 확인해보세요.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 60),
              const FlutterProjectsContainer(isVisible: true),
            ],
          ),
        ),
      ),
    );
  }
}
