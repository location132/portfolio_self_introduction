import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/constants/text_constants.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/view/profile_view/profile_view.dart';
import 'package:self_introduction_flutter/page/main_page/view/about_view/banner_section.dart';
import 'package:self_introduction_flutter/page/main_page/view/intro_view/introShowcase.dart';
import 'package:self_introduction_flutter/page/main_page/widgets/title_text.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainPageCubit>(),
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
            body: Column(
          children: [
            TopNavBar(toggleFullScreen: () {}),
            SizedBox(
              height: MediaQuery.of(context).size.height - 83,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                controller: state.startViewScrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height,
                    pinned: false,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Introshowcase(
                        state: state,
                        initializeAnimations:
                            context.read<MainPageCubit>().initializeAnimations,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.sh),
                        const TitleText(
                          title: TitleTextConstants.title1,
                          subTitle: TitleTextConstants.subTitle1,
                          description: TitleTextConstants.description1,
                        ),
                        SizedBox(height: 10.sh),
                        BannerSection(state: state),
                        SizedBox(height: 120.sh),
                        const TitleText(
                          title: TitleTextConstants.title2,
                          subTitle: TitleTextConstants.subTitle2,
                          description: TitleTextConstants.description2,
                        ),
                        SizedBox(height: 80.sh),
                        VisibilityDetector(
                          key: const Key('profile-view'),
                          onVisibilityChanged: (VisibilityInfo info) {
                            context
                                .read<MainPageCubit>()
                                .profileViewListener(info.visibleFraction);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 132.sw),
                            child: ProfileView(state: state),
                          ),
                        ),
                        SizedBox(height: 120.sh),
                        const TitleText(
                          title: TitleTextConstants.title3,
                          subTitle: TitleTextConstants.subTitle3,
                          description: TitleTextConstants.description3,
                        ),
                        SizedBox(height: 80.sh),
                        SizedBox(height: 800.sh),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
      },
    );
  }
}
