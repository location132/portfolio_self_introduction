import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:self_introduction_flutter/page/mobile_page/mobile_page.dart';
import 'package:self_introduction_flutter/page/desktop_page/desktop_page.dart';
import 'package:self_introduction_flutter/page/projects_main_page/projects_main_page.dart';
import 'package:self_introduction_flutter/page/project_detail_page/project_detail_page.dart';

import 'package:self_introduction_flutter/service/main_service.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ResponsiveHomePage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 300),
            ),
      ),
      GoRoute(
        path: '/projects',
        name: 'projects',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ProjectsMainPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final tween = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 400),
            ),
      ),
      GoRoute(
        path: '/project/ifsai',
        name: 'ifsai_detail',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: ProjectDetailPage(projectName: 'ifsai'),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final tween = Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              transitionDuration: const Duration(milliseconds: 800),
            ),
      ),
      GoRoute(
        path: '/project-detail/ifsai',
        name: 'mobile_ifsai_detail',
        pageBuilder:
            (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: ProjectDetailPage(projectName: 'ifsai'),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final tween = Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeInOut));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              transitionDuration: const Duration(milliseconds: 800),
            ),
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
      _updateVisibility();
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateVisibilityWithDebounce();
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
