import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/animation/widget_animation.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/device_selector.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/mobile_intro_notice_card.dart';

class NaviBar extends StatefulWidget {
  final String deviceType;
  final bool isDeviceSelector;
  final bool isDescription;
  final Function() onPressed;
  final Function() onHomePressed;
  final bool isMenuClicked;
  const NaviBar({
    super.key,
    required this.deviceType,
    required this.isDeviceSelector,
    required this.isDescription,
    required this.onPressed,
    required this.onHomePressed,
    required this.isMenuClicked,
  });

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> with SingleTickerProviderStateMixin {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h),
        DeviceSelector(
          deviceType: widget.deviceType,
          isDeviceSelector: widget.isDeviceSelector,
        ),
        SizedBox(height: 10.h),
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          height: widget.isDescription ? 90.h : 0,
          child: Stack(
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 234, 233, 233),
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: _isClicked ? 1.0 : 0.0,
                          child: Text(
                            '2025년 포트폴리오 모바일 버전에서는\n'
                            '최적화를 위해 데스크탑View보다 적은 애니메이션을 사용중입니다.\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11.0.sp),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Flutter 신입은 역시 ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetAnimation(
                              isStart: _isClicked,
                              child: Text(
                                '이정원',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                opacity: !_isClicked ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Mobileintronoticecard(
                  onTap: () {
                    if (_isClicked) {
                      return;
                    }
                    setState(() {
                      _isClicked = !_isClicked;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
