import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:self_introduction_flutter/page/mobile_page/mobile_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_page.dart';
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
        builder: (context, state) => const ResponsiveHomePage(),
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

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  Timer? _debounceTimer;
  String? _currentPageType;
  Widget? _currentPage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updatePageWithDebounce();
  }

  void _updatePageWithDebounce() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      _updatePage();
    });
  }

  void _updatePage() {
    final chromeBrowser = MainService().isChromeBrowser();
    final mobileDevice = MainService().isMobileDevice();
    final width = MediaQuery.of(context).size.width;
    final deviceType = MainService().setScreenSize(width);

    String newPageType;
    Widget newPage;

    if (!mobileDevice && deviceType == 'desktop') {
      newPageType = 'desktop';
      newPage = DesktopPage(
        isChromeBrowser: chromeBrowser,
        deviceType: deviceType,
      );
    } else {
      newPageType = 'mobile';
      newPage = Container(
        constraints: BoxConstraints(
          maxWidth: 600,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: MobilePage(deviceType: deviceType, isMobileDevice: mobileDevice),
      );
    }

    if (_currentPageType != newPageType) {
      setState(() {
        _currentPageType = newPageType;
        _currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPage == null) {
      _updatePage();
    }

    return _currentPage ?? const SizedBox();
  }
}
