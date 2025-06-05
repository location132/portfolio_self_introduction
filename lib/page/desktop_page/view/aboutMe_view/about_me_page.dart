import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/aboutMe_view/about_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMePage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const AboutMePage({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.sh),
        VisibilityDetector(
          key: const Key('about-me-view'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.4 &&
                state.scrollModel.aboutMeViewState ==
                    AboutMeViewState.inactive) {
              context.read<DesktopCubit>().viewListener('about');
            }
          },
          child: DesktopAboutView(state: state),
        ),
      ],
    );
  }
}
