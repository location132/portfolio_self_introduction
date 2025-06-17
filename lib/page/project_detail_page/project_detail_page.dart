import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_detail_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_mobile/ifsai_mobile_detail_view.dart';
import 'package:self_introduction_flutter/page/project_detail_page/project_detail_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/project_detail_state.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class ProjectDetailPage extends StatelessWidget {
  final String projectName;

  const ProjectDetailPage({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              di<ProjectDetailCubit>()
                ..setProjectName(projectName)
                ..loadProject(),
      child: const _ProjectDetailView(),
    );
  }
}

class _ProjectDetailView extends StatelessWidget {
  const _ProjectDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailCubit, ProjectDetailState>(
      builder: (context, state) {
        final deviceType = MainService().setScreenSize(
          MediaQuery.of(context).size.width,
        );

        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 2500),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ),
                  ),

                  Visibility(
                    visible: state.projectName == 'ifsai',
                    child:
                        deviceType == 'mobile'
                            ? WidgetAnimation(
                              beginDy: 0.02,
                              isStart: state.isLoaded,
                              child: const IfsaiMobileDetailPage(),
                            )
                            : Visibility(
                              visible: deviceType == 'desktop',
                              child: WidgetAnimation(
                                beginDy: 0.02,
                                isStart: state.isLoaded,
                                child: const IfsaiDetailPage(),
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
