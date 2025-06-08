import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_introduction_flutter/model/main_page/scroll_model.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/banner_view/banner_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BannerPage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;
  const BannerPage({
    super.key,
    required this.state,
    required this.desktopCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VisibilityDetector(
          key: const Key('banner-view'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.2 &&
                state.scrollModel.bannerState == BannerState.inactive &&
                !state.bannerModel.isBannerActive) {
              context.read<DesktopCubit>().viewListener('banner');
            }
          },
          child: BannerView(
            desktopCubit: desktopCubit,
            state: state,
            isActive: (bool isActive) {
              context.read<DesktopCubit>().descriptionButton(
                'banner',
                isActive,
              );
            },
          ),
        ),
      ],
    );
  }
}
