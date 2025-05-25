import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_page.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_page.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

void main() {
  Injector.init();
  final chromeBrowser = MainService().isChromeBrowser();
  final mobileDevice = MainService().isMobileDevice();
  runApp(MyApp(isChromeBrowser: chromeBrowser, isMobileDevice: mobileDevice));
}

class MyApp extends StatelessWidget {
  final bool isChromeBrowser;
  final bool isMobileDevice;

  const MyApp({
    super.key,
    required this.isChromeBrowser,
    required this.isMobileDevice,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final deviceType = MainService().setScreenSize(width);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      builder: (context, child) {
        ResponsiveSize.init(context);
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: Stack(
        children: [
          // Visibility(
          //   visible: !isMobileDevice,
          //   child: AnimatedOpacity(
          //     duration: const Duration(milliseconds: 300),
          //     opacity: deviceType == 'desktop' ? 1.0 : 0.0,
          //     child: DesktopPage(
          //       isChromeBrowser: isChromeBrowser,
          //       deviceType: deviceType,
          //     ),
          //   ),
          // ),

          // // // 태블릿 화면 (나중에 위젯 추가)
          // Visibility(
          //   visible: isMobileDevice,
          //   child: AnimatedOpacity(
          //     duration: const Duration(milliseconds: 300),
          //     opacity: deviceType == 'tablet' ? 1.0 : 0.0,
          //     child: const Text('tablet'),
          //   ),
          // ),

          // 모바일 화면
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: deviceType == 'mobile' ? 1.0 : 0.0,
            child: MobilePage(
              deviceType: deviceType,
              isMobileDevice: isMobileDevice,
            ),
          ),
        ],
      ),
    );
  }
}
