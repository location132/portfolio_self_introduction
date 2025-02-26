import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/components/text/styled_text.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widget/banner_section.dart';
import 'package:self_introduction_flutter/page/main_page/start_view/widgets/introShowcase.dart';

class StartView extends StatelessWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync) initializeAnimations;
  final void Function() toggleFullScreen;
  const StartView({
    super.key,
    required this.state,
    required this.initializeAnimations,
    required this.toggleFullScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            controller: state.startViewScrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Introshowcase(
                    state: state,
                    initializeAnimations: initializeAnimations,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 1.sh),
                    if (state.mainViewScrollStatus ==
                        MainViewScrollStatus.end) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 132.sw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                StyledText.heading(
                                  text: 'About Me.',
                                ),
                                StyledText.subHeading(
                                  text: '짧지만 깊게',
                                ),
                              ],
                            ),
                            StyledText.subHeading(
                              text: '   나를 담은 소개 애니메이션',
                            ),
                          ],
                        ),
                      ),
                      const BannerSection(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        TopNavBar(
          toggleFullScreen: toggleFullScreen,
        ),
      ],
    );
  }
}
