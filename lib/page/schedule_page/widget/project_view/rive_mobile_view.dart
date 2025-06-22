import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'rive_mobile_item.dart';

class RiveMobileView extends StatelessWidget {
  const RiveMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              '11월 10일',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        const RiveMobileItem(
          title: 'Rive Animation - 인터랙티브 UI',
          description:
              '사용자 상호작용에 반응하는 Rive 애니메이션을 Flutter에 통합.\n포트폴리오 메인 화면의 인터랙티브 요소들을 구현했습니다.',
          riveAsset: 'assets/rive/mySkill.riv',
          showDate: false,
        ),
        SizedBox(height: 24.h),
        const RiveMobileItem(
          title: 'Rive Animation - 배너 효과',
          description:
              '동적인 배너 애니메이션으로 사용자의 시선을 사로잡는 UI.\nRive의 강력한 애니메이션 기능을 활용한 프로젝트입니다.',
          riveAsset: 'assets/rive/rive_banner.riv',
          showDate: false,
        ),
        SizedBox(height: 24.h),
        const RiveMobileItem(
          title: 'Rive Animation - 모바일 디테일',
          description:
              '모바일 환경에 최적화된 Rive 애니메이션 구현.\n반응형 디자인과 애니메이션의 완벽한 조화를 보여드립니다.',
          riveAsset: 'assets/rive/mobile_detail.riv',
          showDate: false,
        ),
      ],
    );
  }
}
