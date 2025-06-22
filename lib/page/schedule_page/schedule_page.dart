import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_cubit.dart';
import 'package:self_introduction_flutter/page/schedule_page/schedule_state.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/schedule_header.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/ifsai_project_button.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/tech_blog_section.dart';
import 'package:self_introduction_flutter/page/schedule_page/widget/project_open_section.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ScheduleCubit>(),
      child: const ScheduleView(),
    );
  }
}

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _isMobile(context) ? 20 : 80,
                vertical: 40,
              ),
              child: Column(
                children: const [
                  ScheduleHeader(),
                  SizedBox(height: 60),
                  IfsaiProjectButton(),
                  SizedBox(height: 80),
                  TechBlogSection(),
                  SizedBox(height: 80),
                  ProjectOpenSection(),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
