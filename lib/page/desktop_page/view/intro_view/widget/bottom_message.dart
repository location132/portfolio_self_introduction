import 'package:flutter/material.dart';

class BottomMessage extends StatelessWidget {
  final bool isChromeBrowser;
  const BottomMessage({super.key, required this.isChromeBrowser});

  @override
  Widget build(BuildContext context) {
    return isChromeBrowser
        ? const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Text(
              '2025년 포트폴리오 모바일 버전에서는\n'
              '앱 스타일의 색다른 포트폴리오를 확인하실 수 있습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            SizedBox(height: 12),
          ],
        )
        : const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            Text(
              'Chrome으로 접속 시, 더욱 부드러운 애니메이션과\n'
              '다양한 Rive 효과를 경험할 수 있습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            SizedBox(height: 12),
          ],
        );
  }
}
