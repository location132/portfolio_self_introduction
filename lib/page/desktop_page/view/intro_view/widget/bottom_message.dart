import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/rive/air_bubble.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class BottomMessage extends StatelessWidget {
  final bool isChromeBrowser;
  const BottomMessage({super.key, required this.isChromeBrowser});

  @override
  Widget build(BuildContext context) {
    return isChromeBrowser
        ? Padding(
            padding: EdgeInsets.only(bottom: 30.sh),
            child: SizedBox(
              height: 100.sh,
              child: const AirBubble(),
            ),
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
