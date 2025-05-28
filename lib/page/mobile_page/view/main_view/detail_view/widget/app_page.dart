import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/mobile_animation/widget_animation.dart';

class AppPage extends StatefulWidget {
  final bool isAppPageStart;
  final bool isAppPageTextStart;

  const AppPage({
    super.key,
    required this.isAppPageStart,
    required this.isAppPageTextStart,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Size calculateSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > 330) {
      double width = MediaQuery.of(context).size.height * 0.4;
      if (width > 400) {
        width = 400;
      }
      final double height = width * 1.8;
      return Size(width, height);
    } else {
      //갤럭시 폴드
      double width = MediaQuery.of(context).size.height * 0.4;
      if (width > 400) {
        width = 400;
      }
      final double height = width * 1.68;
      return Size(width, height);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = calculateSize(context);

    return WidgetAnimation(
      isStart: widget.isAppPageStart,
      beginDy: 0.08,
      child: Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).size.width > 350
                  ? MediaQuery.of(context).size.height * 0.06
                  : MediaQuery.of(context).size.height * 0.09,
        ),
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(100),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
