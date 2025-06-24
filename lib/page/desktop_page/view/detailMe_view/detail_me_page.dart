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
            final screenHeight = MediaQuery.of(context).size.height;
            bool shouldDisableSlowScroll = false;

            if (screenHeight <= 600) {
              // 600 이하: 에러 표시, 애니메이션 중지
              shouldDisableSlowScroll = false;
              desktopCubit.detailMeRiveEnd();
            } else if (screenHeight > 1100) {
              // 1100 초과: 기존 대화면 로직 유지
              shouldDisableSlowScroll = info.visibleFraction == 1;

              if (info.visibleFraction == 1 &&
                  !state.detailMeModel.isDetailMeRiveStart) {
                desktopCubit.detailMeRiveStart();
              }
            } else {
              // 600~1100: 동적 높이에 맞춘 조건
              shouldDisableSlowScroll = info.visibleFraction > 0.3;

              if (info.visibleFraction > 0.7 &&
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
