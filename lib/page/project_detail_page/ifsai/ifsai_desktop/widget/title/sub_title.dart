import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTitle extends StatelessWidget {
  final double mainTitleTranslateY;
  final double mainTitleOpacity;
  final Color textColor;
  final double descriptionTranslateY;
  final double descriptionOpacity;
  const SubTitle({
    super.key,
    required this.mainTitleTranslateY,
    required this.mainTitleOpacity,
    required this.textColor,
    required this.descriptionTranslateY,
    required this.descriptionOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(0, mainTitleTranslateY),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 16),
            opacity: mainTitleOpacity,
            child: Center(
              child: Text(
                '바로 핵심부터',
                style: TextStyle(
                  fontSize: 34,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Transform.translate(
          offset: Offset(0, descriptionTranslateY),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 16),
            opacity: descriptionOpacity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  '잎사이 프로젝트에 적용한 모든 기술입니다. 상세한 내용은 클릭해주세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: textColor, height: 1.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SubTitleNoAnimation extends StatelessWidget {
  const SubTitleNoAnimation({super.key});

  double _getMainTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return 28.sp;
    if (width <= 400) return 31.sp;
    return 34.sp;
  }

  double _getDescriptionFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return 14.sp;
    if (width <= 400) return 15.sp;
    return 16.sp;
  }

  EdgeInsets _getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= 350) return EdgeInsets.symmetric(horizontal: 20.w);
    if (width <= 400) return EdgeInsets.symmetric(horizontal: 30.w);
    return EdgeInsets.symmetric(horizontal: 40.w);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '바로 핵심부터',
            style: TextStyle(
              fontSize: _getMainTitleFontSize(context),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: Padding(
            padding: _getHorizontalPadding(context),
            child: Text(
              '잎사이 프로젝트에 적용한 모든 기술입니다. 상세한 내용은 클릭해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _getDescriptionFontSize(context),
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
