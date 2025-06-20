/*
  현재 위치 버튼
  => 클릭시 사용자의 현재 위치로 이동할 수 있게 하는 위젯입니다.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_cubit.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      splashColor: const Color(0xff6fbf8a).withValues(alpha: 0.3),
      onPressed: () {
        context.read<NaverMapCubit>().moveToCurrentLocation(context);
      },
      backgroundColor: Colors.white,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.my_location_rounded,
        color: Color(0xff8e8e8e),
        size: 27.5,
      ),
    );
  }
}
