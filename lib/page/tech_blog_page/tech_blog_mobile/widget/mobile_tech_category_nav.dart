import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';

class MobileTechCategoryNav extends StatelessWidget {
  const MobileTechCategoryNav({super.key});

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
          height: 140.h,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTechCategoryText(
                    label: categories[0],
                    isSelected: state.selectedCategoryIndex == 0,
                    onTap: () {
                      if (state.selectedCategoryIndex != 0) {
                        context.read<TechBlogCubit>().selectCategory(0);
                      }
                    },
                  ),
                  MobileTechCategoryText(
                    label: categories[1],
                    isSelected: state.selectedCategoryIndex == 1,
                    onTap: () {
                      if (state.selectedCategoryIndex != 1) {
                        context.read<TechBlogCubit>().selectCategory(1);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTechCategoryText(
                    label: categories[2],
                    isSelected: state.selectedCategoryIndex == 2,
                    onTap: () {
                      if (state.selectedCategoryIndex != 2) {
                        context.read<TechBlogCubit>().selectCategory(2);
                      }
                    },
                  ),
                  MobileTechCategoryText(
                    label: categories[3],
                    isSelected: state.selectedCategoryIndex == 3,
                    onTap: () {
                      if (state.selectedCategoryIndex != 3) {
                        context.read<TechBlogCubit>().selectCategory(3);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTechCategoryText(
                    label: categories[4],
                    isSelected: state.selectedCategoryIndex == 4,
                    onTap: () {
                      if (state.selectedCategoryIndex != 4) {
                        context.read<TechBlogCubit>().selectCategory(4);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class MobileTechCategoryText extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const MobileTechCategoryText({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<MobileTechCategoryText> createState() => _MobileTechCategoryTextState();
}

class _MobileTechCategoryTextState extends State<MobileTechCategoryText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: widget.isSelected ? 13.sp : 11.sp,
            fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
            color: widget.isSelected ? Colors.white : Colors.grey.shade400,
          ),
          child: Text(widget.label, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
