import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/category/mobile_category_text.dart';

class MobileCategoryNav extends StatelessWidget {
  const MobileCategoryNav({super.key});

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
          height: 60.h,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16.w),
                for (int i = 0; i < categories.length; i++) ...[
                  MobileCategoryText(
                    label: categories[i],
                    isSelected: state.selectedCategoryIndex == i,
                    onTap: () {
                      context.read<TechBlogCubit>().selectCategory(i);
                    },
                  ),
                  if (i < categories.length - 1) SizedBox(width: 12.w),
                ],
                SizedBox(width: 16.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
