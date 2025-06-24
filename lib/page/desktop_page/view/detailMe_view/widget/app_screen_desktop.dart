import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/desktop_page/view/detailMe_view/widget/app_page_desktop.dart';

class AppScreenDesktop extends StatefulWidget {
  final bool isAppPageStart;
  final bool isAppPageScrollStart;

  const AppScreenDesktop({
    super.key,
    required this.isAppPageStart,
    required this.isAppPageScrollStart,
  });

  @override
  State<AppScreenDesktop> createState() => _AppScreenDesktopState();
}

class _AppScreenDesktopState extends State<AppScreenDesktop> {
  Size calculateSize(BuildContext context) {
    if (MediaQuery.of(context).size.height < 1000) {
      double width = 300;
      const double height = 490;
      return Size(width, height);
    }
    double width = 390;
    const double height = 643.5;
    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    final size = calculateSize(context);
    return WidgetAnimation(
      isStart: widget.isAppPageStart,
      beginDy: 0.08,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.04,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppPageDesktop(
              width: size.width,
              isAppPageScrollStart: widget.isAppPageScrollStart,
            ),
          ),
        ),
      ),
    );
  }
}
