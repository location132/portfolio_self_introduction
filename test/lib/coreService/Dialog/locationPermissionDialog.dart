// 위치 권한 다이얼로그 //

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

OverlayEntry? _activeOverlay;

void showLocationPermissionDialog(BuildContext context, VoidCallback onResumed,
    String title, bool isGpsService) {
  // 이미 활성화된 오버레이가 있다면 제거
  _activeOverlay?.remove();

  final overlayState = Overlay.of(context);
  late final OverlayEntry newOverlay;

  void handleDismiss() {
    newOverlay.remove();
    _activeOverlay = null;
    onResumed();
  }

  newOverlay = OverlayEntry(
    builder: (context) => Material(
      type: MaterialType.transparency,
      child: LocationPermissionDialog(
        onDismiss: handleDismiss,
        title: title,
        isGpsService: isGpsService,
      ),
    ),
  );

  _activeOverlay = newOverlay;
  overlayState.insert(newOverlay);
}

class LocationPermissionDialog extends StatefulWidget {
  final VoidCallback onDismiss;
  final String title;
  final bool isGpsService;

  const LocationPermissionDialog({
    super.key,
    required this.onDismiss,
    required this.title,
    required this.isGpsService,
  });

  @override
  State<LocationPermissionDialog> createState() =>
      _LocationPermissionDialogState();
}

class _LocationPermissionDialogState extends State<LocationPermissionDialog>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 블러 효과를 시뮬레이션하는 섀도우 (최적화)
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.65),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: widget.onDismiss,
          behavior: HitTestBehavior.opaque,
          child: const SizedBox.expand(),
        ),
        Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Dialog(
                  insetPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.076),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 20),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff5b5b5b),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !widget.isGpsService,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildButton(
                                  '취소',
                                  const Color(0xff111111),
                                  widget.onDismiss,
                                ),
                                const SizedBox(width: 10),
                                _buildButton(
                                  '설정으로 이동',
                                  const Color(0xFF6FBE8A),
                                  () async {
                                    await ph.openAppSettings();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: widget.isGpsService,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'GPS 활성화 방법',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6FBE8A),
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        '설정 > 개인정보 보호 및 보안 >\n위치 서비스에서 위치 서비스를\n활성화해주세요.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff5b5b5b),
                                          height: 1.5,
                                          fontFamily: 'Pretendard',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: GestureDetector(
                                    onTap: widget.onDismiss,
                                    child: Container(
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '확인',
                                          style: TextStyle(
                                            color: Color(0xFF6FBE8A),
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F5F5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
