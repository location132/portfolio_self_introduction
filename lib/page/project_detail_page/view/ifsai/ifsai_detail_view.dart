import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/model/project_detail/ifsai_model.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/ifsai_state.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_content2.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_contents.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_detail_section.dart';
import 'package:self_introduction_flutter/page/project_detail_page/view/ifsai/widget/project_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class IfsaiDetailPage extends StatelessWidget {
  const IfsaiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<IfsaiCubit>(),
      child: IfsaiDetailView(),
    );
  }
}

class IfsaiDetailView extends StatelessWidget {
  const IfsaiDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IfsaiCubit, IfsaiState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.lerp(
                Colors.white,
                Colors.black,
                state.backgroundDarkness,
              ),
            ),

            SingleChildScrollView(
              controller: state.scrollController,
              physics:
                  state.isScrollEnabled
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height - 83),
                  SizedBox(height: 950),
                  Column(
                    children: [
                      VisibilityDetector(
                        key: const Key('project-contents-view'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0.1 &&
                              !state.isPlayerVisible) {
                            context.read<IfsaiCubit>().setPlayerVisible(true);
                          } else if (info.visibleFraction < 0.1 &&
                              state.isPlayerVisible) {
                            context.read<IfsaiCubit>().setPlayerVisible(false);
                          }
                        },
                        child: ProjectContents(state: state),
                      ),

                      SizedBox(height: 200),
                      VisibilityDetector(
                        key: const Key('project-content2-view'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0.1 &&
                              !state.isPlayerVisible) {
                            context.read<IfsaiCubit>().setPlayerVisible(false);
                          }
                        },
                        child: ProjectContent2(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ProjectDetailSection(
              model: IfsaiModel(),
              mainTitleOpacity: state.mainTitleOpacity,
              descriptionOpacity: state.descriptionOpacity,
              titleOpacity: state.titleOpacity,
              titleScale: state.titleScale,
              titleOffset: state.titleOffset,
              scrollDescriptionOpacity: state.scrollDescriptionOpacity,
              mainTitleTranslateY: state.mainTitleTranslateY,
              descriptionTranslateY: state.descriptionTranslateY,
              textColor: state.textColor,
              setScrollEnabled:
                  (isEnabled) =>
                      context.read<IfsaiCubit>().setScrollEnabled(isEnabled),
            ),

            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: ProjectPlayer(
                isPlayerAniOpacity: state.isPlayerVisible,
                isPlayerText: state.playerText,
              ),
            ),
          ],
        );
      },
    );
  }
}
