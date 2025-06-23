import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/correct_solution_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/gsshop_header_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/gsshop_title_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_analysis_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_description_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_solution_section.dart';
import 'package:self_introduction_flutter/service/main_service.dart';
import '../gsshop_cubit.dart';
import '../gsshop_state.dart';

class GsShopMobileDetailView extends StatelessWidget {
  const GsShopMobileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final logicalWidth = MediaQuery.of(context).size.width;
    final isFoldable = logicalWidth >= 490;
    return ScreenUtilInit(
      designSize: isFoldable ? const Size(770, 900) : const Size(450, 752),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => di<GsShopCubit>(),
          child: const _GsShopMobileDetailViewContent(),
        );
      },
    );
  }
}

class _GsShopMobileDetailViewContent extends StatelessWidget {
  const _GsShopMobileDetailViewContent();

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<GsShopCubit, GsShopState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(width: double.infinity, color: Colors.black),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    width: double.infinity,
                    color: Colors.white,
                    child: TopNavBar(
                      deviceType: deviceType,
                      isMenuClicked: state.isMenuClicked,
                      onPressed: () {
                        context.read<GsShopCubit>().toggleMenu();
                      },
                      onHomePressed: () {
                        context.go('/');
                      },
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50.h),
                            const GsShopTitleSection(isMobile: true),
                            SizedBox(height: 100.h),
                            const GsShopHeaderSection(isMobile: true),
                            SizedBox(height: 40.h),
                            Divider(color: Colors.grey[300], thickness: 2),
                            SizedBox(height: 40.h),
                            ProblemDescriptionSection(
                              isMobile: true,
                              isLeft: true,
                              videoUrl: state.firstVideoUrl,
                              videoTitle: state.firstVideoTitle,
                              videoDescription: state.firstVideoDescription,
                              sectionTitle: state.firstSectionTitle,
                              sectionDescription: state.firstSectionDescription,
                            ),
                            SizedBox(height: 140.h),
                            ProblemDescriptionSection(
                              isMobile: true,
                              isLeft: false,
                              videoUrl: state.secondVideoUrl,
                              videoTitle: state.secondVideoTitle,
                              videoDescription: state.secondVideoDescription,
                              sectionTitle: state.secondSectionTitle,
                              sectionDescription:
                                  state.secondSectionDescription,
                            ),
                            SizedBox(height: 100.h),
                            Padding(
                              padding: EdgeInsets.all(20.h),
                              child: ProblemAnalysisSection(isMobile: true),
                            ),
                            SizedBox(height: 100.h),
                            ProblemSolutionSection(isMobile: true),
                            SizedBox(height: 100.h),
                            CorrectSolutionSection(isMobile: true),
                            SizedBox(height: 100.h),

                            ProblemDescriptionSection(
                              isMobile: true,
                              isLeft: true,
                              videoUrl: state.thirdVideoUrl,
                              videoTitle: state.thirdVideoTitle,
                              videoDescription: state.thirdVideoDescription,
                              sectionTitle: state.thirdSectionTitle,
                              sectionDescription: state.thirdSectionDescription,
                              isTextOnTop: true,
                            ),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
