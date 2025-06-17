import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text(
            '바로 핵심부터',
            style: TextStyle(
              fontSize: 34,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              '잎사이 프로젝트에 적용한 모든 기술입니다. 상세한 내용은 클릭해주세요',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
