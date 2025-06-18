import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/category/desktop_category_text.dart';

class DesktopCategoryNav extends StatelessWidget {
  const DesktopCategoryNav({super.key});

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
                DesktopCategoryText(
                  label: categories[i],
                  isSelected: state.selectedCategoryIndex == i,
                  onTap: () {
                    context.read<TechBlogCubit>().selectCategory(i);
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
