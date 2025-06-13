import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';

class LibrarySection extends StatefulWidget {
  final IfsaiState state;
  const LibrarySection({super.key, required this.state});

  @override
  State<LibrarySection> createState() => _LibrarySectionState();
}

class _LibrarySectionState extends State<LibrarySection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '함께하면 더 완벽한 라이브러리',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '잎사이를 완성시켜준 라이브러리들을 소개합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
