import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/core_service/di/injector.dart';
import 'package:self_introduction_flutter/core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_page.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

bool isChromeBrowser() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();
  return userAgent.contains('chrome') &&
      !userAgent.contains('edg') &&
      !userAgent.contains('opr');
}

void main() {
  Injector.init();

  final chromeBrowser = isChromeBrowser();

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
      home: MainPage(isChromeBrowser: isChromeBrowser),
    );
  }
}
