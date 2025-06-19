import 'package:flutter/material.dart';

class CleanArchitecture extends StatelessWidget {
  const CleanArchitecture({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 섹션
          _buildTitleSection(),
          const SizedBox(height: 32),

          // 태그 섹션
          _buildTagSection(),
          const SizedBox(height: 48),

          // 구분선
          Container(height: 2, color: Colors.grey.shade800),
          const SizedBox(height: 48),

          // 내용 섹션
          _buildContentSection(),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Text(
      'Clean Architecture',
      style: TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildTagSection() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTag('#Clean Architecture'),
        _buildTag('#Domain'),
        _buildTag('#Presentation'),
        _buildTag('#Repository pattern'),
      ],
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade600),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: Colors.grey.shade300,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 개요
        _buildSectionTitle('개요'),
        const SizedBox(height: 16),
        _buildContentBox(
          '이곳에 Clean Architecture의 개요가 들어갑니다.\n'
          '아키텍처의 기본 개념과 목적을 설명합니다.',
        ),
        const SizedBox(height: 32),

        // 구조
        _buildSectionTitle('Clean Architecture 구조'),
        const SizedBox(height: 16),
        _buildContentBox(
          '여기에 Clean Architecture의 레이어 구조를 설명합니다.\n'
          '- Presentation Layer\n'
          '- Domain Layer\n'
          '- Data Layer',
        ),
        const SizedBox(height: 32),

        // 구현 예제
        _buildSectionTitle('구현 예제'),
        const SizedBox(height: 16),
        _buildCodeBox(
          '// TODO: 실제 구현 코드 예제가 들어갈 예정\n'
          'class UserRepository {\n'
          '  // 구현 내용\n'
          '}',
        ),
        const SizedBox(height: 32),

        // 장단점
        _buildSectionTitle('장단점'),
        const SizedBox(height: 16),
        _buildContentBox(
          '장점:\n'
          '- 의존성 방향이 명확함\n'
          '- 테스트 용이성\n'
          '- 유지보수성 향상\n\n'
          '단점:\n'
          '- 초기 설정 복잡도\n'
          '- 보일러플레이트 코드 증가',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildContentBox(String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildCodeBox(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade600),
      ),
      child: Text(
        code,
        style: TextStyle(
          color: Colors.green.shade300,
          fontSize: 14,
          fontFamily: 'monospace',
          height: 1.4,
        ),
      ),
    );
  }
}
