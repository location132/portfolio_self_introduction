import 'dart:ui';
import 'package:flutter/material.dart';

// Dialog, 이미 종료된 이벤트 클릭 시 발생
void handleMyPageEventEndDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext context) {
      return const MyPageEventEndDialog();
    },
  );
}

class MyPageEventEndDialog extends StatefulWidget {
  const MyPageEventEndDialog({super.key});

  @override
  State<MyPageEventEndDialog> createState() => _MyPageEventEndDialogState();
}

class _MyPageEventEndDialogState extends State<MyPageEventEndDialog>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.3, sigmaY: 2.3),
      child: Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.only(left: 30, right: 30),
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      SizedBox(height: screenHeight * 0.047),
                      const Text(
                        '이미 종료된 이벤트입니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff5b5b5b),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: screenHeight * 0.047,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff6fbf8a),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.024),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
