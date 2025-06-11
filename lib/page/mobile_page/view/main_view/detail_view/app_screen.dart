import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/main_view/detail_view/widget/app_page.dart';

class AppScreen extends StatefulWidget {
  final bool isAppPageStart;
  final bool isAppPageScrollStart;
  const AppScreen({
    super.key,
    required this.isAppPageStart,
    required this.isAppPageScrollStart,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Size calculateSize(BuildContext context) {
    if (MediaQuery.of(context).size.width > 330) {
      double width = MediaQuery.of(context).size.height * 0.435;
      if (width > 400) {
        width = 400;
      }
      final double height = width * 1.65;
      return Size(width, height);
    } else {
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
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FirstAppPage(
              width: size.width,
              isAppPageScrollStart: widget.isAppPageScrollStart,
            ),
          ),
        ),
      ),
    );
  }
}
