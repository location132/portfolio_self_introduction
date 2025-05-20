import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeviceSelector extends StatelessWidget {
  final String deviceType;
  const DeviceSelector({super.key, required this.deviceType});

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    );
    return Row(
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
                Text(deviceType == 'mobile' ? '✓' : '',
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
                Text(deviceType == 'tablet' ? '✓' : '',
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
                Text(deviceType == 'desktop' ? '✓' : '',
                    style: const TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
