import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_dream/Page/12_naver_map/page/NaverMapApp_page.dart';

@singleton
class NaverMapOverlayService {
  static final NaverMapOverlayService _instance =
      NaverMapOverlayService._internal();
  factory NaverMapOverlayService() => _instance;
  NaverMapOverlayService._internal();

  OverlayEntry? _overlayEntry;
  bool _isVisible = false;
  BuildContext? _overlayContext;

  Function? onVisibilityChanged;

  void showNaverMap(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (context) => IgnorePointer(
          ignoring: !_isVisible,
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Material(
              color: Colors.white,
              child: Builder(
                builder: (builderContext) {
                  _overlayContext = builderContext;
                  return const NaverMapAppPage();
                },
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    }

    _isVisible = true;
    onVisibilityChanged?.call(_isVisible);
    _overlayEntry?.markNeedsBuild();
  }

  void hideNaverMap() {
    _isVisible = false;
    onVisibilityChanged?.call(_isVisible);
    _overlayEntry?.markNeedsBuild();
  }

  BuildContext? get overlayContext => _overlayContext;
}
