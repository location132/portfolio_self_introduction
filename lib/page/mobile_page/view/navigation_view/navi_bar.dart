import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/widget/device_selector.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopNavBar(
          deviceType: widget.deviceType,
          onPressed: widget.onPressed,
          onHomePressed: widget.onHomePressed,
          isMenuClicked: widget.isMenuClicked,
        ),
        SizedBox(height: 3.h),
        DeviceSelector(
          deviceType: widget.deviceType,
          isDeviceSelector: widget.isDeviceSelector,
        ),
        SizedBox(height: 10.h),
        AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          height: widget.isDescription ? 80.h : 0,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 234, 233, 233),
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2025년 포트폴리오 모바일 버전에서는\n'
                      '최적화를 위해 데스크탑View보다 적은 애니메이션을',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11.0.sp),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text('사용중입니다.', style: TextStyle(fontSize: 11.0.sp)),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            debugPrint('더 알아보기 클릭됨');
                          },
                          child: Text(
                            '더 알아보기 >',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 11.0.sp,
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
        ),
      ],
    );
  }
}
