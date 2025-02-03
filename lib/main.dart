import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_introduction_flutter/%08core_service/di/injector.dart';
import 'package:self_introduction_flutter/page/start_page/start_cubit.dart';
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
      home: const StartPage(),
    );
  }
}
