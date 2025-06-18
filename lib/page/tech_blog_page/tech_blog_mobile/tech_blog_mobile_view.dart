import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_blog_header.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_category_nav.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_post_list.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_mobile/widget/mobile_tech_player.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogMobileView extends StatefulWidget {
  const TechBlogMobileView({super.key});

  @override
  State<TechBlogMobileView> createState() => _TechBlogMobileViewState();
}

class _TechBlogMobileViewState extends State<TechBlogMobileView> {
  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
    final isMobileDevice = MainService().isMobileDevice();

    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

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
        return BlocBuilder<TechBlogCubit, TechBlogState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      TopNavBar(
                        deviceType: deviceType,
                        isMenuClicked: state.isMenuClicked,
                        onPressed: () {
                          context.read<TechBlogCubit>().toggleMenu();
                        },
                        onHomePressed: () {
                          context.go('/');
                        },
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 40.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MobileTechBlogHeader(),
                                SizedBox(height: 60.h),

                                const MobileTechCategoryNav(),
                                Divider(height: 1, color: Colors.grey.shade800),
                                SizedBox(height: 32.h),

                                const MobileTechPostList(),
                                SizedBox(height: 80.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MenuScreen(isMenuClicked: state.isMenuClicked),
                  const MobileTechPlayer(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
