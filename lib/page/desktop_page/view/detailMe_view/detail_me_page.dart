import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_cubit.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_state.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/detailMe_view/detail_me_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DetailMePage extends StatelessWidget {
  final DesktopState state;
  final DesktopCubit desktopCubit;

  const DetailMePage({
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
          key: const Key('detail-me-view'),
          onVisibilityChanged: (VisibilityInfo info) {
            // 화면 높이별 SlowScrollPhysics 비활성화 임계값 체크
            bool shouldDisableSlowScroll = false;

            if (MediaQuery.of(context).size.height > 1100) {
              shouldDisableSlowScroll = info.visibleFraction == 1;

              if (info.visibleFraction == 1 &&
                  !state.detailMeModel.isDetailMeRiveStart) {
                desktopCubit.detailMeRiveStart();
              }
            } else if (MediaQuery.of(context).size.height < 983) {
              shouldDisableSlowScroll = false;
              desktopCubit.detailMeRiveEnd();
            } else {
              shouldDisableSlowScroll = info.visibleFraction > 0.7;

              if (info.visibleFraction > 0.8 &&
                  !state.detailMeModel.isDetailMeRiveStart) {
                desktopCubit.detailMeRiveStart();
              }
            }

            desktopCubit.updateSlowScrollState(shouldDisableSlowScroll);
          },
          child: DesktopDetailMeView(state: state),
        ),
      ],
    );
  }
}
