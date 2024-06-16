import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_introduction_flutter/%08core_service/provider.dart';
import 'package:self_introduction_flutter/main_detail/main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScreenChange(),
      child: const MyApp(),
    ),
  );
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
      home: const MainScreen(),
    );
  }
}
