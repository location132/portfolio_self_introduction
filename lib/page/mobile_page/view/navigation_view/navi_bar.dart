import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/components/widget/top_nav_bar.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
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
        const SizedBox(height: 3),
        DeviceSelector(
          deviceType: widget.deviceType,
          isDeviceSelector: widget.isDeviceSelector,
        ),
        const SizedBox(height: 30),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: widget.isDescription ? 75.0 : 0,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 234, 233, 233),
              padding: EdgeInsets.only(
                left: 8.0.sh,
                right: 8.0.sh,
                top: 8.0.sh,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '2025년 포트폴리오 모바일 버전에서는\n'
                    '최적화를 위해 데스크탑View보다 적은 애니메이션을',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('사용중입니다.'),
                      SizedBox(width: 10.sw),
                      InkWell(
                        onTap: () {
                          debugPrint('더 알아보기 클릭됨');
                        },
                        child: const Text(
                          '더 알아보기 >',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
