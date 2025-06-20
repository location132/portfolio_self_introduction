import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

void handleLoginResult(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return const StartMaintenanceNotice();
    },
  );
}

class StartMaintenanceNotice extends StatefulWidget {
  const StartMaintenanceNotice({super.key});

  @override
  State<StartMaintenanceNotice> createState() => _StartMaintenanceNoticeState();
}

class _StartMaintenanceNoticeState extends State<StartMaintenanceNotice> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: screenWidth * 0.85,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Image.asset('assets/error.png', height: 50),
                const SizedBox(height: 9),
                const Text(
                  '서비스 점검',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111111),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '잎사이 점검 시간입니다!.\n점검이 완료된 후 재접속해주세요',
                  style: TextStyle(
                    color: Color(0xff5b5b5b),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6fbf8a), // 버튼 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: const Size(double.infinity, 40), // 버튼 사이즈 조절
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
