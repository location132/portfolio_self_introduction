import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/text/styled_text.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_state.dart';
import 'package:self_introduction_flutter/page/main_page/widget/banner_section.dart';
import 'package:self_introduction_flutter/page/main_page/start_view/widgets/introShowcase.dart';

class StartView extends StatelessWidget {
  final MainPageState state;
  final void Function(TickerProvider vsync) initializeAnimations;
  const StartView({
    super.key,
    required this.state,
    required this.initializeAnimations,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 83,
      width: MediaQuery.of(context).size.width,
      child: CustomScrollView(
        controller: state.startViewScrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height - 83,
            pinned: false,
            backgroundColor: Colors.transparent,
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
                const SizedBox(height: 20),
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
                BannerSection(state: state),
                SizedBox(height: 1000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
