import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_player.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_category_nav.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_blog_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_side_preview.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogDesktopView extends StatefulWidget {
  const TechBlogDesktopView({super.key});

  @override
  State<TechBlogDesktopView> createState() => _TechBlogDesktopViewState();
}

class _TechBlogDesktopViewState extends State<TechBlogDesktopView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<TechBlogCubit, TechBlogState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: TopNavBar(
                        deviceType: deviceType,
                        isMenuClicked: state.isMenuClicked,
                        onPressed: () {
                          context.read<TechBlogCubit>().toggleMenu();
                        },
                        onHomePressed: () {
                          context.go('/');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            Center(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 1200,
                                ),
                                child: Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: TechBlogHeader(),
                                    ),
                                    const SizedBox(height: 120),
                                    const TechCategoryNav(),
                                    Divider(
                                      height: 1,
                                      color: Colors.grey.shade800,
                                    ),
                                    const SizedBox(height: 40),

                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TechPostList(),
                                        SizedBox(width: 32),
                                        TechSidePreview(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TechPlayer(),
            ],
          ),
        );
      },
    );
  }
}
