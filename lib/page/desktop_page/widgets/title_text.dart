import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/text/styled_text.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';

class TitleText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? titleFontSize;
  final String? description;
  final Color? color;

  const TitleText({
    super.key,
    this.title,
    this.subTitle,
    this.titleFontSize,
    this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 132.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              StyledText.heading(
                text: title ?? '',
                fontSize: titleFontSize ?? 38,
                color: color,
              ),
              StyledText.subHeading(text: subTitle ?? ''),
            ],
          ),
          StyledText.subHeading(text: description ?? ''),
        ],
      ),
    );
  }
}
