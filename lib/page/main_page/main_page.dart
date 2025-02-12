import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widget/banner_section.dart';
import 'package:self_introduction_flutter/page/main_page/widget/intro_screen.dart';
import 'package:self_introduction_flutter/page/main_page/widget/top_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MainPageCubit>(),
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<MainPageCubit>();
    cubit.state.scrollController?.addListener(() {
      cubit.scrollListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
          body: state.status == MainPageStatus.loaded
              ? SingleChildScrollView(
                  controller: state.scrollController,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          IntroScreen(state: state),
                          const SizedBox(height: 1),
                        ],
                      ),
                      // Visibility(
                      //   //TODO: 배포전 변경
                      //   //visible: state.isAnimationStart,
                      //   visible: state.isAnimationStart,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 41.sw),
                      //     child: AnimatedOpacity(
                      //       opacity: state.isScrolled ? 1.0 : 0.0,
                      //       duration: const Duration(milliseconds: 300),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           SizedBox(height: 10.sh),
                      //           const TopNavBar(),
                      //           SizedBox(height: 40.sh),
                      //           const BannerSection(),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
