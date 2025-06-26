import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/search_result_item.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/quick_action_item.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/divider_widget.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/no_results_message.dart';

class TechDetailPlayer extends StatefulWidget {
  final bool isPlayerClicked;
  final bool showOptions;
  final String searchQuery;
  final Function(bool) isFocused;
  final VoidCallback? onFocusLost;

  const TechDetailPlayer({
    super.key,
    required this.isPlayerClicked,
    required this.showOptions,
    required this.searchQuery,
    required this.isFocused,
    this.onFocusLost,
  });

  @override
  State<TechDetailPlayer> createState() => _TechDetailPlayerState();
}

class _TechDetailPlayerState extends State<TechDetailPlayer> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TechDetailPlayer oldWidget) {
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
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 검색창
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: widget.isPlayerClicked ? 570 : 330,
              height: widget.isPlayerClicked ? 56 : 48,
              decoration: BoxDecoration(
                color:
                    widget.isPlayerClicked
                        ? Colors.white
                        : Colors.grey.shade800.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade700),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                readOnly: true,
                style: GoogleFonts.montserrat(
                  color: widget.isPlayerClicked ? Colors.black : Colors.white,
                  fontSize: widget.isPlayerClicked ? 16 : 14,
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
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: widget.isPlayerClicked ? 30 : 24,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 48,
                    minHeight: 48,
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color:
                        !widget.isPlayerClicked
                            ? Colors.white
                            : Colors.grey.shade600,
                    fontSize: widget.isPlayerClicked ? 16 : 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: widget.isPlayerClicked ? 18 : 12,
                  ),
                ),
              ),
            ),

            if (showSearchMode) ...[
              const SizedBox(height: 16),
              Container(
                width: 570,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child:
                    hasSearchResults
                        ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: filteredPosts.length,
                          separatorBuilder:
                              (context, index) => const DividerWidget(),
                          itemBuilder: (context, index) {
                            final post = filteredPosts[index];
                            return SearchResultItem(
                              title: post['title']!,
                              tags: post['tags']!,
                              onTap: () {
                                // TODO: 해당 포스트로 이동 이거는 기술 블로그 다 만들면 하자.
                              },
                            );
                          },
                        )
                        : const NoResultsMessage(),
              ),
            ] else if (widget.showOptions) ...[
              const SizedBox(height: 16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                width: 570,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QuickActionItem(
                      icon: Icons.arrow_back,
                      title: '이전 페이지로',
                      subtitle: '기술 블로그 목록으로 돌아가기',
                      onTap: () {
                        print('check ==>13');
                        context.go('/tech-blog');
                      },
                    ),
                    const DividerWidget(),
                    QuickActionItem(
                      icon: Icons.code,
                      title: '실전 구조 살펴보기',
                      subtitle: '개념을 건너뛰고 핵심만 살펴볼 수 있어요',
                      onTap:
                          () => context
                              .read<TechBlogPostDetailCubit>()
                              .handleQuickAction('code'),
                    ),
                    const DividerWidget(),
                    QuickActionItem(
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
