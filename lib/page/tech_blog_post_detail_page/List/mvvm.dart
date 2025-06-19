import 'package:flutter/material.dart';

class Mvvm extends StatelessWidget {
  const Mvvm({super.key});

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
      'MVVM',
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
        _buildTag('#MVVM'),
        _buildTag('#ViewModel'),
        _buildTag('#Model'),
        _buildTag('#View'),
        _buildTag('#Data Binding'),
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
          'MVVM(Model-View-ViewModel)은 사용자 인터페이스 개발을 위한 아키텍처 패턴입니다.\n'
          'UI 로직과 비즈니스 로직을 분리하여 코드의 유지보수성과 테스트 용이성을 향상시킵니다.',
        ),
        const SizedBox(height: 32),

        // 구조
        _buildSectionTitle('MVVM 구조'),
        const SizedBox(height: 16),
        _buildContentBox(
          '• Model: 데이터와 비즈니스 로직을 담당\n'
          '• View: 사용자 인터페이스를 담당\n'
          '• ViewModel: View와 Model 사이의 중간 계층\n'
          '  - View의 상태를 관리\n'
          '  - Model의 데이터를 View에 맞게 변환\n'
          '  - 사용자 입력을 처리',
        ),
        const SizedBox(height: 32),

        // Flutter에서의 구현
        _buildSectionTitle('Flutter에서의 MVVM'),
        const SizedBox(height: 16),
        _buildContentBox(
          'Flutter에서는 다양한 상태 관리 도구를 통해 MVVM 패턴을 구현할 수 있습니다:\n'
          '• Provider + ChangeNotifier\n'
          '• BLoC / Cubit\n'
          '• Riverpod\n'
          '• GetX\n'
          '• Stacked Architecture',
        ),
        const SizedBox(height: 32),

        // 구현 예제
        _buildSectionTitle('구현 예제'),
        const SizedBox(height: 16),
        _buildCodeBox(
          '// TODO: MVVM 구현 예제 코드가 들어갈 예정\n'
          'class UserViewModel extends ChangeNotifier {\n'
          '  final UserRepository _repository;\n'
          '  List<User> _users = [];\n'
          '  \n'
          '  List<User> get users => _users;\n'
          '  \n'
          '  Future<void> loadUsers() async {\n'
          '    _users = await _repository.getUsers();\n'
          '    notifyListeners();\n'
          '  }\n'
          '}',
        ),
        const SizedBox(height: 32),

        // 장단점
        _buildSectionTitle('장단점'),
        const SizedBox(height: 16),
        _buildContentBox(
          '장점:\n'
          '• View와 비즈니스 로직의 명확한 분리\n'
          '• 단위 테스트 용이성\n'
          '• 재사용 가능한 ViewModel\n'
          '• 데이터 바인딩을 통한 자동 UI 업데이트\n\n'
          '단점:\n'
          '• 학습 곡선이 있음\n'
          '• 작은 프로젝트에서는 오버엔지니어링 가능성\n'
          '• ViewModel이 복잡해질 수 있음',
        ),
        const SizedBox(height: 32),

        // 주의사항
        _buildSectionTitle('주의사항'),
        const SizedBox(height: 16),
        _buildContentBox(
          '• ViewModel은 View에 대한 참조를 가져서는 안됨\n'
          '• Model과 View 사이의 의존성을 완전히 제거\n'
          '• ViewModel의 책임이 너무 커지지 않도록 주의\n'
          '• 적절한 상태 관리 도구 선택이 중요',
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
