import 'package:flutter/material.dart';
import 'package:self_introduction_flutter/%08core_service/di/injector.dart';
import 'package:self_introduction_flutter/%08core_service/util/device_Info_size.dart';
import 'package:self_introduction_flutter/page/main_page/main_page.dart';
import 'package:self_introduction_flutter/page/start_page/start_page.dart';

void main() {
  Injector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      builder: (context, child) {
        ResponsiveSize.init(context); // 반응형 크기 초기화
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler:
                const TextScaler.linear(1.0), // 사용자가 정의한 글자 크기를 무시하고 기본값으로 설정
          ),
          child: child!,
        );
      },
      home: const MainPage(), //StartPage(),
    );
  }
}
