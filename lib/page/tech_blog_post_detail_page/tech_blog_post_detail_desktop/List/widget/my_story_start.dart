import 'package:flutter/material.dart';

class MyStoryStart extends StatelessWidget {
  final bool isBackgroundColorWhite;
  final GlobalKey codeExampleSectionKey;
  final String textTitle;
  final String textSubTitle;
  final String? textSubTitle2;
  const MyStoryStart({
    super.key,
    required this.isBackgroundColorWhite,
    required this.codeExampleSectionKey,
    required this.textTitle,
    required this.textSubTitle,
    this.textSubTitle2 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: isBackgroundColorWhite ? Colors.black : Colors.grey.shade700,
          thickness: 1,
        ),
        const SizedBox(height: 150),
        Center(
          key: codeExampleSectionKey,
          child: Text(
            textTitle,
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Center(
          child: Text(
            textSubTitle,
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        Center(
          child: Text(
            textSubTitle2 ?? '',
            style: TextStyle(
              color: isBackgroundColorWhite ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 150),

        Divider(
          color: isBackgroundColorWhite ? Colors.black : Colors.grey.shade700,
          thickness: 1,
        ),
      ],
    );
  }
}
