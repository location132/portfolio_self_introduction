import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/menu_screen.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_cubit.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_state.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/schedule_header_section.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/schedule_tech_blog_section.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/schedule_project_section.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ScheduleCubit>()..initializePage(),
      child: const _ScheduleView(),
    );
  }
}

class _ScheduleView extends StatelessWidget {
  const _ScheduleView();

  @override
  Widget build(BuildContext context) {
    final isMobile = MainService().isMobileDevice();
    final width = MediaQuery.of(context).size.width;
    final deviceType = MainService().setScreenSize(width);

    return BlocBuilder<ScheduleCubit, ScheduleState>(
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
                        onPressed:
                            () => context.read<ScheduleCubit>().toggleMenu(),
                        onHomePressed: () {},
                        isMenuClicked: state.isMenuClicked,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ScheduleHeaderSection(isMobile: isMobile),
                            ScheduleProjectSection(isMobile: isMobile),
                            ScheduleTechBlogSection(isMobile: isMobile),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              if (isMobile) MenuScreen(isMenuClicked: state.isMenuClicked),
            ],
          ),
        );
      },
    );
  }
}
