import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';
import 'package:my_dream/Page/12_naver_map/page/bottom_sheet/widget/long_panel.dart';
import 'package:my_dream/Page/12_naver_map/page/bottom_sheet/widget/short_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaverMapCubit, NaverMapState>(
      builder: (context, state) {
        return SlidingUpPanel(
          controller: state.panelController,
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          borderRadius: state.panelState != BottomSheetState.closed
              ? const BorderRadius.vertical(top: Radius.circular(12))
              : BorderRadius.zero,
          snapPoint: 0.223,
          onPanelClosed: () {
            //패널 닫기
            if (state.panelState != BottomSheetState.closed) {
              context
                  .read<NaverMapCubit>()
                  .updatePanelState(BottomSheetState.closed);
            }
          },
          onPanelSlide: (double position) {
            // 축소 패널
            if (state.panelState != BottomSheetState.half) {
              context.read<NaverMapCubit>().panelReduction(position);
            }
            // 확장 패널
            if (state.panelState != BottomSheetState.expanded) {
              context.read<NaverMapCubit>().panelExpansion(position);
            }
          },
          panel: Container(
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: state.panelState == BottomSheetState.expanded
                  ? const LongPanel(
                      key: ValueKey('long_panel'),
                    )
                  : const ShortPanel(
                      key: ValueKey('short_panel'),
                    ),
            ),
          ),
        );
      },
    );
  }
}
