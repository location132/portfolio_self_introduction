import 'package:flutter/material.dart';

void showMobileDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "iOS 환경 안내",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Text(
                    "iOS 18.2 이상과 Flutter\nWeb(CanvasKit) 렌더러 간의\n"
                    "호환 문제로 인해 스크롤 시\n프레임 드랍이 발생하고 있습니다.\n\n\n"
                    "현재 iOS 환경은 React 기반으로\n재구성 중입니다.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Color(0xFF34495E),
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}
