import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/intro_page/intro_screen.dart';
import 'package:self_introduction_flutter/page/main_page/start_view/start_view.dart';

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
          body: state.status == MainPageStatus.loaded
              ? Column(
                  children: [
                    TopNavBar(
                      toggleFullScreen: () => context
                          .read<MainPageCubit>()
                          .toggleFullScreen(context),
                    ),
                    SingleChildScrollView(
                      controller: state.mainViewScrollController,
                      child: Stack(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: state.mainViewScrollStatus !=
                                    MainViewScrollStatus.initial
                                ? StartView(
                                    state: state,
                                    initializeAnimations: (vsync) {
                                      context
                                          .read<MainPageCubit>()
                                          .initializeAnimations(vsync);
                                    },
                                  )
                                : IntroScreen(state: state),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
