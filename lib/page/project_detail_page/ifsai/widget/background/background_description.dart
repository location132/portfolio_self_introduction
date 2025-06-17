import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';

class BackgroundDescription extends StatefulWidget {
  final bool isTitleVisible;
  final bool isContentVisible;
  const BackgroundDescription({
    super.key,
    required this.isTitleVisible,
    required this.isContentVisible,
  });

  @override
  State<BackgroundDescription> createState() => _BackgroundDescriptionState();
}

class _BackgroundDescriptionState extends State<BackgroundDescription> {
  double? _previousScreenWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (_previousScreenWidth != null && _previousScreenWidth != screenWidth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
    _previousScreenWidth = screenWidth;

    double containerWidth;
    double titleFontSize;
    double descriptionFontSize;
    double featureFontSize;

    if (screenWidth > 1024) {
      containerWidth = 500;
      titleFontSize = 24;
      descriptionFontSize = 16;
      featureFontSize = 14;
    } else if (screenWidth > 600) {
      containerWidth = 600;
      titleFontSize = 20;
      descriptionFontSize = 14;
      featureFontSize = 13;
    } else {
      containerWidth = 350;
      titleFontSize = 18;
      descriptionFontSize = 13;
      featureFontSize = 12;
    }

    return SizedBox(
      width: containerWidth,
      child: Column(
        crossAxisAlignment:
            screenWidth <= 1024
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          WidgetAnimation(
            isStart: widget.isTitleVisible,
            child: Text(
              '쉿!  사용자에게는 비밀이야',
              textAlign:
                  screenWidth <= 1024 ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: titleFontSize,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 24),
          WidgetAnimation(
            isStart: widget.isContentVisible,
            duration: 1000,
            beginDy: 0.1,
            child: Column(
              crossAxisAlignment:
                  screenWidth <= 1024
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                Text(
                  '사용자가 인지하지 못하는 사이에 앱의 성능을 최적화하고,\n 필요한 데이터를 미리 준비하여 부드러운 사용자 경험을 제공합니다.',
                  textAlign:
                      screenWidth <= 1024 ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: descriptionFontSize,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
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
                  textAlign:
                      screenWidth <= 1024 ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: featureFontSize,
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
