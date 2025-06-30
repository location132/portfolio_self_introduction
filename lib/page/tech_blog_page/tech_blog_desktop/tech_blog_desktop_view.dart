import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/category/desktop_category_nav.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_blog_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_desktop/widget/tech_side_preview.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogDesktopView extends StatelessWidget {
  const TechBlogDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<TechBlogCubit, TechBlogState>(
      builder: (context, state) {
        final cubit = context.read<TechBlogCubit>();
        cubit.onWidgetUpdate(MediaQuery.of(context).size.width);
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
                          cubit.toggleMenu();
                        },
                        onHomePressed: () {
                          context.push('/');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: SingleChildScrollView(
                        controller: cubit.scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      state.isTabletMode
                                          ? double.infinity
                                          : 1200,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: state.isTabletMode ? 20.0 : 0.0,
                                  ),
                                  child: Column(
                                    children: [
                                      state.isTabletMode
                                          ? Center(
                                            child: const TechBlogHeader(),
                                          )
                                          : const Align(
                                            alignment: Alignment.centerLeft,
                                            child: TechBlogHeader(),
                                          ),
                                      const SizedBox(height: 120),
                                      const DesktopCategoryNav(),
                                      Divider(
                                        key: cubit.dividerKey,
                                        height: 1,
                                        color: Colors.grey.shade800,
                                      ),
                                      const SizedBox(height: 40),
                                      if (state.isTabletMode)
                                        TechPostList(state: state)
                                      else
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TechPostList(state: state),
                                            const SizedBox(width: 32),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  AnimatedContainer(
                                                    duration: const Duration(
                                                      milliseconds: 100,
                                                    ),
                                                    height:
                                                        state
                                                            .sidePreviewTopSpace,
                                                  ),
                                                  TechSidePreview(
                                                    sidePreviewOpacity:
                                                        state
                                                            .sidePreviewOpacity,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
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

              // Positioned.fill(
              //   child:
              //       state.isScreenFilter
              //           ? Container(color: Colors.black.withValues(alpha: 0.8))
              //           : const SizedBox.shrink(),
              // ),
              // TechPlayer(
              //   isFocused: (isFocused) {
              //     cubit.toggleSearchExpansion(isFocused);
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
