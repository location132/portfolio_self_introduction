import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:self_introduction_flutter/page/mobile_page/mobile_page.dart';
import 'package:self_introduction_flutter/page/project_detail_page/flutter_projects_page.dart';
import 'package:self_introduction_flutter/page/project_detail_page/flutter_rive_projects_page.dart';
import 'package:self_introduction_flutter/page/project_detail_page/future_projects_page.dart';
import 'package:self_introduction_flutter/service/main_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) {
          final mobileDevice = MainService().isMobileDevice();
          final width = MediaQuery.of(context).size.width;
          final deviceType = MainService().setScreenSize(width);

          return Stack(
            children: [
              Opacity(
                opacity: deviceType == 'mobile' ? 1.0 : 0.0,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 600,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: MobilePage(
                    deviceType: deviceType,
                    isMobileDevice: mobileDevice,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      GoRoute(
        path: '/flutter-projects',
        name: 'flutter-projects',
        builder: (context, state) {
          return const FlutterProjectsPage();
        },
      ),
      GoRoute(
        path: '/flutter-rive-projects',
        name: 'flutter-rive-projects',
        builder: (context, state) {
          return const FlutterRiveProjectsPage();
        },
      ),
      GoRoute(
        path: '/future-projects',
        name: 'future-projects',
        builder: (context, state) {
          return const FutureProjectsPage();
        },
      ),
    ],
  );
}
