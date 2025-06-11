import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:self_introduction_flutter/page/mobile_page/mobile_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_page.dart';
import 'package:self_introduction_flutter/page/projects_page/projects_main_page.dart';
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
        path: '/projects',
        name: 'projects',
        builder: (context, state) {
          return const ProjectsMainPage();
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

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  Timer? _debounceTimer;
  bool _showDesktop = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isInitialized = true;
      });
      _updateVisibilityWithDebounce();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInitialized) {
      _updateVisibilityWithDebounce();
    }
  }

  void _updateVisibilityWithDebounce() {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        _updateVisibility();
      }
    });
  }

  void _updateVisibility() {
    final mobileDevice = MainService().isMobileDevice();
    final width = MediaQuery.of(context).size.width;
    final deviceType = MainService().setScreenSize(width);

    final shouldShowDesktop = !mobileDevice && deviceType == 'desktop';

    if (_showDesktop != shouldShowDesktop) {
      setState(() {
        _showDesktop = shouldShowDesktop;
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
    if (!_isInitialized) {
      return const Material(child: Center(child: CircularProgressIndicator()));
    }

    final size = MediaQuery.of(context).size;
    if (size.width <= 0 || size.height <= 0) {
      return const Material(child: Center(child: CircularProgressIndicator()));
    }

    final chromeBrowser = MainService().isChromeBrowser();
    final mobileDevice = MainService().isMobileDevice();
    final width = size.width;
    final deviceType = MainService().setScreenSize(width);
    final height = size.height;

    if (mobileDevice) {
      return Container(
        constraints: BoxConstraints(maxWidth: 600, maxHeight: height),
        child: MobilePage(deviceType: deviceType, isMobileDevice: mobileDevice),
      );
    }

    return Stack(
      children: [
        Opacity(
          opacity: _showDesktop ? 0.0 : 1.0,
          child: IgnorePointer(
            ignoring: _showDesktop,
            child: Container(
              constraints: BoxConstraints(maxWidth: 600, maxHeight: height),
              child: MobilePage(
                deviceType: deviceType,
                isMobileDevice: mobileDevice,
              ),
            ),
          ),
        ),

        Opacity(
          opacity: _showDesktop ? 1.0 : 0.0,
          child: IgnorePointer(
            ignoring: !_showDesktop,
            child: DesktopPage(
              isChromeBrowser: chromeBrowser,
              deviceType: deviceType,
            ),
          ),
        ),
      ],
    );
  }
}
