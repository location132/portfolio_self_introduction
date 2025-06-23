import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStoryStart extends StatelessWidget {
  final bool isBackgroundColorWhite;
  final GlobalKey codeExampleSectionKey;
  final String textTitle;
  final String textSubTitle;
  final String? textSubTitle2;
  final bool isMobile;
  const MyStoryStart({
    super.key,
    required this.isBackgroundColorWhite,
    required this.codeExampleSectionKey,
    required this.textTitle,
    required this.textSubTitle,
    this.textSubTitle2 = '',
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: isBackgroundColorWhite ? Colors.black : Colors.grey.shade700,
          thickness: 1,
        ),
        SizedBox(height: isMobile ? 150.h : 150),
        Center(
          key: codeExampleSectionKey,
          child: Text(
            textTitle,
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: isMobile ? 20.sp : 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            textSubTitle,
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: isMobile ? 20.sp : 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            textSubTitle2 ?? '',
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: isMobile ? 16.sp : 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: isMobile ? 150.h : 150),

        Divider(
          color: isBackgroundColorWhite ? Colors.black : Colors.grey.shade700,
          thickness: 1,
        ),
      ],
    );
  }
}
