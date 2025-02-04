import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/%08core_service/di/injector.dart';
import 'package:self_introduction_flutter/%08core_service/util/device_Info_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/page/main_page/main_cubit.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widget/banner_section.dart';
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 41.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.sh),
                const TopNavBar(),
                SizedBox(height: 40.sh),
                const BannerSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
