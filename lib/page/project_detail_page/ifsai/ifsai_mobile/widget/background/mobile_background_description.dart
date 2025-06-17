import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class MobileBackgroundDescription extends StatelessWidget {
  final bool isTitleVisible;
  final bool isContentVisible;

  const MobileBackgroundDescription({
    super.key,
    required this.isTitleVisible,
    required this.isContentVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          WidgetAnimation(
            isStart: isTitleVisible,
            child: Text(
              '쉿!  사용자에게는 비밀이야',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          WidgetAnimation(
            isStart: isContentVisible,
            duration: 1000,
            beginDy: 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사용자가 인지하지 못하는 사이에 앱의 성능을 최적화하고,\n필요한 데이터를 미리 준비하여 부드러운 사용자 경험을 제공합니다.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13.sp,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  '• 시스템 환경 설정 및 SDK 초기화\n'
                  '• 데이터베이스 관리 및 동기화\n'
                  '• 위치 서비스 및 권한 관리\n'
                  '• 검색 기능 최적화\n'
                  '• 네이버 맵 데이터 처리\n'
                  '• 사용자 인증 및 세션 관리\n'
                  '• 장바구니 실시간 동기화\n'
                  '• 성능 최적화 및 메모리 관리\n'
                  '• 서버 상태 모니터링',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
