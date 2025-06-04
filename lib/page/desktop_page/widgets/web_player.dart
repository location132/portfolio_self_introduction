import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_introduction_flutter/page/desktop_page/widgets/animation/player_ani.dart';

class WebPlayer extends StatefulWidget {
  final String playerText;
  final bool isPlayerAniOpacity;
  final Function()? onTap;
  const WebPlayer({
    super.key,
    required this.playerText,
    this.isPlayerAniOpacity = false,
    this.onTap,
  });

  @override
  State<WebPlayer> createState() => _WebPlayerState();
}

class _WebPlayerState extends State<WebPlayer> with TickerProviderStateMixin {
  late PlayerAni playerAni;

  @override
  void initState() {
    super.initState();
    playerAni = PlayerAni(vsync: this);
  }

  @override
  void dispose() {
    playerAni.controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant WebPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlayerAniOpacity != widget.isPlayerAniOpacity) {
      playerAni.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: playerAni.width.value,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 15 + playerAni.blur.value,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 6 + (playerAni.blur.value * 0.3),
                offset: const Offset(0, 2),
                spreadRadius: -1,
              ),
            ],
          ),
          child: Opacity(
            opacity: playerAni.textOpacity.value,
            child: Text(
              widget.playerText,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.0.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
