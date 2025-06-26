import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/widget/search_result_item_mobile.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/widget/quick_action_item_mobile.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/widget/divider_widget_mobile.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/widget/no_results_message_mobile.dart';

class TechDetailPlayerMobile extends StatefulWidget {
  final bool isPlayerClicked;
  final bool showOptions;
  final String searchQuery;
  final Function(bool) isFocused;
  final VoidCallback? onFocusLost;

  const TechDetailPlayerMobile({
    super.key,
    required this.isPlayerClicked,
    required this.showOptions,
    required this.searchQuery,
    required this.isFocused,
    this.onFocusLost,
  });

  @override
  State<TechDetailPlayerMobile> createState() => _TechDetailPlayerMobileState();
}

class _TechDetailPlayerMobileState extends State<TechDetailPlayerMobile> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TechDetailPlayerMobile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.searchQuery != widget.searchQuery &&
        _searchController.text != widget.searchQuery) {
      final selection = _searchController.selection;
      _searchController.text = widget.searchQuery;
      if (selection.isValid && selection.end <= widget.searchQuery.length) {
        _searchController.selection = selection;
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> _getFilteredPosts() {
    if (widget.searchQuery.isEmpty) return [];

    return TechBlogPostConstants.techPosts.where((post) {
      return post['title']!.toLowerCase().contains(
            widget.searchQuery.toLowerCase(),
          ) ||
          post['tags']!.toLowerCase().contains(
            widget.searchQuery.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = _getFilteredPosts();
    final showSearchMode = widget.searchQuery.isNotEmpty;
    final hasSearchResults = filteredPosts.isNotEmpty;

    return AnimatedAlign(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      alignment:
          widget.isPlayerClicked ? Alignment.center : Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 검색창
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: widget.isPlayerClicked ? 380.w : 280.w,
              height: widget.isPlayerClicked ? 56.h : 48.h,
              decoration: BoxDecoration(
                color:
                    widget.isPlayerClicked
                        ? Colors.white
                        : Colors.grey.shade800.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Colors.grey.shade700),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: TextField(
                readOnly: true,
                style: GoogleFonts.montserrat(
                  color: widget.isPlayerClicked ? Colors.black : Colors.white,
                  fontSize: widget.isPlayerClicked ? 16.sp : 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                cursorColor:
                    widget.isPlayerClicked ? Colors.black : Colors.white,
                controller: _searchController,
                textAlignVertical: TextAlignVertical.center,
                onTap: () {
                  if (!widget.isPlayerClicked) {
                    widget.isFocused(true);
                  }
                },
                onChanged: (value) {
                  context.read<TechBlogPostDetailCubit>().updateSearchQuery(
                    value,
                  );
                },
                decoration: InputDecoration(
                  hintText:
                      widget.isPlayerClicked
                          ? '아래의 메뉴를 선택해주세요'
                          : '궁금한 것이 있다면 클릭해주세요',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 8.w),
                    child: Icon(Icons.search, color: Colors.grey.shade600),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 48.w,
                    minHeight: 48.h,
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color:
                        !widget.isPlayerClicked
                            ? Colors.white
                            : Colors.grey.shade600,
                    fontSize: widget.isPlayerClicked ? 14.sp : 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: widget.isPlayerClicked ? 18.h : 12.h,
                  ),
                ),
              ),
            ),

            if (showSearchMode) ...[
              SizedBox(height: 16.h),
              Container(
                width: 380.w,
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child:
                    hasSearchResults
                        ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: filteredPosts.length,
                          separatorBuilder:
                              (context, index) => const DividerWidgetMobile(),
                          itemBuilder: (context, index) {
                            final post = filteredPosts[index];
                            return SearchResultItemMobile(
                              title: post['title']!,
                              tags: post['tags']!,
                              onTap: () {
                                // TODO: 해당 포스트로 이동 이거는 기술 블로그 다 만들면 하자.
                              },
                            );
                          },
                        )
                        : const NoResultsMessageMobile(),
              ),
            ] else if (widget.showOptions) ...[
              SizedBox(height: 16.h),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: 380.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuickActionItemMobile(
                      icon: Icons.arrow_back,
                      title: '이전 페이지로',
                      subtitle: '기술 블로그 목록으로 돌아가기',
                      onTap: () {
                        context.go('/tech-blog');
                      },
                    ),
                    const DividerWidgetMobile(),
                    QuickActionItemMobile(
                      icon: Icons.code,
                      title: '실전 구조 살펴보기',
                      subtitle: '개념을 건너뛰고 핵심만 살펴볼 수 있어요',
                      onTap:
                          () => context
                              .read<TechBlogPostDetailCubit>()
                              .handleQuickAction('code'),
                    ),
                    const DividerWidgetMobile(),
                    QuickActionItemMobile(
                      icon: Icons.flash_on,
                      title: '색상 반전',
                      subtitle: '배경색을 변경해 더 편한게 볼 수 있어요',
                      onTap:
                          () => context
                              .read<TechBlogPostDetailCubit>()
                              .handleQuickAction('filter'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
