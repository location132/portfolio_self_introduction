import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_state.dart';
import 'package:my_dream/coreService/core/utils/responsive_size.dart';
import 'package:my_dream/coreService/widget/%08ifsai_button_components/wide_green_button.dart';

class ShortPanel extends StatefulWidget {
  const ShortPanel({super.key});

  @override
  State<ShortPanel> createState() => _ShortPanelState();
}

class _ShortPanelState extends State<ShortPanel> {
  double turns = 0.0;

  void _handleDistanceUpdate(NaverMapState state) {
    setState(() {
      turns += 1;
    });
    context.read<NaverMapCubit>().updateDistance(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaverMapCubit, NaverMapState>(
      builder: (context, state) {
        return SizedBox(
          height: 190.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 8.5.sh),
              // 드래그 핸들
              Center(
                child: Container(
                  width: 30.sw,
                  height: 3.sh,
                  decoration: const BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 패널 내용
              Padding(
                padding: EdgeInsets.only(left: 26.5.sw),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      state.selectedMarkerData?.marketName ?? '',
                      style: const TextStyle(
                        color: Color(0xff393939),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5.sw),
                    Text(
                      state.selectedMarkerData?.marketDescription ?? '',
                      style: const TextStyle(
                        color: Color(0xffc1c1c1),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    SizedBox(width: 15.sw),
                    InkWell(
                      onTap: () => _handleDistanceUpdate(state),
                      child: Text(
                        state.distance,
                        style: const TextStyle(
                          color: Color(0xff6fbf8a),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                    SizedBox(width: 5.sw),
                    if (state.locationPermissionState !=
                        LocationPermissionState.granted) ...[
                      InkWell(
                        onTap: () => _handleDistanceUpdate(state),
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 420),
                          turns: turns,
                          child: Icon(
                            Icons.refresh,
                            color: Colors.grey,
                            size: 15.sh,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 5.sh),
              Padding(
                padding: EdgeInsets.only(left: 26.5.sw),
                child: Text(
                  state.selectedMarkerData?.detailAddress ?? '',
                  style: const TextStyle(
                    color: Color(0xff5b5b5b),
                    fontFamily: 'Pretendard',
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sw),
                child: WideGreenButton(
                  buttonText: '선택',
                  onPressed: () {
                    context
                        .read<NaverMapCubit>()
                        .updatePanelState(BottomSheetState.expanded);
                  },
                ),
              ),
              SizedBox(height: 40.sh),
            ],
          ),
        );
      },
    );
  }
}
