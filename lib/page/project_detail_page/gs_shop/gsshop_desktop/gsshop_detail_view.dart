import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/gsshop_title_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/gsshop_header_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_description_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_analysis_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/problem_solution_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/gs_shop/gsshop_desktop/widget/correct_solution_section.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class GsShopDetailView extends StatelessWidget {
  const GsShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<GsShopCubit>(),
      child: const _GsShopDetailViewContent(),
    );
  }
}

class _GsShopDetailViewContent extends StatelessWidget {
  const _GsShopDetailViewContent();

  @override
  Widget build(BuildContext context) {
    final deviceType = MainService().setScreenSize(
      MediaQuery.of(context).size.width,
    );

    return BlocBuilder<GsShopCubit, GsShopState>(
      builder: (context, state) {
        return Container(
          color: Colors.black,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: TopNavBar(
                        deviceType: deviceType,
                        isMenuClicked: state.isMenuClicked,
                        onPressed:
                            deviceType == 'mobile'
                                ? () {
                                  context.read<GsShopCubit>().toggleMenu();
                                }
                                : null,
                        onHomePressed: () {
                          context.go('/');
                        },
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 140),
                          const GsShopTitleSection(),
                          const SizedBox(height: 100),
                          const GsShopHeaderSection(),
                          const SizedBox(height: 140),
                          Divider(color: Colors.grey[300], thickness: 2),
                          const SizedBox(height: 100),
                          ProblemDescriptionSection(
                            isLeft: true,
                            videoUrl: state.firstVideoUrl,
                            videoTitle: state.firstVideoTitle,
                            videoDescription: state.firstVideoDescription,
                            sectionTitle: state.firstSectionTitle,
                            sectionDescription: state.firstSectionDescription,
                          ),
                          const SizedBox(height: 240),
                          ProblemDescriptionSection(
                            isLeft: false,
                            videoUrl: state.secondVideoUrl,
                            videoTitle: state.secondVideoTitle,
                            videoDescription: state.secondVideoDescription,
                            sectionTitle: state.secondSectionTitle,
                            sectionDescription: state.secondSectionDescription,
                          ),
                          const SizedBox(height: 100),

                          const ProblemAnalysisSection(),

                          const SizedBox(height: 240),

                          const ProblemSolutionSection(),

                          const SizedBox(height: 240),

                          const CorrectSolutionSection(),

                          const SizedBox(height: 240),

                          ProblemDescriptionSection(
                            isLeft: true,
                            videoUrl: state.thirdVideoUrl,
                            videoTitle: state.thirdVideoTitle,
                            videoDescription: state.thirdVideoDescription,
                            sectionTitle: state.thirdSectionTitle,
                            sectionDescription: state.thirdSectionDescription,
                            isTextOnTop: true, // 최종 결과에서는 텍스트가 위로
                          ),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
