import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_cubit.dart';
import 'package:self_introduction_flutter/page/project_detail_page/ifsai/ifsai_desktop/ifsai_state.dart';
import 'mobile_background_description.dart';
import 'mobile_background_features.dart';
import 'mobile_background_video.dart';

class MobileBackgroundView extends StatelessWidget {
  final IfsaiState state;
  final IfsaiCubit cubit;

  const MobileBackgroundView({
    super.key,
    required this.state,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Text(
            '사용자 경험을 위해 탄생한 백그라운드\n조용하게 돌아가는 최고의 기술',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          SizedBox(height: 30.h),
          MobileBackgroundVideo(state: state),
          SizedBox(height: 30.h),
          MobileBackgroundDescription(
            isTitleVisible: state.isBackgrounTitleVisible,
            isContentVisible: state.isBackgroundContentVisible,
          ),
          SizedBox(height: 40.h),
          MobileBackgroundFeatures(isVisible: state.isBackgroundFeatureVisible),
        ],
      ),
    );
  }
}
