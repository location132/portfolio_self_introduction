import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/%08core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/start_page/start_cubit.dart';
import 'package:self_introduction_flutter/page/start_page/start_state.dart';
import 'package:self_introduction_flutter/page/start_page/widget/intro_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<StartPageCubit>(),
      child: const StartPageView(),
    );
  }
}

class StartPageView extends StatefulWidget {
  const StartPageView({super.key});

  @override
  State<StartPageView> createState() => _StartPageViewState();
}

class _StartPageViewState extends State<StartPageView> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<StartPageCubit>();
    cubit.state.scrollController?.addListener(() {
      cubit.scrollListener();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartPageCubit, StartPageState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            controller: state.scrollController,
            child: IntroScreen(state: state),
          ),
        );
      },
    );
  }
}
