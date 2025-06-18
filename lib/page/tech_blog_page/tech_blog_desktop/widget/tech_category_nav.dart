import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

class TechCategoryNav extends StatelessWidget {
  const TechCategoryNav({super.key});

  static const List<String> categories = [
    'All Posts',
    '아키텍처 & 상태 관리',
    '데이터 저장 & 캐싱',
    '네트워킹 & 외부 서비스',
    'UI 컴포넌트 & 애니메이션',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TechBlogCubit, TechBlogState>(
      builder: (context, state) {
        return SizedBox(
          height: 48,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < categories.length; i++) ...[
                TechCategoryText(
                  label: categories[i],
                  isSelected: state.selectedCategoryIndex == i,
                  onTap: () {
                    if (state.selectedCategoryIndex != i) {
                      context.read<TechBlogCubit>().selectCategory(i);
                    }
                  },
                ),
                if (i < categories.length - 1) const SizedBox(width: 16),
              ],
            ],
          ),
        );
      },
    );
  }
}

class TechCategoryText extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const TechCategoryText({
    super.key,
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<TechCategoryText> createState() => _TechCategoryTextState();
}

class _TechCategoryTextState extends State<TechCategoryText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: widget.isSelected ? 14 : 12,
              fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
              color:
                  widget.isSelected
                      ? Colors.white
                      : _isHovered
                      ? Colors.white.withValues(alpha: 0.9)
                      : Colors.grey.shade400,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
