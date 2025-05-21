import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:self_introduction_flutter/page/mobile_page/view/navigation_view/animation/device_ani.dart';

class DeviceSelector extends StatefulWidget {
  final String deviceType;
  final bool isDeviceSelector;
  const DeviceSelector({
    super.key,
    required this.deviceType,
    required this.isDeviceSelector,
  });

  @override
  State<DeviceSelector> createState() => _DeviceSelectorState();
}

class _DeviceSelectorState extends State<DeviceSelector>
    with TickerProviderStateMixin {
  late DeviceAnimation _deviceAnimation;

  @override
  void initState() {
    super.initState();
    _deviceAnimation = DeviceAnimation(vsync: this);
  }

  @override
  void didUpdateWidget(DeviceSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDeviceSelector) {
      _deviceAnimation.forward();
    }
  }

  @override
  void dispose() {
    _deviceAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    );
    return SlideTransition(
      position: _deviceAnimation.moveShow,
      child: FadeTransition(
        opacity: _deviceAnimation.opacityShow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mobile
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/Images/iphone.svg', height: 50),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text('Mobile', style: labelStyle),
                    const SizedBox(width: 10),
                    Text(widget.deviceType == 'mobile' ? '✓' : '',
                        style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),

            // Tablet
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/Images/ipad.svg', height: 50),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text('Tablet', style: labelStyle),
                    const SizedBox(width: 10),
                    Text(widget.deviceType == 'tablet' ? '✓' : '',
                        style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),

            // Desktop
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/Images/imac.svg', height: 50),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text('Desktop', style: labelStyle),
                    const SizedBox(width: 10),
                    Text(widget.deviceType == 'desktop' ? '✓' : '',
                        style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
