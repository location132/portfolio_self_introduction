import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/tech_detail_player.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_detail_post_slug.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogPostDetailDesktopView extends StatelessWidget {
  final String postSlug;

  const TechBlogPostDetailDesktopView({super.key, required this.postSlug});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isBackgroundColorWhite ? Colors.white : Colors.black,
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
                          context.read<TechBlogPostDetailCubit>().toggleMenu();
                        },
                        onHomePressed: () {
                          context.push('/');
                        },
                      ),
                    ),
                  ),
                  TechDetailPostSlug(
                    isMobile: false,
                    postSlug: postSlug,
                    isFocused: (isFocused) {
                      context.read<TechBlogPostDetailCubit>().togglePlayerFocus(
                        postSlug,
                      );
                    },
                    isBackgroundColor: state.isBackgroundColorWhite,
                  ),
                ],
              ),

              Positioned.fill(
                child:
                    state.isScreenFilter
                        ? InkWell(
                          onTap: () {
                            context
                                .read<TechBlogPostDetailCubit>()
                                .clearPlayerFocus();
                          },
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.8),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
              GestureDetector(
                onTap: () {
                  if (!state.isPlayerClicked) {
                    context.read<TechBlogPostDetailCubit>().togglePlayerFocus(
                      postSlug,
                    );
                  }
                },
                child: TechDetailPlayer(
                  isFocused: (isFocused) {
                    if (isFocused && !state.isPlayerClicked) {
                      context.read<TechBlogPostDetailCubit>().togglePlayerFocus(
                        postSlug,
                      );
                    }
                  },
                  isPlayerClicked: state.isPlayerClicked,
                  showOptions: state.showOptions,
                  searchQuery: state.searchQuery,
                  onFocusLost: () {
                    context.read<TechBlogPostDetailCubit>().clearPlayerFocus();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
