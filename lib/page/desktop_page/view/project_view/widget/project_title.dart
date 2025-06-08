import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/title_text.dart';

class ProjectTitle extends StatelessWidget {
  final bool isTitleVisible;

  const ProjectTitle({super.key, required this.isTitleVisible});

  @override
  Widget build(BuildContext context) {
    return TitleText(
      title: '더 강력한 개발자로 UP\n  신입 프로젝트를 더욱 멋지게',
      subTitle: '',
      description: '',
      titleFontSize: 34,
      color: Colors.white,
      isVisible: isTitleVisible,
    );
  }
}
