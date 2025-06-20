import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_desktop/widget/tech_detail_post_slug.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_mobile/widget/tech_detail_player_mobile.dart';
import 'package:self_introduction_flutter/page/tech_blog_post_detail_page/tech_blog_post_detail_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogPostDetailMobilePage extends StatelessWidget {
  final String postSlug;
  const TechBlogPostDetailMobilePage({super.key, required this.postSlug});

  @override
  Widget build(BuildContext context) {
    final isMobileDevice = MainService().isMobileDevice();
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
    return ScreenUtilInit(
      designSize:
          isMobileDevice
              ? isFoldable
                  ? const Size(770, 900)
                  : const Size(450, 752)
              : Size(logicalWidth, MediaQuery.of(context).size.height),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return TechBlogPostDetailMobileView(postSlug: postSlug);
      },
    );
  }
}

class TechBlogPostDetailMobileView extends StatelessWidget {
  final String postSlug;

  const TechBlogPostDetailMobileView({super.key, required this.postSlug});

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<TechBlogPostDetailCubit, TechBlogPostDetailState>(
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
                          context.read<TechBlogPostDetailCubit>().toggleMenu();
                        },
                        onHomePressed: () {
                          context.push('/');
                        },
                      ),
                    ),
                  ),
                  TechDetailPostSlug(
                    isMobile: true,
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
              MenuScreen(isMenuClicked: state.isMenuClicked),

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
                child: TechDetailPlayerMobile(
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
