import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_page.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

void main() {
  Injector.init();
  final chromeBrowser = MainService().isChromeBrowser();

  runApp(MyApp(isChromeBrowser: chromeBrowser));
}

class MyApp extends StatelessWidget {
  final bool isChromeBrowser;

  const MyApp({
    super.key,
    required this.isChromeBrowser,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final setSize = MainService().setScreenSize(width);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        builder: (context, child) {
          ResponsiveSize.init(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          );
        },
        home: Stack(
          children: [
            // 데스크탑 화면
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: setSize == 'desktop' ? 1.0 : 0.0,
              child: DesktopPage(
                isChromeBrowser: isChromeBrowser,
              ),
            ),

            // 태블릿 화면 (나중에 위젯 추가)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: setSize == 'tablet' ? 1.0 : 0.0,
              child: const SizedBox(),
            ),

            // 모바일 화면 (나중에 위젯 추가)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: setSize == 'mobile' ? 1.0 : 0.0,
              child: const SizedBox(),
            ),
          ],
        ));
  }
}
