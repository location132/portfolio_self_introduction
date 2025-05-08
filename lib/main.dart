import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_page.dart';
import 'package:self_introduction_flutter/service/intro_service.dart';

void main() {
  Injector.init();
  final chromeBrowser = IntroService().isChromeBrowser();
  final touchPoint = IntroService().isPad();
  runApp(MyApp(isChromeBrowser: chromeBrowser, isPad: touchPoint));
}

class MyApp extends StatelessWidget {
  final bool isChromeBrowser;
  final bool isPad;
  const MyApp({
    super.key,
    required this.isChromeBrowser,
    required this.isPad,
  });

  @override
  Widget build(BuildContext context) {
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
      home: MainPage(
        isChromeBrowser: isChromeBrowser,
        isPad: isPad,
      ),
    );
  }
}
