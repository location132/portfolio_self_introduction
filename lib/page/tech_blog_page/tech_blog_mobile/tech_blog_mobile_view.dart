import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_cubit.dart';
import 'package:self_introduction_flutter/page/tech_blog_page/tech_blog_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class TechBlogMobileView extends StatefulWidget {
  const TechBlogMobileView({super.key});

  @override
  State<TechBlogMobileView> createState() => _TechBlogMobileViewState();
}

class _TechBlogMobileViewState extends State<TechBlogMobileView> {
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
                                Text(
                                  '기술 블로그',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  '개발하면서 배운 것들을 정리하는 공간',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[400],
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 32.h),

                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2d2d2d),
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color:
                                          _searchFocusNode.hasFocus
                                              ? Colors.blue[400]!
                                              : Colors.grey[600]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _searchController,
                                    focusNode: _searchFocusNode,
                                    onChanged: (value) {},
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '검색어를 입력하세요...',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16.sp,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 48.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MenuScreen(isMenuClicked: state.isMenuClicked),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
